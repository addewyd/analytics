
&НаСервере
Procedure SaveOptions()
    ObjKey = "Shrfs_Analytics";
    OptKey = "httpservice";
    owner = ИмяПользователя();
    opts = new map;
    
    opts.insert("host", ServiceHost);
    opts.insert("port", ServicePort);
    opts.insert("Орг", Организация);
    opts.insert("Контр99ПЛ", Контр99ПЛ);
    opts.insert("Покупатель", Покупатель);
    opts.insert("Склад", Склад);
    opts.insert("Валюта", Валюта);
    opts.insert("Договор", Договор);
    ХранилищеОбщихНастроек.Сохранить(ObjKey, OptKey, opts,,Owner);
	message("save options");
    
endprocedure


&НаСервере
function RestoreOptions()
    ObjKey = "Shrfs_Analytics";
    OptKey = "httpservice";
    owner = ИмяПользователя();
    
    opts = undefined;
    
    try
        opts = ХранилищеОбщихНастроек.Загрузить(ObjKey, OptKey,,Owner);
    except
        message("restore options failed");
        return Undefined;
    endtry;
    
    if opts <> Undefined then
        ServiceHost = opts["host"];
        ServicePort = opts["port"];
		Организация = opts["Орг"];
		Контр99ПЛ = opts["Контр99ПЛ"];
		Покупатель = opts["Покупатель"];
		Склад = opts["Склад"];
		Валюта = opts["Валюта"];
		Договор = opts["Договор"];
    endif;
	return opts;
	
endfunction

&НаКлиентеНаСервереБезКонтекста
Функция Split(Стр, Разделитель) Экспорт
       м=Новый Массив;
       с=СтрЗаменить(СокрЛП(Стр), Разделитель, Символы.ПС);
       Для к=1 По СтрЧислоСтрок(с) Цикл
              Слово= СокрЛП(СтрПолучитьСтроку(с,к)); //Заодно
               // убрать лишние пробелы
               Если СтрДлина(Слово)>0 Тогда //См. примечание
                      м.Добавить(Слово);
               КонецЕсли;
        КонецЦикла;
        Возврат м;
КонецФункции


&НаСервере
Процедура ПриОткрытииНаСервере()
    RestoreOptions();
КонецПроцедуры


&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ПриОткрытииНаСервере();
КонецПроцедуры


&НаСервере
Процедура ПередЗакрытиемНаСервере()
    SaveOptions();
КонецПроцедуры


&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	ПередЗакрытиемНаСервере();
КонецПроцедуры


&НаКлиенте
Процедура GetVersionCommand(Команда)
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.ResourceAddress = "Version";
	Response = Conn.get(Request);
	r = Response.GetBodyAsString();
	Message(r);
КонецПроцедуры

&НаКлиенте
Процедура TablesCommand(Команда)
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.ResourceAddress = "Tables";
	Response = Conn.get(Request);
	r = Response.GetBodyAsString();
	Message(r);
КонецПроцедуры

&НаКлиенте
Процедура PostCommand(Команда)
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.ResourceAddress = "PostTest";
	Request.SetBodyFromString("some data \n" +
		"Conn = new HTTPConnection(ServiceHost, ServicePort); " +
		"Request = new HTTPRequest();"
	);
	Response = Conn.post(Request);
	r = Response.GetBodyAsString();
	Message(r);
	Conn.Удалить(Request);
КонецПроцедуры


&НаСервере
procedure ChangeRequisites(table, tablename)
	
//	els = Элементы[tablename];
//	a = new Array;
//	for each el in els.ПодчиненныеЭлементы do
//		a.add(el.DataPath);
//		message(el.DataPath);
//		Элементы.Удалить( el );
		//message(el);
//	enddo;
	
  //  ИзменитьРеквизиты(,a);
	
	v = FormAttributeToValue(tablename);
    NewReqs = New array;
            
    for each col in table.columns do
    	NewReqs.Add(
                New РеквизитФормы(
                    Col.Name, Col.ТипЗначения,
                    tablename
                )
            );
    enddo;  
    ИзменитьРеквизиты(NewReqs);

    Для Каждого Колонка Из table.Колонки Цикл
        Колонка.Заголовок = Колонка.Имя + "HEAD";      // ?
        НовыйЭлемент = Элементы.Добавить(
            "" + tablename + "_" + Колонка.Имя, Тип("ПолеФормы"), Элементы[tablename]
        );
        НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
        НовыйЭлемент.ПутьКДанным = tablename + "." + Колонка.Имя;
    КонецЦикла;
    
endProcedure    

&НаСервере
procedure ClearRequisites(tablename)
	
	els = Элементы[tablename];
	a = new Array;
	c = els.ПодчиненныеЭлементы.Count();
	
	
	//for each el in els.ПодчиненныеЭлементы do
	if c > 0 then
	while c > 0 do
		el = els.ПодчиненныеЭлементы[c - 1];
		a.add(el.DataPath);
		message(el.DataPath);
		Элементы.Удалить( el );
		message(el);
		c = c - 1;
	enddo;
	endif;
	
    ИзменитьРеквизиты(,a);
    
endProcedure    


&НаСервере
Процедура SQLS(r)
    Парсер = Новый ЧтениеXML;
    Парсер.УстановитьСтроку(r); 
    Построитель = Новый ПостроительDOM;
    Док = Построитель.Прочитать(Парсер);
	
    
    resp = Док.FirstChild;
	Если (resp.ИмяУзла = "response") Тогда
		XMLtable = new ТаблицаЗначений;
		
		ClearRequisites("qtable");			
        records = resp.ChildNodes;
		
		if records.Count() < 1 then
			//
		else
		
			frec = records[0];
			fields = frec.ChildNodes;
			//colcount = fields.Count();
			for each f in fields do
				nn = f.NodeName;
				
				XMLTable.Columns.Add(nn);
//				message(nn);
			enddo;
		
			For Each record in records Do
							
				rec = XmlTable.Add();
				fields = record.ChildNodes;
				for each f in fields do
					nn = f.NodeName;
				
					rec[nn] = f.TextContent;
//					message(f.TextContent);
				enddo;
										
			enddo;
			
		    ChangeRequisites(XMLTable, "qtable");			
			ValueToFormAttribute(XMLTable, "qtable");

		endif;
	endif;
КонецПроцедуры


&НаКлиенте
Процедура SQL(Команда)
	//sqltext = "select * from tableslist";
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.ResourceAddress = "SQL";
	text = SQLText;
	if  Upper(Left(triml(text),6)) <> "SELECT" then
		Message("incorrect sql");
		return;
	endif;
	
	Request.SetBodyFromString(text);
	Response = Conn.post(Request);
	r = Response.GetBodyAsString();
	Message(r);
	qtable.Очистить();
	
	//qtable.Очистить();
	SQLS(r);
	Conn.Удалить(Request);
КонецПроцедуры

&НаСервере
Процедура PostContrНаСервере()
	data = "<?xml version=" + """" + "1.0" + """" + " encoding=""windows-1251""?>" 
	+ char(13) + char(10) + "<contragents>";
    Запрос = Новый Запрос;
    Запрос.Текст = 
        "ВЫБРАТЬ *
        |ИЗ
        |   Справочник.Контрагенты КАК Контрагенты";
 
    РезультатЗапроса = Запрос.Выполнить();
 
    Выборка = РезультатЗапроса.Выбрать();
 
    Пока Выборка.Следующий() Цикл

		data = data + "<record>";
		data = data + "<code>"+Выборка.Партнер.Код+"</code>";
		data = data + "<name>"+Выборка.Наименование+"</name>";
		data = data + "</record>";
        Сообщить(Выборка.Партнер.Код + " "+	Выборка.Наименование);
    КонецЦикла;
	
	// Отправить нахрен всё на сервис
	
	data = data + "</contragents>";
	
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.Заголовки.Вставить("ContentType", "text/xml; charset=windows-1251");
	Request.ResourceAddress = "PostContr";
	Request.SetBodyFromString(data,"windows-1251");
	Response = Conn.post(Request);
	r = Response.GetBodyAsString();
	Message(r);
	
КонецПроцедуры

// ..................................................................................

&НаКлиенте
Процедура PostContr(Команда)
	PostContrНаСервере();
КонецПроцедуры

&НаСервере
Процедура PostDOgНаСервере()
	data = "<?xml version=" + """" + "1.0" + """" + " encoding=""windows-1251""?>" 
	+ char(13) + char(10) + "<contracts>";
	
	Запрос = Новый Запрос;
    Запрос.Текст = 
        "ВЫБРАТЬ *
        |ИЗ
        |   Справочник.ДоговорыКонтрагентов КАК Договоры";
 
    РезультатЗапроса = Запрос.Выполнить();
 
    Выборка = РезультатЗапроса.Выбрать();
 
    Пока Выборка.Следующий() Цикл
		data = data + "<record>";
		data = data + "<name>"+Выборка.Наименование+"</name>";
		data = data + "<nomer>"+Выборка.Номер+"</nomer>";
		data = data + "<partner_code>"+Выборка.Партнер.Код+"</partner_code>";
		data = data + "</record>";

        Сообщить(Выборка.Наименование + " " + Выборка.Номер + " " + Выборка.Партнер.Код);
    КонецЦикла;
	
	data = data + "</contracts>";
	
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.Заголовки.Вставить("ContentType", "text/xml; charset=windows-1251");
	Request.ResourceAddress = "PostContr";
	Request.SetBodyFromString(data,"windows-1251");
	Response = Conn.post(Request);
	r = Response.GetBodyAsString();
	Message(r);
КонецПроцедуры

// ..................................................................................

&НаКлиенте
Процедура PostDOg(Команда)
	PostDOgНаСервере();
КонецПроцедуры

&НаСервере
function LoadDocsНаСервере(jr)
	
// 0      id: Integer;
// 1     session_id: Integer;
// 2      sessionnum: Integer;
// 3      azscode: String;
// 4      azsextcode: String;
// 5      dir: string;
// 6      sdate: TDateTime;
// 7      clientcode: String;
// 8      clientname: String;
// 9      paymentcode: String;
//10      paymentname: String;
//11      fuelcode: String;
//12      fuelname: String;
//13      volume: Extended;
//14      price: Extended;
//15      density: Extended;
//16      mass: Extended;
//17      nds: String;
//18      sumnds: Extended;
//19      whole: Extended;
//20      amount0: Extended;	
//21	  номер договора
//22	  склад получатель (наименование)
	
	
	Message("Loading documents");
	res = "";	
	L = jr.count();
	post = РежимЗаписиДокумента.Запись;
	Для Каждого el из jr Цикл
		
		ош = "";
		success = "Y";
		
		eDocId = el[0];
		SessionId = el[1];
				
		SessionNum = el[2];
		
		AzsCode = el[3];
		AzsExtCode = el[4];
		Напр = el[5];
		clientcode = el[7];
		clientname = el[8];
		paymentcode = el[9];		
		
		
		fuelcode = el[11];
		fuelname = el[12];
		Объем = el[13];
		Цена = el[14];
		Плотность = el[15];
		СуммаНДС = el[18];
		СуммаСНДС = el[19];
		Сумма = el[20];
		нд = el[21];
		склп = el[22];
		
		СкладПол = Справочники.Склады.НайтиПоНаименованию(склп);
		Если СкладПол = Справочники.Склады.ПустаяСсылка() Тогда
			ош = "Склад " + склп + " не найден";
			Сообщить(ош);
			СкладПол = Склад;
		Иначе
			Сообщить("Склад " + склп + "");
		КонецЕсли;
		
		
		Если Напр = "Расход" Тогда
       		doc = Документы.РеализацияТоваровУслуг.CreateDocument();
		
			message("Новый документ " + SessionId + " АЗС " 
				+ azscode + " Смена " + SessionNum);
		
    	    doc.ХозяйственнаяОперация = Перечисления.ХозяйственныеОперации.РеализацияКлиенту;
			doc.Организация = Организация;
        	doc.Дата = CurrentDate();
			
			doc.Склад = Склад;
            doc.ЦенаВключаетНДС = true;
            doc.НалогообложениеНДС = 
                Перечисления.ТипыНалогообложенияНДС.ПродажаОблагаетсяНДС;
            
            doc.ТипЦеныГСМ = Перечисления.ТипыЦенГСМ.ПоОбъему;
			doc.ДатаПлатежа = CurrentDate();
						
            doc.Валюта = Валюта;
            doc.Кратность = 1;
            doc.Курс = 1;
			doc.ВалютаВзаиморасчетов = Валюта;
			//doc.ФормаОплаты = 
			
			ware = Справочники.Номенклатура.НайтиПоКоду(fuelcode);
			Если ware = Справочники.Номенклатура.ПустаяСсылка() Тогда
				ош = "Товар не найден: " + fuelname + " (" + fuelcode + ")";
				Сообщить(ош);
				success = "N";
			Иначе
				Сообщить("GSM found: " + ware.Наименование);
				т = doc.Товары.Добавить();
				т.Номенклатура = ware;
				//т.Склад = СкладПол;
				
				т.Количество = Объем;
				т.Объем = Объем;
				//
	            т.КоличествоУпаковок = Объем;
    	        т.Цена = Цена;
				т.Сумма = Сумма;
            	т.Плотность = Плотность;
				т.СтавкаНДС = Перечисления.СтавкиНДС.НДС18;
				т.СуммаНДС = СуммаНДС;
				т.СуммаСНДС = СуммаСНДС;
				
			КонецЕсли;
		
			if success = "Y" then
		
				Если paymentcode = "99PL99" Тогда
					Клиент = Контр99ПЛ;
				ИначеЕсли clientcode = "EMPTY" Тогда
					Клиент = Покупатель;
				Иначе
					Клиент = Справочники.Контрагенты.НайтиПоКоду("" + clientcode);
					Если Клиент = Справочники.Контрагенты.ПустаяСсылка() Тогда
						Сообщить("Клиент не найден: " + clientname + " (" + clientcode + ")");
			 			//success= "N";
					ИначеЕсли Клиент = Неопределено Тогда
						Сообщить("Клиент не определён: " + clientname + " (" + clientcode + ")");
						//
					Иначе
						// Найдено
					КонецЕсли;
				КонецЕсли;
			Endif;
			
			doc.Контрагент = Клиент;
			Партнер = Справочники.Партнеры.НайтиПоКоду("" + clientcode);
			
			Если (Партнер = Неопределено) или (Партнер = Справочники.Партнеры.ПустаяСсылка()) Тогда
				doc.Партнер = Клиент.Партнер;
			Иначе
				doc.Партнер = Партнер;
			КонецЕсли;
			
			дог = Справочники.ДоговорыКонтрагентов.НайтиПоРеквизиту("Номер", нд);
			Если (дог = Неопределено) или (дог = Справочники.ДоговорыКонтрагентов.ПустаяСсылка()) Тогда
				doc.Договор = договор;
			Иначе
		        doc.Договор = дог;
			КонецЕсли;
			
			if success = "Y" then
				try
		        	doc.Записать(post);
            		Message("Записано ");
				except
					Инфо = ИнформацияОбОшибке();
					ош = Инфо.Описание;
					Сообщить("Описание='" + ош + "'");
					success = "N";
				endtry;
			endif;
		Иначе
// ...................................................................................			
		    doc = Неопределено; // Перемещение?
			
            doc = Документы.ПеремещениеТоваров.CreateDocument();
            doc.Дата = CurrentDate();
			
			doc.ХозяйственнаяОперация = Перечисления.ХозяйственныеОперации.ПеремещениеТоваров;
			
            doc.СкладОтправитель = Склад;
            doc.СкладПолучатель = СкладПол;
			doc.Организация = Организация;
			ware = Справочники.Номенклатура.НайтиПоКоду(fuelcode);
			Если ware = Справочники.Номенклатура.ПустаяСсылка() Тогда
				ош = "Товар не найден: " + fuelname + " (" + fuelcode + ")";
				Сообщить(ош);
				success = "N";
			Иначе
				Сообщить("GSM found: " + ware.Наименование);
				т = doc.Товары.Добавить();
				т.Номенклатура = ware;
				//т.Склад = СкладПол;
				
				т.Количество = Объем;
				//т.Объем = Объем;
				//
	            т.КоличествоУпаковок = Объем;
    	        //т.Цена = Цена;
				//т.Сумма = Сумма;
            	//т.Плотность = Плотность;
				//т.СтавкаНДС = Перечисления.СтавкиНДС.НДС18;
				//т.СуммаНДС = СуммаНДС;
				//т.СуммаСНДС = СуммаСНДС;
				
			КонецЕсли;
			// ...........................................
			
			if success = "Y" then
				try
		        	doc.Записать(post);
            		Message("Записано ");
				except
					Инфо = ИнформацияОбОшибке();
					ош = Инфо.Описание;
					Сообщить("Описание='" + ош + "'");
					success = "N";
				endtry;
			endif;
			
		КонецЕсли;
		
		res = res + """" + eDocId + ";" +  SessionId + ";" + success + ";" + ош + """";
		L = L - 1;
		if L > 0 then 
			res = res + ",";
		endif;
	КонецЦикла;	
	
	return res;
EndFunction

// ......................................................................................

&НаКлиенте
Процедура LoadDocs(Команда)
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.ResourceAddress = "LoadDocs";
	Response = Conn.get(Request);
	r = Response.GetBodyAsString();
	//Message(r);
	Conn.Удалить(Request);
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(r);
	jr = ПрочитатьJSON(ЧтениеJSON);
	ЧтениеJSON.Закрыть();
	Message(jr);
				
	res = LoadDocsНаСервере(jr);
	
	// send results
	
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.ResourceAddress = "PostLDResults";
	Request.SetBodyFromString(res);
	
	Response = Conn.post(Request);
	r = Response.GetBodyAsString();
	Message(r);
	Conn.Удалить(Request);
	
КонецПроцедуры

&НаСервере
Процедура ОтпрСкладыНаСервере()
	data = "<?xml version=" + """" + "1.0" + """" + " encoding=""windows-1251""?>" 
	+ char(13) + char(10) + "<storages>";
    Запрос = Новый Запрос;
    Запрос.Текст = 
        "ВЫБРАТЬ *
        |ИЗ
        |   Справочник.Склады КАК Склады";
 
    РезультатЗапроса = Запрос.Выполнить();
 
    Выборка = РезультатЗапроса.Выбрать();
 
    Пока Выборка.Следующий() Цикл

		data = data + "<record>";
		data = data + "<code>" 
			//+ Выборка.Код 
			+ "К000"
			+ "</code>";
		data = data + "<name>"+Выборка.Наименование+"</name>";
		data = data + "</record>";
        Сообщить(
			//Выборка.Код 
			"К000"
			+ " " 
			+ Выборка.Наименование);
    КонецЦикла;
	
	data = data + "</storages>";
	
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.Заголовки.Вставить("ContentType", "text/xml; charset=windows-1251");
	Request.ResourceAddress = "PostStorages";
	Request.SetBodyFromString(data,"windows-1251");
	Response = Conn.post(Request);
	r = Response.GetBodyAsString();
	Message(r);
КонецПроцедуры

&НаКлиенте
Процедура ОтпрСклады(Команда)
	ОтпрСкладыНаСервере();
КонецПроцедуры
