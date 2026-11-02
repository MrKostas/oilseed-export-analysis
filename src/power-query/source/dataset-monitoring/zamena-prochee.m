let
    Источник = Excel.CurrentWorkbook(),
    замена_прочее = Источник{[Name="замена_прочее"]}[Content],
    #"Измененный тип" = Table.TransformColumnTypes(замена_прочее,{{"Найти", type text}, {"Заменить", type text}})
in
    #"Измененный тип"
