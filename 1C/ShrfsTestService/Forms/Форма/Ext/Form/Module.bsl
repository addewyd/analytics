
&НаСервере
Procedure SaveOptions()
    ObjKey = "Shrfs_Analytics";
    OptKey = "httpservice";
    owner = ИмяПользователя();
    opts = new map;
    
    opts.insert("host", ServiceHost);
    opts.insert("port", ServicePort);
    
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
Процедура LoadDocsНаСервере()
	Message("Loading documents");
	
КонецПроцедуры

&НаКлиенте
Процедура LoadDocs(Команда)
	Conn = new HTTPConnection(ServiceHost, ServicePort);
	Request = new HTTPRequest();
	Request.ResourceAddress = "LoadDocs";
	Response = Conn.get(Request);
	r = Response.GetBodyAsString();
	Message(r);
	
	LoadDocsНаСервере();
	Conn.Удалить(Request);
	
КонецПроцедуры
