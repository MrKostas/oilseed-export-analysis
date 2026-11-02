let
    подключение = Excel.Workbook(File.Contents(pSource01), null, true),
    сырые_данные = Table.PromoteHeaders(подключение{[Item="Масла и шрот",Kind="Sheet"]}[Data], [PromoteAllScalars = true]),
    датасет_масло = Table.SelectRows(сырые_данные, each [Продукт] = "Масло"),
    список_заголовков = Table.ColumnNames(датасет_масло),
    выбираем_столбцы = Table.SelectColumns(датасет_масло, List.Intersect({список_заголовков, фильтр_названий})),
    нейминг_порт = Table.TransformColumns(выбираем_столбцы,{{"Порт", Text.Proper, type text}}),
    столбец_ключ_груза = Table.TransformColumns(нейминг_порт, {{"Культура", each Text.Lower(Text.Start(_, 1)), type text}}),
    переименовываем_столбцы = Table.RenameColumns(столбец_ключ_груза,{{"Культура", "Ключ груза"}, {"Месяц(Год)", "Дата"}}),
    регистр_экспортер_порт_страна = Table.TransformColumns(переименовываем_столбцы,{{"Экспортер", Text.Upper, type text},
                                                                             {"Порт", Text.Upper, type text}, {"Страна назначения", Text.Upper, type text}}),
    усекаем_пробелы_экспортер_порт_страна = Table.TransformColumns(регистр_экспортер_порт_страна, {{"Экспортер", Text.Trim, type text},
                                                                                     {"Порт", Text.Trim, type text}, {"Страна назначения", Text.Upper, type text}}),
    замена_значений = List.Accumulate({0..List.Count(замена_прочее[Найти])-1},
                                    усекаем_пробелы_экспортер_порт_страна,
                                    (state, current) => Table.ReplaceValue(state, замена_прочее[Найти]{current}, замена_прочее[Заменить]{current}, Replacer.ReplaceValue, {"Экспортер", "Порт", "Страна назначения"})),
    столбец_категория_дедвейта = Table.AddColumn(замена_значений, "Группа дедвейта", each try if [Дедвейт] < 5000 then "< 5"
                                                                                            else if [Дедвейт] < 15000 then "5 - 15"
                                                                                            else if [Дедвейт] < 30000 then "15 - 30"
                                                                                            else if [Дедвейт] < 45000 then "30 - 45"
                                                                                            else if [Дедвейт] >= 45000 then "> 45"
                                                                                            else "Неизвестная категория"
                                                                                            otherwise "Неизвестная категория", type text),
    финальная_таблица = Table.TransformColumnTypes(столбец_категория_дедвейта,{{"Сезон", type text}, {"Дата", type date}, {"Причал", type text}, {"Судно", type text}, {"Дедвейт", Int64.Type}, {"Рейд", type text}, {"Транзитное масло", type text}, {"Вес, т", type number}}),
    #"Строки с примененным фильтром" = Table.SelectRows(финальная_таблица, each true)
in
    #"Строки с примененным фильтром"
