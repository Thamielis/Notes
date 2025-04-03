# Befehlsreferenz für die ML.NET-CLI

- Artikel
- 18.01.2023

## In diesem Artikel

1. [Übersicht][1]
2. [Beispiele][2]
3. [Befehlsoptionen][3]
4. [DataSet][4]
5. [Testdataset][5]
6. [Validierungsdataset][6]
7. [Bezeichnungsspalte][7]
8. [Artikelspalte][8]
9. [Bewertungsspalte][9]
10. [Benutzerspalte][10]
11. [Spalten ignorieren][11]
12. [Hat Header][12]
13. [Trainingszeit][13]
14. [cache][14]
15. [name][15]
16. [Ausgabepfad][16]
17. [Ausführlichkeit][17]
18. [Hilfe][18]
19. [Siehe auch][19]

Die Befehle `classification`, `regression` und `recommendation` sind die Hauptbefehle, die vom ML.NET-CLI-Tool bereitgestellt werden. Mit diesen Befehlen können Sie ein qualitativ hochwertiges ML.NET-Modell für Klassifizierungs-, Regressions- und Empfehlungsmodelle mithilfe von automatisiertem maschinellen Lernen (AutoML) sowie den C#-Beispielcode generieren, um dieses Modell auszuführen bzw. zu bewerten. Außerdem wird der C#-Code zum Trainieren des Modells für Sie generiert, damit Sie den Algorithmus und die Einstellungen des Modells untersuchen können.

Hinweis

Dieses Thema bezieht sich auf die ML.NET-CLI und ML.NET AutoML, die derzeit als Vorschau verfügbar sind, und das Material kann jederzeit geändert werden.

[][20]

## Übersicht

Verwendungsbeispiel:

```dotnetcli
mlnet regression --dataset "cars.csv" --label-col price
```

Die `mlnet` ML-Aufgabenbefehle (`classification`, `regression`, `recommendation`und `forecasting`) generieren die folgenden Ressourcen:

- Eine serialisierte ZIP-Datei des Modells („bestes Modell"), die sofort verwendet werden kann.
- C#-Code zum Ausführen/Bewerten des generierten Modells.
- C#-Code mit dem Trainingscode, der zur Erstellung dieses Modells verwendet wird.

Die ersten beiden Objekte können direkt in Ihren Endbenutzer-App (ASP.NET Core-Web-App, Dienste, Desktop-App usw.) verwendet werden, um mit dem Modell Vorhersagen zu treffen.

Das dritte Objekt, der Trainingscode, zeigt Ihnen, welchen ML.NET-API-Code die CLI zum Trainieren des generierten Modells verwendet hat, sodass Sie den spezifischen Algorithmus und die Einstellungen des Modells untersuchen können.

[][21]

## Beispiele

Der einfachste CLI-Befehl für ein Klassifizierungsproblem (AutoML leitet den Großteil der Konfiguration aus den bereitgestellten Daten ab):

```dotnetcli
mlnet classification --dataset "customer-feedback.tsv" --label-col Sentiment
```

Ein weiterer einfacher CLI-Befehl für ein Regressionsproblem:

```dotnetcli
mlnet regression --dataset "cars.csv" --label-col Price
```

Erstellen und trainieren Sie ein Klassifizierungsmodell mit einem Trainingsdataset, einem Testdataset und weiteren expliziten Anpassungsargumenten:

```dotnetcli
mlnet classification --dataset "/MyDataSets/Population-Training.csv" --test-dataset "/MyDataSets/Population-Test.csv" --label-col "InsuranceRisk" --cache on --train-time 600
```

[][22]

## Befehlsoptionen

Die `mlnet` ML-Aufgabenbefehle (`classification`, , `regression``recommendation`, `forecasting`und `train`) trainieren mehrere Modelle basierend auf dem bereitgestellten Dataset und ML.NET CLI-Optionen. Diese Befehle wählen außerdem das beste Modell aus, speichern das Modell als serialisierte ZIP-Datei und generieren zugehörigen C#-Code für die Bewertung und das Training.

[][23]

### Klassifizierungsoptionen

Durch das Ausführen von `mlnet classification` wird ein Klassifizierungsmodell trainiert. Wählen Sie diesen Befehl aus, wenn Sie möchten, dass ein ML-Modell Daten in mindestens zwei Klassen kategorisiert (z. B. bei der Standpunktanalyse).

```dotnetcli
mlnet classification

--dataset <path> (REQUIRED)

--label-col <col> (REQUIRED)

--cache <option>

--has-header (Default: true)

--ignore-cols <cols>

--log-file-path <path>

--name <name>

-o, --output <path>

--test-dataset <path>

--train-time <time> (Default: 30 minutes, in seconds)

--validation-dataset <path>

-v, --verbosity <v>

-?, -h, --help

```

[][24]

### Regressionsoptionen

Durch das Ausführen von `mlnet regression` wird ein Regressionsmodell trainiert. Wählen Sie diesen Befehl aus, wenn Sie möchten, dass ein ML-Modell einen numerischen Wert vorhersagt (z. B. Preisvorhersage).

```dotnetcli
mlnet regression

--dataset <path> (REQUIRED)

--label-col <col> (REQUIRED)

--cache <option>

--has-header (Default: true)

--ignore-cols <cols>

--log-file-path <path>

--name <name>

-o, --output <path>

--test-dataset <path>

--train-time <time> (Default: 30 minutes, in seconds)

--validation-dataset <path>

-v, --verbosity <v>

-?, -h, --help

```

[][25]

### Empfehlungsoptionen

Durch das Ausführen von `mlnet recommendation` wird ein Empfehlungsmodell trainiert. Wählen Sie diesen Befehl aus, wenn Sie möchten, dass ein ML-Modell Benutzern Artikel auf der Grundlage von Bewertungen (z. B. Produktempfehlungen) empfiehlt.

```dotnetcli
mlnet recommendation

--dataset <path> (REQUIRED)

--item-col <col> (REQUIRED)

--rating-col <col> (REQUIRED)

--user-col <col> (REQUIRED)

--cache <option>

--has-header (Default: true)

--log-file-path <path>

--name <name>

-o, --output <path>

--test-dataset <path>

--train-time <time> (Default: 30 minutes, in seconds)

--validation-dataset <path>

-v, --verbosity <v>

-?, -h, --help

```

Ungültige Eingabeoptionen bewirken, dass das CLI-Tool eine Liste gültiger Eingaben und eine Fehlermeldung ausgibt.

[][26]

### Vorhersageoptionen

Die Ausführung `mlnet forecasting` trainiert ein Zeitreihenvorhersagemodell. Wählen Sie diesen Befehl aus, wenn ein ML-Modell einen Wert basierend auf Verlaufsdaten (z. B. Umsatzprognosen) vorhersagen soll.

```dotnetcli
mlnet forecasting

--dataset <dataset> (REQUIRED)

--horizon <horizon> (REQUIRED)

--label-col <label-col> (REQUIRED)

--time-col <time-col> (REQUIRED)

--cache <Auto|Off|On>

--has-header

--log-file-path <log-file-path>

--name <name>

-o, --output <output>

--test-dataset <test-dataset>

--train-time <train-time>

-v, --verbosity <verbosity>

```

[][27]

### Zugoptionen

Beim Ausführen `mlnet train` wird ein Modell basierend auf einer vom Modell-Generator generierten "mbconfig"-Datei trainiert. Damit dieser Befehl funktioniert, müssen sich die Trainingsdaten im selben Verzeichnis wie die Datei "mbconfig" befinden.

```dotnetcli
-training-config <training-config> (REQUIRED)

--log-file-path <log-file-path>

-v, --verbosity <verbosity>
```

[][28]

## DataSet

`--dataset | -d` (Zeichenfolge)

Dieses Argument stellt den Dateipfad zu einer der folgenden Optionen bereit:

- _A: Die gesamte Datasetdatei:_ Wenn Sie diese Option verwenden und der Benutzer das `--test-dataset` und das `--validation-dataset` nicht bereitstellt, werden intern Kreuzvalidierungen (k-fach, etc.) oder automatisierte Verfahren zur Aufteilung das Daten für die Validierung des Modells verwendet. In diesem Fall muss der Benutzer nur den Dateipfad zum Dataset angeben.

- _B: Die Datei für das Trainingsdataset:_ Wenn der Benutzer auch Datasets für die Modellvalidierung bereitstellt (mit `--test-dataset` und optional `--validation-dataset`), dann bedeutet das Argument `--dataset`, dass nur das „Trainingsdataset" vorhanden ist. Wenn Sie beispielsweise 80%-20%ig-Ansatz zur Validierung der Modellqualität und zum Ermitteln von Genauigkeitsmetriken verwenden, enthält das „Trainingsdataset" 80 % der Daten und das „Testdataset" 20 % der Daten.

[][29]

## Testdataset

`--test-dataset | -t` (Zeichenfolge)

Dateipfad, der auf die Datei des Testdatasets zeigt, z.B. bei Verwendung eines 80%-20%-Ansatzes bei regelmäßigen Validierungen zur Ermittlung von Genauigkeitsmetriken.

Bei der Verwendung des `--test-dataset` ist auch das `--dataset` erforderlich.

Das `--test-dataset`\-Argument ist optional, sofern das „--validation-dataset" verwendet wird. In diesem Fall muss der Benutzer die drei Argumente verwenden.

[][30]

## Validierungsdataset

`--validation-dataset | -v` (Zeichenfolge)

Dateipfad, der auf die Datei für das Validierungsdataset zeigt. Das Validierungsdataset ist in jedem Fall optional.

Bei der Verwendung des `validation dataset` sollte folgendes Verhalten auftreten:

- Es sind auch die `test-dataset`\- und `--dataset`\-Argumente erforderlich.

- Das `validation-dataset`\-Dataset wird verwendet, um den Vorhersagefehler für die Modellauswahl zu schätzen.

- Das `test-dataset` wird zur Beurteilung des Generalisierungsfehlers des endgültig ausgewählten Modells verwendet. Idealerweise sollte das Testset in einem „Tresor" aufbewahrt werden und erst am Ende der Datenanalyse zur Anwendung kommen.

Grundsätzlich wird bei die Validierungsphase bei Verwendung eines `validation dataset` plus des `test dataset` in zwei Teile aufgeteilt:

1. Im ersten Teil betrachten Sie einfach Ihre Modelle und wählen den leistungsstärksten Ansatz anhand der Validierungsdaten (=Validierung) aus.
2. Dann schätzen Sie die Genauigkeit des gewählten Ansatzes (=Test).

Daher sollten die Daten im Verhältnis 80/10/10 oder 75/15/10 geteilt werden. Zum Beispiel:

- Die Datei `training-dataset` sollte 75 % der Daten enthalten.
- Die Datei `validation-dataset` sollte 15 % der Daten enthalten.
- Die Datei `test-dataset` sollte 10 % der Daten enthalten.

In jedem Fall entscheidet der Benutzer anhand der CLI, die die bereits aufgeteilten Dateien bereitstellt, über die Prozentangaben.

[][31]

## Bezeichnungsspalte

`--label-col` (ganze Zahl oder Zeichenfolge)

Mit diesem Argument kann eine bestimmte Zielspalte (die Variable, die Sie vorhersagen möchten) angegeben werden, indem Sie den im Header des Dataset festgelegten Namen der Spalte oder den numerischen Index der Spalte in der Datasetdatei (Spaltenindexwerte beginnen bei 0) verwenden.

Dieses Argument wird für Probleme bei der _Klassifizierung_ und der _Regression_ verwendet.

[][32]

## Artikelspalte

`--item-col` (ganze Zahl oder Zeichenfolge)

Die Artikelspalte enthält die Liste der Artikel, die von Benutzern bewertet werden (Artikel werden Benutzern empfohlen). Diese Spalte kann angegeben werden, indem Sie den im Header des Dataset festgelegten Namen der Spalte oder den numerischen Index der Spalte in der Datasetdatei (Spaltenindexwerte beginnen bei 0) verwenden.

Dieses Argument wird nur für den _Empfehlungstask_ verwendet.

[][33]

## Bewertungsspalte

`--rating-col` (ganze Zahl oder Zeichenfolge)

Die Bewertungsspalte enthält die Liste der Bewertungen, die Benutzer für Artikel abgeben. Diese Spalte kann angegeben werden, indem Sie den im Header des Dataset festgelegten Namen der Spalte oder den numerischen Index der Spalte in der Datasetdatei (Spaltenindexwerte beginnen bei 0) verwenden.

Dieses Argument wird nur für den _Empfehlungstask_ verwendet.

[][34]

## Benutzerspalte

`--user-col` (ganze Zahl oder Zeichenfolge)

Die Benutzerspalte enthält die Liste der Benutzer, die Bewertungen für Artikel abgeben. Diese Spalte kann angegeben werden, indem Sie den im Header des Dataset festgelegten Namen der Spalte oder den numerischen Index der Spalte in der Datasetdatei (Spaltenindexwerte beginnen bei 0) verwenden.

Dieses Argument wird nur für den _Empfehlungstask_ verwendet.

[][35]

## Spalten ignorieren

`--ignore-columns` (Zeichenfolge)

Mit diesem Argument können Sie vorhandene Spalten in der Datasetdatei ignorieren, sodass sie nicht geladen und nicht in den Trainingsprozessen verwendet werden.

Geben Sie die Namen der Spalten an, die Sie ignorieren möchten. Verwenden Sie „, „ (Komma mit Leerzeichen) oder „ „ (Leerzeichen), um mehrere Spaltennamen zu trennen. Sie können Anführungszeichen für Spaltennamen verwenden, die Leerzeichen enthalten (z.B. „ist angemeldet").

Beispiel:

`--ignore-columns email, address, id, logged_in`

[][36]

## Hat Header

`--has-header` (Bool)

Geben Sie an, ob die Datasetdatei(en) eine Kopfzeile enthält/enthalten. Dabei sind folgende Werte möglich:

- `true`
- `false`

Die ML.NET-CLI versucht, diese Eigenschaft zu erkennen, wenn dieses Argument vom Benutzer nicht angegeben wird.

[][37]

## Trainingszeit

`--train-time` (Zeichenfolge)

Die maximale Untersuchungs-/Trainingszeit beträgt standardmäßig 30 Minuten.

Dieses Argument legt die maximale Zeit (in Sekunden) für den Prozess fest, um mehrere Trainer und Konfigurationen zu untersuchen. Die konfigurierte Zeit kann überschritten werden, wenn die angegebene Zeit für eine einzelne Iteration zu kurz ist (z.B. 2 Sekunden). In diesem Fall ist die tatsächliche Zeit die erforderliche Zeit, um eine Modellkonfiguration in einer einzigen Iteration zu erstellen.

Die für Iterationen benötigte Zeit kann je nach Größe des Datasets variieren.

[][38]

## cache

`--cache` (Zeichenfolge)

Wenn Sie Caching verwenden, wird das gesamte Trainingsdataset im Speicher geladen.

Bei kleinen und mittleren Datasets kann Caching die Trainingsleistung erheblich verbessern, sodass die Trainingszeit im Vergleich zu einem Training ohne Cache kürzer sein kann.

Bei großen Datasets kann das Laden aller Daten im Speicher jedoch negative Auswirkungen haben, da Sie unter Umständen nicht mehr genügend Speicher zur Verfügung haben. Wenn Sie für das Training mit großen Datasetdateien arbeiten und keinen Cache verwenden, streamt ML.NET Datenblöcke vom Laufwerk, wenn während des Trainings mehr Daten geladen werden müssen.

Sie können folgende Werte angeben:

`on`: Erzwingt, dass während des Trainings der Cache verwendet wird `off`: Erzwingt, dass während des Trainings der Cache nicht verwendet wird `auto`: Je nach AutoML-Heuristiken wird der Cache verwendet oder nicht verwendet. In der Regel verwenden kleine/mittlere Datasets den Cache, und große Datasets verwenden keinen Cache, wenn Sie die Option `auto` verwenden.

Wenn Sie den `--cache`\-Parameter nicht angeben, wird standardmäßig die Cachekonfiguration `auto` verwendet.

[][39]

## name

`--name` (Zeichenfolge)

Der Name für das erstellte Ausgabeprojekt oder die erstellte Projektmappe. Wenn kein Name angegeben ist, wird der Name `sample-{mltask}` verwendet.

Die ML.NET-Modelldatei (ZIP-Datei) erhält ebenfalls denselben Namen.

[][40]

## Ausgabepfad

`--output | -o` (Zeichenfolge)

Stammspeicherort/-ordner für die generierte Ausgabe. Der Standardwert ist das aktuelle Verzeichnis.

[][41]

## Ausführlichkeit

`--verbosity | -v` (Zeichenfolge)

Legt den Ausführlichkeitsgrad für die Standardausgabe fest.

Zulässige Werte sind:

- `q[uiet]`
- `m[inimal]` (standardmäßig)
- `diag[nostic]` (Protokollierung der Informationsebene)

Standardmäßig sollte das CLI-Tool, wenn es funktioniert, ein Mindestfeedback (`minimal`) anzeigen, z. B. dass es funktioniert und, wenn möglich, wie viel Zeit übrig ist oder wie viel Prozent der Zeit abgeschlossen sind.

[][42]

## Hilfe

`-h |--help`

Druckt die Hilfe für den Befehl und eine Beschreibung der einzelnen Parameter für den Befehl aus.

[][43]

## Siehe auch

- [Vorgehensweise: Installieren des ML.NET-CLI-Tools][44]
- [Übersicht über die ML.NET-CLI][45]
- [Tutorial: Stimmungsanalyse über die ML.NET-Befehlszeilenschnittstelle][46]
- [Telemetrie in der ML.NET-CLI][47]

___

## Empfohlener Inhalt

- [Vorbereiten von Daten für die Modellerstellung - ML.NET][48]
    Erfahren Sie, wie Sie Transformationen in ML.NET verwenden können, um Daten für die weitere Verarbeitung oder die Modellerstellung zu manipulieren und vorzubereiten.

- [ML.NET-Metriken - ML.NET][49]
    Verstehen Sie die Metriken, die verwendet werden, um die Leistung eines ML.NET-Modells auszuwerten.

- [Trainieren eines Machine Learning-Modells mit der Kreuzvalidierung - ML.NET][50]
    Erfahren Sie, wie Sie mit der Kreuzvalidierung stabilere Machine Learning-Modelle in ML.NET erstellen. Die Kreuzvalidierung ist eine Trainings- und Modellevaluierungstechnik, die die Daten in mehrere Partitionen unterteilt und mehrere Algorithmen auf diesen Partitionen trainiert.

- [Trainieren und Auswerten eines Modells - ML.NET][51]
    Erfahren Sie, wie Sie mit ML.NET Machine Learning-Modelle erstellen, Metriken erfassen und die Leistung messen können. Ein Machine Learning-Modell identifiziert Muster innerhalb von Trainingsdaten, um anhand von neuen Daten Vorhersagen zu treffen.

- [Datentransformationen - ML.NET][52]
    Untersuchen Sie die in ML.NET unterstützten herausragenden technischen Komponenten.

- [Interpretieren von ML.NET-Modellen mit Permutation Feature Importance - ML.NET][53]
    Verstehen der Wichtigkeit von Modellfeatures mit Permutation Feature Importance (PFI) in ML.NET

- [Erneutes Trainieren eines Modells - ML.NET][54]
    Erfahren Sie, wie Sie ein Modell in ML.NET erneut trainieren.

- [Installieren zusätzlicher ML.NET-Abhängigkeiten - ML.NET][55]
    In diesem Artikel erfahren Sie, wie Sie native Bibliotheken installieren, von denen ML.NET-Pakete abhängig sind, die jedoch nicht in der Installation von NuGet-Paketen enthalten sind.

___

## Zusätzliche Ressourcen

- [Übersicht][56]
- [Beispiele][57]
- [Befehlsoptionen][58]
- [DataSet][59]
- [Testdataset][60]
- [Validierungsdataset][61]
- [Bezeichnungsspalte][62]
- [Artikelspalte][63]
- [Bewertungsspalte][64]
- [Benutzerspalte][65]
- [Spalten ignorieren][66]
- [Hat Header][67]
- [Trainingszeit][68]
- [cache][69]
- [name][70]
- [Ausgabepfad][71]
- [Ausführlichkeit][72]
- [Hilfe][73]
- [Siehe auch][74]

[1]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#overview
[2]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#examples
[3]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#command-options
[4]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#dataset
[5]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#test-dataset
[6]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#validation-dataset
[7]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#label-column
[8]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#item-column
[9]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#rating-column
[10]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#user-column
[11]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ignore-columns
[12]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#has-header
[13]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#train-time
[14]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#cache
[15]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#name
[16]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#output-path
[17]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#verbosity
[18]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#help
[19]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also
[20]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#overview
[21]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#examples
[22]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#command-options
[23]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#classification-options
[24]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#regression-options
[25]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#recommendation-options
[26]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#forecasting-options
[27]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#train-options
[28]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#dataset
[29]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#test-dataset
[30]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#validation-dataset
[31]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#label-column
[32]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#item-column
[33]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#rating-column
[34]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#user-column
[35]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ignore-columns
[36]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#has-header
[37]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#train-time
[38]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#cache
[39]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#name
[40]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#output-path
[41]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#verbosity
[42]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#help
[43]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also
[44]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/how-to-guides/install-ml-net-cli
[45]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/automate-training-with-cli
[46]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/tutorials/sentiment-analysis-cli
[47]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/resources/ml-net-cli-telemetry
[48]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/dotnet/machine-learning/how-to-guides/prepare-data-ml-net?source=recommendations
[49]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/dotnet/machine-learning/resources/metrics?source=recommendations
[50]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/dotnet/machine-learning/how-to-guides/train-machine-learning-model-cross-validation-ml-net?source=recommendations
[51]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/dotnet/machine-learning/how-to-guides/train-machine-learning-model-ml-net?source=recommendations
[52]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/dotnet/machine-learning/resources/transforms?source=recommendations
[53]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/dotnet/machine-learning/how-to-guides/explain-machine-learning-model-permutation-feature-importance-ml-net?source=recommendations
[54]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/dotnet/machine-learning/how-to-guides/retrain-model-ml-net?source=recommendations
[55]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/de-de/dotnet/machine-learning/how-to-guides/install-extra-dependencies?source=recommendations
[56]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#overview
[57]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#examples
[58]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#command-options
[59]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#dataset
[60]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#test-dataset
[61]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#validation-dataset
[62]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#label-column
[63]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#item-column
[64]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#rating-column
[65]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#user-column
[66]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#ignore-columns
[67]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#has-header
[68]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#train-time
[69]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#cache
[70]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#name
[71]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#output-path
[72]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#verbosity
[73]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#help
[74]: chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#see-also
