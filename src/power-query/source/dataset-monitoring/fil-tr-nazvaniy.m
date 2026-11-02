let
    Источник = Excel.CurrentWorkbook()[Content]{0},
    #"Измененный тип" = Table.ToList(Table.TransformColumnTypes(Источник,{{"Названия столбцов", type text}})),
    #"Замененное значение" = List.ReplaceValue(#"Измененный тип","""","",Replacer.ReplaceText)
in
    #"Замененное значение"
