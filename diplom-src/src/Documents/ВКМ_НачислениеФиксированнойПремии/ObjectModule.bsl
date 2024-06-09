
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	СформироватьДвижения();
		
	Движения.ВКМ_ДополнительныеНачисления.Записать();
	Движения.ВКМ_Удержания.Записать(); 
	
	РассчитатьНДФЛ();
	
	РассчитатьВзаиморасчеты();
		
КонецПроцедуры 

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура СформироватьДвижения()
		
	Для Каждого Строка Из СписокСотрудников Цикл
	
		Движение = Движения.ВКМ_ДополнительныеНачисления.Добавить();
		Движение.ПериодРегистрации = НачалоМесяца(Дата);
		Движение.ВидРасчета = ПланыВидовРасчета.ВКМ_ДополнительныеНачисления.ФиксированнаяПремия;
		Движение.Сотрудник = Строка.Сотрудник;
		Движение.Результат = Строка.СуммаПремии;
		
		Движение = Движения.ВКМ_Удержания.Добавить();
		Движение.ПериодРегистрации = НачалоМесяца(Дата);
		Движение.ВидРасчета = ПланыВидовРасчета.ВКМ_Удержания.НДФЛ;
		Движение.Сотрудник = Строка.Сотрудник;
	КонецЦикла;
				
КонецПроцедуры

Процедура РассчитатьНДФЛ()
	
	Для каждого Запись ИЗ Движения.ВКМ_ДополнительныеНачисления Цикл
		
		Движение = Движения.ВКМ_Удержания[Запись.НомерСтроки - 1];
		Движение.Результат = Запись.Результат / 100 * 13;
		
		Если Движение.Сторно Тогда
			Движение.Результат = - Движение.Результат;
		КонецЕсли;
		
	КонецЦикла;
	
	Движения.ВКМ_Удержания.Записать(, Истина);
	
КонецПроцедуры

Процедура РассчитатьВзаиморасчеты()
	
	Движения.ВКМ_ВзаиморасчетыССотрудниками.Записывать = Истина;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ДополнительныеНачисления.Сотрудник,
	|	ДополнительныеНачисления.Результат
	|ПОМЕСТИТЬ Вт_Начисления
	|ИЗ
	|	РегистрРасчета.ВКМ_ДополнительныеНачисления КАК ДополнительныеНачисления
	|ГДЕ
	|	ДополнительныеНачисления.Регистратор = &Регистратор
	|
	|ОБЪЕДИНИТЬ ВСЕ
	|
	|ВЫБРАТЬ
	|	Удержания.Сотрудник,
	|	-Удержания.Результат
	|ИЗ
	|	РегистрРасчета.ВКМ_Удержания КАК Удержания
	|ГДЕ
	|	Удержания.Регистратор = &Регистратор
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	&ПериодРегистрации КАК период,
	|	Вт_Начисления.Сотрудник КАК Сотрудник,
	|	СУММА(Вт_Начисления.Результат) КАК Сумма
	|ИЗ
	|	Вт_Начисления КАК Вт_Начисления
	|
	|СГРУППИРОВАТЬ ПО
	|	Вт_Начисления.Сотрудник";
		
	Запрос.УстановитьПараметр("Регистратор", Ссылка);
	Запрос.УстановитьПараметр("ПериодРегистрации", НачалоМесяца(Дата));

	Результат = Запрос.Выполнить();
	
	Выборка = Результат.Выбрать();

	Пока Выборка.Следующий() Цикл 
		 Движение = Движения.ВКМ_ВзаиморасчетыССотрудниками.ДобавитьПриход();
		 Движение.Период = НачалоМесяца(Дата);
		 Движение.Сотрудник = Выборка.Сотрудник;
		 Движение.Сумма = Выборка.Сумма;
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли