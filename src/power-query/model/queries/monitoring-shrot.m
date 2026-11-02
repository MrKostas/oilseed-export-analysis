let
    Источник = Excel.Workbook(File.Contents(pSource02), null, true),
    судозаходы_шрот_Table = Источник{[Item="Мониторинг_шрот",Kind="Table"]}[Data],
    #"Измененный тип" = Table.TransformColumnTypes(судозаходы_шрот_Table,{{"Сезон", type text}, {"Дата", type date}, {"Ключ груза", type text}, {"Экспортер", type text}, {"Причал", type any}, {"Порт", type text}, {"Судно", type text}, {"Дедвейт", type text}, {"Страна назначения", type text}, {"Рейд", type any}, {"Группа дедвейта", type text}, {"Вес, т", type number}})
in
    #"Измененный тип"
