let
    Источник = Мониторинг_масло[[Дата]],
    Год = Table.AddColumn(Источник, "Год", each Date.Year([Дата]), Int64.Type),
    Месяц = Table.AddColumn(#"Год", "Месяц", each Date.Month([Дата]), Int64.Type),
    Пользовательский1 = Table.AddColumn(#"Месяц", "Пользовательский", each if [Дата] < Date.FromText("01.09.2019") then "2018/19" else 
if [Дата] < Date.FromText("01.09.2020") then "2019/20" else 
if [Дата] < Date.FromText("01.09.2021") then "2020/21" else 
if [Дата] < Date.FromText("01.09.2022") then "2021/22" else 
if [Дата] < Date.FromText("01.09.2023") then "2022/23" else 
if [Дата] < Date.FromText("01.09.2024") then "2023/24" else 
if [Дата] < Date.FromText("01.09.2025") then "2024/25" else 
if [Дата] < Date.FromText("01.09.2026") then "2025/26" else 
if [Дата] < Date.FromText("01.09.2027") then "2026/27" else 
if [Дата] < Date.FromText("01.09.2028") then "2027/28" else 
if [Дата] < Date.FromText("01.09.2029") then "2028/29" else 
if [Дата] < Date.FromText("01.09.2030") then "2029/30" else "требует добавления условия"),
    #"Переименованные столбцы" = Table.RenameColumns(Пользовательский1,{{"Пользовательский", "Сезон"}}),
    Пользовательский2 = Table.Distinct(#"Переименованные столбцы", {"Дата"})
in
    Пользовательский2
