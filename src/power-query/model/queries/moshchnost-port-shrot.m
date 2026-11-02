let
    Источник = Excel.Workbook(File.Contents(pSource03), null, true),
    Мощность_порт_шрот_Sheet = Источник{[Item="Мощность_порт_шрот",Kind="Sheet"]}[Data],
    #"Повышенные заголовки" = Table.PromoteHeaders(Мощность_порт_шрот_Sheet, [PromoteAllScalars=true]),
    #"Измененный тип" = Table.TransformColumnTypes(#"Повышенные заголовки",{{"Бассейн", type text}, {"Порт", type text}, {"Мощность в год", Int64.Type}}),
    #"Текст в верхнем регистре" = Table.TransformColumns(#"Измененный тип",{{"Порт", Text.Upper, type text}})
in
    #"Текст в верхнем регистре"
