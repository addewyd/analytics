
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
КонецПроцедуры
