﻿#language: ru

@tree
@exportscenarios
@ТипШага: Нетология. Диплом.
@Описание: Последовательное выполнение сценариев по заданиям дипломной работы
@ПримерИспользования: И я создаю новый документ ВКМ_ОбслуживаниеКлиента

Функционал: Запуск последовательных сценариев по заданиям дипломной работы.

Как студент я хочу
Записать feature файл для задания 1 дипломной работы, 
чтобы Применить на практике пройденный материал   

Сценарий: Проверка создания "ВКМ_ОбслуживаниеКлиента"
Дано я подключаю профиль TestClient "Диплом.Менеджер"
И я закрываю все окна клиентского приложения
	* Планирование обслуживаний
		** Я создаю первый документ
			И В командном интерфейсе я выбираю 'ВКМ' 'Обслуживание клиента'
			Тогда открылось окно 'Обслуживание клиента'
			И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюСоздать' на элементе формы с именем "Список"
			Тогда открылось окно 'Обслуживание клиента (создание)'
			И поле с именем "Дата" заполнено
		** Я заполняю реквизиты первого документа
			И я нажимаю кнопку выбора у поля с именем "Контрагент"
			Тогда открылось окно 'Контрагенты'
			И в таблице "Список" я перехожу к строке:
				| 'Наименование'        |
				| 'Основной контрагент' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента (создание) *'
			И я нажимаю кнопку выбора у поля с именем "Договор"
			Тогда открылось окно 'Договоры контрагентов'
			И в таблице "Список" я перехожу к строке:
				| 'Наименование'		  |
				| 'Абонентский договор'   |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента (создание) *'
			И я нажимаю кнопку выбора у поля с именем "Специалист"
			Тогда открылось окно 'Сотрудники'
			И в таблице "Список" я перехожу к строке:
				| 'Наименование' |
				| 'Специалист'   |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента (создание) *'
			И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
			И Я запоминаю значение выражения 'ТекущаяДата()' в переменную 'ТекущаяДата1'
			И в поле с именем 'ДатаПроведенияРабот' я ввожу значение переменной "ТекущаяДата1"
			И я нажимаю кнопку выбора у поля с именем "ВремяНачалаРабот"
			И в поле с именем 'ВремяНачалаРабот' я ввожу значение выражения 'НачалоДня(Контекст.ТекущаяДата1) + (60 * 60 * 8)'
			И я нажимаю кнопку выбора у поля с именем "ВремяОкончанияРабот"
			И в поле с именем 'ВремяОкончанияРабот' я ввожу значение выражения 'НачалоДня(Контекст.ТекущаяДата1) + (60 * 60 * 17)'
			И в поле с именем 'ОписаниеПроблемы' я ввожу текст 'Проблема'
			И в поле с именем 'Комментарий' я ввожу текст 'Срочно'
		** Я записываю первый документ
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно 'Обслуживание клиента * от *'
			И Я запоминаю значение поля "Дата" Как '$$$$ДатаДокумента1$$$$'
			И Я запоминаю значение выражения 'Дата($$ДатаДокумента1$$)' в переменную '$$$$ДатаДокумента1$$$$'
			И Я запоминаю значение поля "Номер" Как '$$$$Номер1$$$$'
			И Я закрываю окно 'Обслуживание клиента * от *'
		** Я создаю второй документ
			И В командном интерфейсе я выбираю 'ВКМ' 'Обслуживание клиента'
			Тогда открылось окно 'Обслуживание клиента'
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно 'Обслуживание клиента (создание)'
			И поле с именем "Дата" заполнено
		** Я заполняю реквизиты второго документа
			И я нажимаю кнопку выбора у поля с именем "Контрагент"
			Тогда открылось окно 'Контрагенты'
			И в таблице "Список" я перехожу к строке:
				| 'Наименование'        |
				| 'Основной контрагент' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента (создание) *'
			И я нажимаю кнопку выбора у поля с именем "Договор"
			Тогда открылось окно 'Договоры контрагентов'
			И в таблице "Список" я перехожу к строке:
				| 'Наименование'		  |
				| 'Абонентский договор'   |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента (создание) *'
			И я нажимаю кнопку выбора у поля с именем "Специалист"
			Тогда открылось окно 'Сотрудники'
			И в таблице "Список" я перехожу к строке:
				| 'Наименование' |
				| 'Специалист 2' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента (создание) *'
			И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
			И Я запоминаю значение выражения 'КонецДня(ТекущаяДата())+1' в переменную 'ТекущаяДата2'
			И в поле с именем 'ДатаПроведенияРабот' я ввожу значение переменной "ТекущаяДата2"
			И я нажимаю кнопку выбора у поля с именем "ВремяНачалаРабот"
			И в поле с именем 'ВремяНачалаРабот' я ввожу значение выражения 'НачалоДня(Контекст.ТекущаяДата2) + (60 * 60 * 8)'
			И я нажимаю кнопку выбора у поля с именем "ВремяОкончанияРабот"
			И в поле с именем 'ВремяОкончанияРабот' я ввожу значение выражения 'НачалоДня(Контекст.ТекущаяДата2) + (60 * 60 * 17)'
			И в поле с именем 'ОписаниеПроблемы' я ввожу текст 'Проблема'
			И в поле с именем 'Комментарий' я ввожу текст 'Срочно'
		** Я записываю второй документ
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
			Тогда открылось окно 'Обслуживание клиента * от *'
			И Я запоминаю значение поля "Дата" Как '$$$$ДатаДокумента2$$$$'
			И Я запоминаю значение выражения 'Дата($$ДатаДокумента2$$)' в переменную '$$$$ДатаДокумента2$$$$'
			И Я запоминаю значение поля "Номер" Как '$$$$Номер2$$$$'
			И Я закрываю окно 'Обслуживание клиента * от *'
			Тогда открылось окно 'Обслуживание клиента'
		** Я проверяю созданные документы
			И таблица "Список" содержит строки по шаблону:
				| 'Дата'               | 'Номер'      |
				| '$$ДатаДокумента1$$' | '$$Номер1$$' |
				| '$$ДатаДокумента2$$' | '$$Номер2$$' |
И я закрываю TestClient "Диплом.Менеджер"

Сценарий: Проверка закрытия "ВКМ_ОбслуживаниеКлиента"	
	* Закрытие обслуживаний
		** Я закрываю первый документ
			Дано я подключаю профиль TestClient "Диплом.Специалист"
			И я закрываю все окна клиентского приложения
			И В командном интерфейсе я выбираю 'ВКМ' 'Обслуживание клиента'
			Тогда открылось окно 'Обслуживание клиента'
			И в таблице "Список" я перехожу к строке:
				| 'Дата'               | 'Номер' 	  |
				| '$$ДатаДокумента1$$' | '$$Номер1$$' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента * от *'
			И я выбираю пункт контекстного меню с именем 'ВыполненныеРаботыКонтекстноеМенюДобавить' на элементе формы с именем "ВыполненныеРаботы"
			И в таблице "ВыполненныеРаботы" в поле с именем 'ВыполненныеРаботыОписаниеРабот' я ввожу текст 'Обслуживание'
			И в таблице "ВыполненныеРаботы" я активизирую поле с именем "ВыполненныеРаботыФактическиПотраченоЧасов"
			И в таблице "ВыполненныеРаботы" в поле с именем 'ВыполненныеРаботыФактическиПотраченоЧасов' я ввожу текст '8,00'
			И в таблице "ВыполненныеРаботы" я активизирую поле с именем "ВыполненныеРаботыЧасыКОплатеКлиенту"
			И в таблице "ВыполненныеРаботы" в поле с именем 'ВыполненныеРаботыЧасыКОплатеКлиенту' я ввожу текст '8,00'
			И в таблице "ВыполненныеРаботы" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
			И я жду закрытия окна 'Обслуживание клиента * от * *' в течение 20 секунд
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента * от *'
			И я закрываю TestClient "Диплом.Специалист"
		** Я закрываю второй документ
			Дано я подключаю профиль TestClient "Диплом.Специалист2"
			И я закрываю все окна клиентского приложения
			И В командном интерфейсе я выбираю 'ВКМ' 'Обслуживание клиента'
			Тогда открылось окно 'Обслуживание клиента'
			И в таблице "Список" я перехожу к строке:
				| 'Дата'               | 'Номер' 	  |
				| '$$ДатаДокумента2$$' | '$$Номер2$$' |
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента * от *'
			И я выбираю пункт контекстного меню с именем 'ВыполненныеРаботыКонтекстноеМенюДобавить' на элементе формы с именем "ВыполненныеРаботы"
			И в таблице "ВыполненныеРаботы" в поле с именем 'ВыполненныеРаботыОписаниеРабот' я ввожу текст 'Обслуживание'
			И в таблице "ВыполненныеРаботы" я активизирую поле с именем "ВыполненныеРаботыФактическиПотраченоЧасов"
			И в таблице "ВыполненныеРаботы" в поле с именем 'ВыполненныеРаботыФактическиПотраченоЧасов' я ввожу текст '8,00'
			И в таблице "ВыполненныеРаботы" я активизирую поле с именем "ВыполненныеРаботыЧасыКОплатеКлиенту"
			И в таблице "ВыполненныеРаботы" в поле с именем 'ВыполненныеРаботыЧасыКОплатеКлиенту' я ввожу текст '8,00'
			И в таблице "ВыполненныеРаботы" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
			И я жду закрытия окна 'Обслуживание клиента * от * *' в течение 20 секунд
			И в таблице "Список" я выбираю текущую строку
			Тогда открылось окно 'Обслуживание клиента * от *'
			И я закрываю TestClient "Диплом.Специалист2"

Сценарий: Массовое создание актов от имени Бухгалтера и формирование отчета
* Я запускаю оформление актов	
	Дано я подключаю профиль TestClient "Диплом.БухгалтерИТФирмы"
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'ВКМ' 'Массовое создание актов'
	Тогда открылось окно 'Массовое создание актов'
	И я нажимаю кнопку выбора у поля с именем "Период"
	И в поле с именем 'Период' я ввожу текст '07.2024'
	И в поле с именем 'Период' я ввожу значение выражения '$$ДатаДокумента1$$'
	И я нажимаю на кнопку с именем 'ФормаЗапуститьОперацию'
	И в таблице "Данные" больше 0 строк	
	И Я закрываю окно 'Массовое создание актов'
* Я формирую отчет "Анализ выставленных актов"
	И В командном интерфейсе я выбираю 'ВКМ' 'Анализ выставленных актов'
	Тогда открылось окно 'Основной'
	И я нажимаю кнопку выбора у поля с именем "Период1ДатаНачала"
	И в поле с именем 'Период1ДатаНачала' я ввожу значение выражения 'НачалоМесяца($$ДатаДокумента1$$)'
	И я нажимаю кнопку выбора у поля с именем "Период1ДатаОкончания"
	И в поле с именем 'Период1ДатаОкончания' я ввожу текст 'КонецМесяца($$ДатаДокумента1$$)''
	И я нажимаю на кнопку с именем 'СформироватьОтчет'
	Когда открылось окно 'Основной'
//	Область закомментирована в связи с невозможностью выполнить на учебной версии. Ниже оформлен пример кода для проверки.
//	[ОшибкаВоВремяВыполненияВстроенногоЯзыка]
//    по причине:
//    Ограничение используемой лицензии. Функции печати и сохранения табличного документа в учебной версии недоступны.
//    [ОшибкаИспользованияВстроенногоЯзыка]
//	И в табличном документе "ОтчетТабличныйДокумент" я перехожу к ячейке содержащей текст '$$Номер1$$'
//	И в табличном документе "ОтчетТабличныйДокумент" я перехожу к ячейке содержащей текст '$$Номер2$$'		
	И я закрываю TestClient "Диплом.БухгалтерИТФирмы"

	