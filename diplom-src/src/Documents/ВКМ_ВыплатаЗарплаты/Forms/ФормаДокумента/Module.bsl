
#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура РассчитатьВыплаты(Команда)
	РассчитатьВыплатыНаСервере();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура РассчитатьВыплатыНаСервере()
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ВКМ_ВзаиморасчетыССотрудникамиОстатки.Сотрудник,
	|	ВКМ_ВзаиморасчетыССотрудникамиОстатки.СуммаОстаток КАК Сумма
	|ИЗ
	|	РегистрНакопления.ВКМ_ВзаиморасчетыССотрудниками.Остатки(&Дата,) КАК ВКМ_ВзаиморасчетыССотрудникамиОстатки";
	
	Запрос.УстановитьПараметр("Дата", КонецМесяца(Объект.Дата));
	
	Результат = Запрос.Выполнить();
	
	Если НЕ Результат.Пустой() Тогда
		Выборка = Результат.Выбрать();
		
		Пока Выборка.Следующий() Цикл
			НовСтрока = Объект.Выплаты.Добавить();
			ЗаполнитьЗначенияСвойств(НовСтрока, Выборка);
		КонецЦикла;
	КонецЕсли;
		
КонецПроцедуры

#КонецОбласти
