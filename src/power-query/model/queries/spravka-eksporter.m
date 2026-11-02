let
    Источник = Table.FromList(List.Distinct(List.Combine({Мониторинг_масло[Экспортер], Мониторинг_шрот[Экспортер]}))),
    #"Измененный тип" = Table.TransformColumnTypes(Источник,{{"Column1", type text}})
in
    #"Измененный тип"
