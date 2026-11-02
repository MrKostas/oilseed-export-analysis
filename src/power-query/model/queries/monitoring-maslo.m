let
    Источник = Excel.Workbook(File.Contents(pSource02), null, true),
    мониторинг_масло = Источник{[Item="Мониторинг_масло",Kind="Table"]}[Data],
    #"Измененный тип" = Table.TransformColumnTypes(мониторинг_масло,{{"Сезон", type text}, {"Дата", type date}, {"Ключ груза", type text}, {"Порт", type text}, {"Экспортер", type text}, {"Причал", type any}, {"Судно", type text}, {"Группа дедвейта", type text}, {"Вес, т", type number}}),
    #"Строки с примененным фильтром" = Table.SelectRows(#"Измененный тип", each ([Дата] <> null))
in
    #"Строки с примененным фильтром"
