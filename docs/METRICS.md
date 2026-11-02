# Расчёты DAX

TOP 5, объём вне TOP 5 и текстовый перечень участников — отдельные меры с разными назначениями.

Меры загрузки портов используют годовую мощность. Сезонный выбор не нормирует знаменатель на длительность автоматически.

Для масла и шрота границы бассейнов заданы разными способами: через справочник мощности и явный список портов. Их совпадение нужно проверить.

## Объекты модели

Меры, вычисляемые таблицы и столбцы разделены. Для меры/столбца таблица назначения важна: имя файла её не заменяет. Служебные автоматические календари не экспортировались. Выражения взяты из метаданных, а не восстановлены по изображениям.

| Таблица назначения | Объект | Тип | Код |
|---|---|---|---|
| `Мониторинг_масло` | `Сумма_экспорт_масло` | measures | [DAX](../src/dax/measures/01-summa-eksport-maslo.dax) |
| `Мониторинг_масло` | `Сумма_по_компании_масло` | measures | [DAX](../src/dax/measures/02-summa-po-kompanii-maslo.dax) |
| `Мониторинг_масло` | `Сумма_по_портам_масло` | measures | [DAX](../src/dax/measures/03-summa-po-portam-maslo.dax) |
| `Мониторинг_масло` | `Сумма_порты_прочее_масло` | measures | [DAX](../src/dax/measures/04-summa-porty-prochee-maslo.dax) |
| `Мониторинг_масло` | `Сумма_прочее_масло` | measures | [DAX](../src/dax/measures/05-summa-prochee-maslo.dax) |
| `Мониторинг_масло` | `Сумма_экспорт для АЧБ_масло` | measures | [DAX](../src/dax/measures/06-summa-eksport-dlya-achb-maslo.dax) |
| `Мониторинг_масло` | `Мощности_масло для АЧБ` | measures | [DAX](../src/dax/measures/07-moshchnosti-maslo-dlya-achb.dax) |
| `Мониторинг_масло` | `Подсказка_прочие_компании_масло` | measures | [DAX](../src/dax/measures/08-podskazka-prochie-kompanii-maslo.dax) |
| `Мониторинг_масло` | `Подсказка_прочие_порты_масло` | measures | [DAX](../src/dax/measures/09-podskazka-prochie-porty-maslo.dax) |
| `Мониторинг_масло` | `Процент загрузки АЧБ_масло` | measures | [DAX](../src/dax/measures/10-protsent-zagruzki-achb-maslo.dax) |
| `Мониторинг_масло` | `Процент загрузки РФ_масло` | measures | [DAX](../src/dax/measures/11-protsent-zagruzki-rf-maslo.dax) |
| `Мощность_порт_масло` | `Сумма_мощности_масло` | measures | [DAX](../src/dax/measures/12-summa-moshchnosti-maslo.dax) |
| `Мощность_порт_шрот` | `Сумма_мощности_шрот` | measures | [DAX](../src/dax/measures/13-summa-moshchnosti-shrot.dax) |
| `Мониторинг_шрот` | `Мощности_шрот для АЧБ` | measures | [DAX](../src/dax/measures/14-moshchnosti-shrot-dlya-achb.dax) |
| `Мониторинг_шрот` | `Мощности_шрот для ББ` | measures | [DAX](../src/dax/measures/15-moshchnosti-shrot-dlya-bb.dax) |
| `Мониторинг_шрот` | `Подсказка_прочие_компании_шрот` | measures | [DAX](../src/dax/measures/16-podskazka-prochie-kompanii-shrot.dax) |
| `Мониторинг_шрот` | `Подсказка_прочие_порты_шрот` | measures | [DAX](../src/dax/measures/17-podskazka-prochie-porty-shrot.dax) |
| `Мониторинг_шрот` | `Процент загрузки АЧБ_шрот` | measures | [DAX](../src/dax/measures/18-protsent-zagruzki-achb-shrot.dax) |
| `Мониторинг_шрот` | `Процент загрузки ББ_шрот` | measures | [DAX](../src/dax/measures/19-protsent-zagruzki-bb-shrot.dax) |
| `Мониторинг_шрот` | `Процент загрузки РФ_шрот` | measures | [DAX](../src/dax/measures/20-protsent-zagruzki-rf-shrot.dax) |
| `Мониторинг_шрот` | `Сумма_по_компании_шрот` | measures | [DAX](../src/dax/measures/21-summa-po-kompanii-shrot.dax) |
| `Мониторинг_шрот` | `Сумма_по_портам_шрот` | measures | [DAX](../src/dax/measures/22-summa-po-portam-shrot.dax) |
| `Мониторинг_шрот` | `Сумма_порты_прочее_шрот` | measures | [DAX](../src/dax/measures/23-summa-porty-prochee-shrot.dax) |
| `Мониторинг_шрот` | `Сумма_прочее_шрот` | measures | [DAX](../src/dax/measures/24-summa-prochee-shrot.dax) |
| `Мониторинг_шрот` | `Сумма_экспорт для АЧБ_шрот` | measures | [DAX](../src/dax/measures/25-summa-eksport-dlya-achb-shrot.dax) |
| `Мониторинг_шрот` | `Сумма_экспорт для ББ_шрот` | measures | [DAX](../src/dax/measures/26-summa-eksport-dlya-bb-shrot.dax) |
| `Мониторинг_шрот` | `Сумма_экспорт_шрот` | measures | [DAX](../src/dax/measures/27-summa-eksport-shrot.dax) |
| `Справка_порты_прочее` | `Справка_порты_прочее` | calculated-tables | [DAX](../src/dax/calculated-tables/01-spravka-porty-prochee.dax) |
| `Справка_экспортеры_прочее` | `Справка_экспортеры_прочее` | calculated-tables | [DAX](../src/dax/calculated-tables/02-spravka-eksportery-prochee.dax) |
| `Мониторинг_масло` | `Кол-во, тыс. т` | calculated-columns | [DAX](../src/dax/calculated-columns/01-kol-vo-tys-t.dax) |
| `Мониторинг_шрот` | `Вес, тыс. т` | calculated-columns | [DAX](../src/dax/calculated-columns/02-ves-tys-t.dax) |

Исходная логика сохранена, включая отмеченные ограничения. Наличие формулы не доказывает правильность всех фильтров или подключение меры к каждому визуалу. Проверки перечислены в [VALIDATION.md](VALIDATION.md).

[Индекс объектов](../src/dax/object-index.csv) · [Модель](ARCHITECTURE.md) · [Обзор](../README.md).
