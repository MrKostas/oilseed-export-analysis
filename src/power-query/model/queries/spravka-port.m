let
    Источник = Table.FromList(List.Distinct(List.Combine({Мониторинг_масло[Порт], Мониторинг_шрот[Порт]}))),
    #"Измененный тип" = Table.TransformColumnTypes(Источник,{{"Column1", type text}})
in
    #"Измененный тип"
