---
created: 2024-07-24T13:13:41 (UTC +02:00)
tags: []
source: https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70
author: 
---

# Create eines speichereffizienten Datenmodells mithilfe von Excel und dem Power Pivot-Add-In - Microsoft-Support

> ## Excerpt
> Erfahren Sie, wie Sie ein Datenmodell so optimieren können, dass es die auf Webhostingplattformen maximal zulässigen Größenanforderungen erfüllt.

---
In Excel 2013 oder höher können Sie Datenmodelle erstellen, die Millionen von Zeilen enthalten, und dann leistungsstarke Datenanalysen für diese Modelle durchführen. Datenmodelle können mit dem Power Pivot-Add-In oder ohne es erstellt werden, um eine beliebige Anzahl von PivotTables, Diagrammen und Power View-Visualisierungen in derselben Arbeitsmappe zu unterstützen.

**Hinweis:** In diesem Artikel werden Datenmodelle in Excel 2013 beschrieben. Die gleichen Datenmodellierungs- und Power Pivot-Features, die in Excel 2013 eingeführt wurden, gelten jedoch auch für Excel 2016. Zwischen diesen Excel-Versionen gibt es im Grunde nur wenig Unterschiede.

Obwohl Sie in Excel ganz einfach sehr umfangreiche Datenmodelle erstellen können, gibt es einige Gründe dafür, dies nicht zu tun. Erstens sind große Modelle mit Unmengen von Tabellen und Spalten in der Regel der Tod der meisten Analysen und liefern äußerst unhandliche Feldlisten. Zweitens belegen große Modell wertvollen Speicherplatz, was sich negativ auf andere Anwendungen und Berichte auswirkt, die dieselben Systemressourcen nutzen. Schließlich beschränken sharePoint Online und Excel Web App in Microsoft 365 die Größe einer Excel-Datei auf 10 MB. Bei Arbeitsmappen-Datenmodellen mit Millionen von Zeilen wird der Grenzwert von 10 MB schnell zum Problem. Weitere Informationen finden Sie unter [Spezifikation und Beschränkungen von Datenmodellen](https://support.microsoft.com/de-de/office/spezifikation-und-beschr%C3%A4nkungen-von-datenmodellen-19aa79f8-e6e8-45a8-9be2-b58778fd68ef).

In diesem Artikel erfahren Sie, wie Sie ein straff konstruiertes Modell erstellen, mit dem sich einfacher arbeiten lässt und das weniger Speicherplatz beansprucht. Sich die Zeit zu nehmen, sich mit bewährten Methoden für effizientes Modelldesign vertraut zu machen, zahlt sich für jedes Modell aus, das Sie erstellen und verwenden, unabhängig davon, ob Sie es in Excel 2013, Microsoft 365 SharePoint Online, auf einem Office Web Apps Server oder in SharePoint 2013 anzeigen.

Überlegen Sie auch, den Workbook Size Optimizer auszuführen. Damit wird die Excel-Arbeitsmappe analysiert und nach Möglichkeit weiter komprimiert. Laden Sie den [Arbeitsmappengrößenoptimierer](https://www.microsoft.com/en-us/download/details.aspx?id=38793) herunter.

## Inhalt dieses Artikels

-   [Komprimierungsverhältnisse und das Modul für die Datenanalyse im Arbeitsspeicher](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850951)
    
-   [Eine Spalte, die nicht vorhanden ist, verbraucht immer noch den wenigsten Speicherplatz](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850952)
    
    -   [Zwei Beispiele für Spalten, die immer ausgeschlossen werden sollten](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850953)
        
    -   [Ausschließen überflüssiger Spalten](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850954)
        
-   [Können nur die notwendigen Zeilen gefiltert werden?](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850955)
    
-   [Wenn die Spalte nun aber doch benötigt wird – lässt sich ihr Platzbedarf dennoch verringern?](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850956)
    
    -   [Ändern von Datetime-Spalten](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850957)
        
    -   [Ändern der SQL-Abfrage](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850958)
        
-   [Verwenden von mittels DAX berechneten Measures anstelle von Spalten](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850959)
    
    -   [Welche 2 Spalten sollten Sie behalten?](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850960)
        
-   [Fazit](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850961)
    
-   [Links zu verwandten Themen](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70#__toc373850962)
    

## Komprimierungsverhältnisse und das Modul für die Datenanalyse im Arbeitsspeicher

Datenmodelle in Excel verwenden zum Speichern von Daten das Modul für die Datenanalyse im Arbeitsspeicher. Das Modul implementiert leistungsstarke Komprimierungsmethoden, um den Speicherplatzbedarf zu verringern, wodurch eine Ergebnismenge so stark verkleinert wird, dass sie nur noch ein Bruchteil der Originalgröße belegt.

Im Durchschnitt können Sie davon ausgehen, dass ein Datenmodell 7- bis 10-mal kleiner ist als dieselben Daten an ihrem Ursprungsort. Wenn Sie beispielsweise 7 MB Daten aus einer SQL Server-Datenbank importieren, kann das Datenmodell in Excel leicht nur 1 MB oder weniger groß sein. Der Grad der tatsächlich erzielten Komprimierung hängt primär von der Anzahl eindeutiger Werte in jeder Spalte ab. Je mehr eindeutige Werte vorhanden sind, desto mehr Speicherplatz wird zu deren Speicherung benötigt.

Nun, warum behandeln wir Komprimierung und eindeutige Werte? Der Grund ist, dass es beim Erstellen eines effizienten Modells, das den Speicherplatzbedarf minimiert, um nichts anderes als Komprimierungsmaximierung geht – und die einfachste Methode, dies zu erreichen, besteht darin, alle Spalten zu entfernen, die nicht wirklich benötigt werden, insbesondere die Spalten, die große Mengen eindeutiger Werte enthalten.

**Hinweis:** Die Unterschiede beim Speicherplatzbedarf für einzelne Spalten können immens sein. In manchen Fällen ist es sogar besser, mehrere Spalten mit wenigen eindeutigen Werten zu haben, statt einer Spalte mit vielen eindeutigen Werten. Der Abschnitt zur Datetime-Optimierung behandelt diese Methode im Detail.

## Eine Spalte, die nicht vorhanden ist, verbraucht immer noch den wenigsten Speicherplatz

Die speichereffizienteste Spalte ist in erster Linie die, die nie importiert wurde. Wenn Sie ein effizientes Modell erstellen möchten, sehen Sie sich jede Spalte an, und fragen Sie sich dabei, ob Sie wirklich zu der Analyse beiträgt, die Sie durchführen möchten. Ist dies nicht der Fall, oder sind Sie sich nicht sicher, lassen Sie die Spalte weg. Sie können jederzeit später neue Spalten hinzufügen, wenn Sie sie benötigen.

### Zwei Beispiele für Spalten, die immer ausgeschlossen werden sollten

Das erste Beispiel verwendet Daten, die aus einem Data Warehouse stammen. In einem Data Warehouse findet man häufig Artefakte von ETL-Prozessen, die Daten im Warehouse laden und aktualisieren. Spalten wie "Erstellungsdatum", "Aktualisierungsdatum" und "ETL-Ausführung" werden beim Laden der Daten erstellt. Keine dieser Spalten wird im Modell benötigt, weshalb alle diese Spalten beim Importieren von Daten deaktiviert werden sollten.

Das zweite Beispiel beinhaltet das Auslassen der primären Schlüsselspalte beim Importieren einer Faktentabelle.

Viele Tabellen, einschließlich Faktentabellen, besitzen primäre Schlüssel. Bei den meisten Tabellen wie solchen, die Kunden-, Mitarbeiter- oder Verkaufsdaten enthalten, möchten Sie den primären Schlüssel haben, damit Sie mit dessen Hilfe Beziehungen im Modell herstellen können.

Hier unterscheiden sich Faktentabellen. Bei einer Faktentabelle wird der primäre Schlüssel verwendet, um jede Zeile eindeutig zu identifizieren. Während dies für Normalisierungszwecke erforderlich ist, ist dies in einem Datenmodell weniger hilfreich, wo Sie nur die Spalten haben möchten, die für die Analyse oder zum Herstellen von Tabellenbeziehungen verwendet werden. Aus diesem Grund sollten Sie beim Importieren aus einer Faktentabelle den primären Schlüssel nicht übernehmen. Primäre Schlüssel in einer Faktentabelle verbrauchen große Mengen von Platz im Modell, ohne dabei von Vorteile zu sein, da sie zum Herstellen von Beziehungen nutzlos sind.

**Hinweis:** In Data Warehouses und mehrdimensionalen Datenbanken werden große Tabellen, die hauptsächlich aus numerischen Daten bestehen, häufig als "Faktentabellen" bezeichnet. Faktentabellen enthalten in der Regel Geschäftsleistungs- oder Transaktionsdaten, z. B. Umsatz- und Kostendatenpunkte, die aggregiert und an Organisationseinheiten, Produkten, Marktsegmenten, geografischen Regionen usw. ausgerichtet sind. Alle Spalten in einer Faktentabelle, die Geschäftsdaten enthalten oder zum Querverweis auf in anderen Tabellen gespeicherte Daten verwendet werden können, sollten in das Modell einbezogen werden, um die Datenanalyse zu unterstützen. Die Spalte, die Sie ausschließen möchten, ist die Primärschlüsselspalte der Faktentabelle, die aus eindeutigen Werten besteht, die nur in der Faktentabelle und nirgendwo sonst vorhanden sind. Da Faktentabellen so umfangreich sind, werden einige der größten Effizienzgewinne bei Modellen aus dem Ausschließen von Zeilen oder Spalten aus Faktentabellen abgeleitet.

### Ausschließen überflüssiger Spalten

Effiziente Modelle enthalten nur die Spalten, die Sie tatsächlich in Ihrer Arbeitsmappe benötigen. Wenn Sie kontrollieren möchten, welche Spalten in das Modell aufgenommen werden, müssen Sie statt des Dialogfelds "Daten importieren" in Excel den [Tabellenimport-Assistenten im Power Pivot-Add-In zum Importieren der Daten verwenden](https://support.microsoft.com/de-de/office/abrufen-von-daten-mithilfe-des-power-pivot-add-ins-f0431904-aab1-49c3-b50c-c6f5d4517a66).

Wenn Sie den Tabellenimport-Assistenten starten, wählen Sie die zu importierenden Tabellen aus.

![Tabellenimport-Assistent im PowerPivot-Add-In](https://support.content.office.net/de-de/media/3592c36e-8535-4e35-b633-407f85b1ed7d.png)

Für jede Tabelle können Sie auf die Schaltfläche "Vorschau & Filter" klicken und die Teile der Tabelle auswählen, die Sie wirklich benötigen. Wir empfehlen Ihnen, zuerst die Auswahl aller Spalten auszuheben und dann die benötigten Spalten zu markieren, nachdem Sie über ihre Erforderlichkeit für die Analyse entschieden haben.

![Vorschaubereich im Tabellenimport-Assistenten](https://support.content.office.net/de-de/media/f726888f-edd1-4021-a257-bbd77e4597f2.png)

## Können nur die notwendigen Zeilen gefiltert werden?

Viele Tabellen in Unternehmensdatenbanken und Data Warehouses enthalten historische Daten, die über lange Zeiträume angesammelt wurden. Darüber hinaus ist es möglich, dass die Tabellen, denen Ihr Interesse gilt, Informationen über Geschäftsbereiche enthalten, die für Ihre spezifische Analyse bedeutungslos sind.

Mit dem Tabellenimport-Assistenten können Sie verlaufsbezogene oder nicht verknüpfte Daten herausfiltern und so viel Platz im Modell sparen. In der folgenden Abbildung wird ein Datumsfilter verwendet, um nur Zeilen abzurufen, die Daten für das aktuelle Jahr enthalten, mit Ausnahme von Verlaufsdaten, die nicht benötigt werden.

![Filterbereich im Tabellenimport-Assistenten](https://support.content.office.net/de-de/media/68643daf-6b4c-41a0-a1c0-cd22f6ab198a.png)

## Wenn die Spalte nun aber doch benötigt wird – lässt sich ihr Platzbedarf dennoch verringern?

Es gibt ein paar zusätzliche Methoden, die Sie anwenden können, um eine Spalte für die Komprimierung zu optimieren. Denken Sie daran, dass die einzige Eigenschaft der Spalte, die sich auf die Komprimierung auswirkt, die Anzahl eindeutiger Werte ist. In diesem Abschnitt erfahren Sie, wie einige Spalten verändert werden können, um die Anzahl eindeutiger Werte zu verringern.

### Ändern von Datetime-Spalten

In vielen Fällen verbrauchen Datetime-Spalten viel Platz. Glücklicherweise gibt es eine Reihe von Methoden zum Verringern des Speicherplatzbedarfs dieses Datentyps. Die Methoden variieren in Abhängigkeit davon, wie Sie die Spalte verwenden und wie vertraut Sie mit dem Erstellen von SQL-Abfragen sind.

Datetime-Spalten enthalten einen Datumsteil und eine Uhrzeit. Wenn Sie sich selbst fragen, ob Sie eine Spalte benötigen, stellen Sie sich diese Frage bei einer Datetime-Spalte mehrmals:

-   Benötige ich den Uhrzeitteil?
    
-   Benötige ich vom Uhrzeitteil die Stunden? ... Minuten? ... Sekunden? ... Millisekunden?
    
-   Habe ich mehrere Datetime-Spalten, weil ich Differenzen zwischen diesen Spalten berechnen möchte, oder lediglich um die Daten nach Jahr, Monat, Quartal usw. zu aggregieren?
    

Ihre Antwort auf jede dieser Fragen bestimmt Ihre Möglichkeiten für den Umgang mit der Datetime-Spalte.

Alle dieser Lösungen machen die Änderung einer SQL-Abfrage erforderlich. Um die Änderung der Abfrage zu vereinfachen, sollten Sie in jeder Tabelle mindestens eine Spalte ausfiltern. Durch das Ausfiltern einer Spalte ändern Sie den Aufbau der Abfrage von einem verkürzten Format (SELECT \*) in eine SELECT-Anweisung, die vollqualifizierte Spaltennamen enthält, die sich wesentlich einfacher ändern lassen.

Lassen Sie uns nun einen Blick auf die Abfragen werfen, die für Sie erstellt werden. Im Dialogfeld "Tabelleneigenschaften" können Sie zum Abfrage-Editor wechseln und die aktuelle SQL-Abfrage für jede Tabelle anzeigen.

![Menüband im PowerPivot-Fenster mit angezeigtem Befehl 'Tabelleneigenschaften'](https://support.content.office.net/de-de/media/656839be-6720-46d9-b418-733b1e82ae18.png)

Wählen Sie in "Tabelleneigenschaften" den **Abfrage-Editor** aus.

![Abfrage-Editor über das Dialogfeld 'Tabelleneigenschaften' öffnen](https://support.content.office.net/de-de/media/c415a01d-9213-429f-b949-3f006710a759.png)

Im Abfrage-Editor wird die SQL-Abfrage angezeigt, mit der die Tabelle aufgefüllt wird. Wenn Sie während des Imports Spalten ausgefiltert hatten, enthält Ihre Abfrage vollqualifizierte Spaltennamen:

![Zum Abrufen der Daten verwendete SQL-Abfrage](https://support.content.office.net/de-de/media/c5e7ac0f-4971-465f-b722-92888fa4fd92.png)

Im Gegensatz dazu wird, wenn Sie eine Tabelle vollständig, also ohne Deaktivierung von Spalten oder Anwendung eines Filters importiert haben, die Abfrage als "Select \* from" angezeigt, was schwieriger zu ändern ist:

![SQL-Abfrage mit kürzerer Standardsyntax](https://support.content.office.net/de-de/media/58229b87-1917-4602-97c6-614fa8ce5072.png)

### Ändern der SQL-Abfrage

Jetzt, wo Sie wissen, wie Sie die Abfrage finden, können Sie sie ändern, um die Größe Ihres Modells weiter zu verringern.

1.  Verwenden Sie bei Spalten, die Währungs- oder Dezimaldaten enthalten, die folgende Syntax, um Dezimalstellen zu entfernen, wenn Sie diese nicht benötigen:
    
    "SELECT ROUND(\[Decimal\_column\_name\],0)… .”
    
    Wenn Sie cents, aber keine Bruchteile von Cents benötigen, ersetzen Sie 0 durch 2. Wenn Sie negative Zahlen verwenden, können Sie auf Einheiten, Zehner, Hunderte usw. runden.
    
2.  Wenn Sie eine Datetime-Spalte namens "dbo.Bigtable.\[Date Time\]" besitzen und den Zeitteil (Time) nicht benötigen, verwenden Sie folgende Syntax, um den Zeitteil zu entfernen:
    
    "SELECT CAST (dbo.Bigtable.\[Date time\] as date) AS \[Date time\]) "
    
3.  Wenn Sie eine Datetime-Spalte namens "dbo.Bigtable.\[Date Time\]" besitzen und sowohl den Datumsteil (Date) als auch den Zeitteil (Time) benötigen, verwenden Sie in der SQL-Abfrage mehrere Spalten anstelle der einzelnen Datetime-Spalte:
    
    "SELECT CAST (dbo.Bigtable.\[Date Time\] as date ) AS \[Date Time\],
    
    datepart(hh, dbo.Bigtable.\[Date Time\]) as \[Date Time Hours\],
    
    datepart(mi, dbo.Bigtable.\[Date Time\]) as \[Date Time Minutes\],
    
    datepart(ss, dbo.Bigtable.\[Date Time\]) as \[Date Time Seconds\],
    
    datepart(ms, dbo.Bigtable.\[Date Time\]) as \[Date Time Milliseconds\]"
    
    Verwenden Sie so viele Spalten, wie Sie benötigen, um jeden Teil in einer getrennten Spalte zu speichern.
    
4.  Wenn Sie Stunden- und Minutenangaben benötigen, diese aber lieber zusammen in einer Zeitspalte haben möchten, können Sie folgend Syntax verwenden:
    
    Timefromparts(datepart(hh, dbo.Bigtable.\[Date Time\]), datepart(mm, dbo.Bigtable.\[Date Time\])) as \[Date Time HourMinute\]
    
5.  Wenn Sie zwei Datetime-Spalten haben, z. B. \[Start Time\] und \[End Time\], Sie aber eigentlich die Zeitdifferenz zwischen beiden Spalten in Sekunden als Spalte namens \[Duration\] benötigen, entfernen Sie beide Spalten aus der Liste, und fügen Sie Folgendes hinzu:
    
    "datediff(ss,\[Start Date\],\[End Date\] as \[Duration\]"
    
    Wenn Sie anstelle von "ss" das Schlüsselwort "ms" verwenden, erhalten Sie die Dauer (Duration) in Millisekunden.
    

## Verwenden von mittels DAX berechneten Measures anstelle von Spalten

Wenn Sie bereits mit der DAX-Ausdruckssprache gearbeitet haben, wissen Sie eventuell schon, dass berechnete Spalten verwendet werden, um neue Spalten auf Grundlage anderer Spalten im Modell abzuleiten, während berechnete Measures einmalig im Modell definiert, und nur ausgewertet werden, wenn sie in einer PivotTable oder einem anderen Bericht verwendet werden.

Eine Speicherplatz sparende Methode besteht darin, normale oder berechnete Spalten durch berechnete Measures zu ersetzen. Das klassische Beispiel hierfür sind "Unit Price" (Einzelpreis), "Quantity" (Menge) und "Total" (Summe). Wenn Sie alle drei haben, können Sie Platz sparen, indem Sie nur zwei beibehalten und die dritte mit DAX berechnen.

### Welche 2 Spalten sollten Sie behalten?

Behalten Sie im vorangehenden Beispiel "Quantity" (Menge) und "Unit Price" (Einzelpreis). Diese beiden haben weniger Werte als "Total" (Summe). Fügen Sie zum Berechnen von "Total" ein berechnetes Measure ähnlich dem folgenden hinzu:

"TotalSales:=sumx('Sales Table','Sales Table'\[Unit Price\]\*'Sales Table'\[Quantity\])"

Berechnete Spalten sind in der Hinsicht wie normale Spalten, dass sie ebenfalls Platz im Modell verbrauchen. Im Gegensatz dazu werden berechnete Measures bei Bedarf berechnet und belegen keinen Speicherplatz.

## Fazit

In diesem Artikel haben wir mehrere Ansätze besprochen, die Ihnen beim Erstellen eines speichereffizienteren Modells hilfreich sein können. Das Reduzieren der Dateigröße und des Speicherplatzbedarfs eines Datenmodells erfolgt durch Verringerung der Gesamtzahl von Spalten und Zeilen sowie der Anzahl eindeutiger Werte, die in den jeweiligen Spalten vorkommen. Nachfolgend einige Methoden, die behandelt wurden:

-   Das Entfernen von Spalten ist natürlich die beste Methode zum Einsparen von Platz. Entscheiden Sie, welche Spalten Sie wirklich benötigen.
    
-   Manchmal können Sie eine Spalte entfernen und durch ein berechnetes Measure in der Tabelle ersetzen.
    
-   Möglicherweise benötigen Sie nicht alle Zeilen in einer Tabelle. Sie können Zeilen im Tabellenimport-Assistenten ausfiltern.
    
-   Im Allgemeinen stellt das Aufteilen einer einzelnen Spalte in mehrere getrennte Teile eine gute Möglichkeit dar, um die Anzahl eindeutiger Werte in einer Spalte zu verringern. Jeder dieser Teile enthält eine kleinere Anzahl eindeutiger Werte und die Gesamtsumme wird geringer sein als die Anzahl in der ursprünglichen Einzelspalte.
    
-   In vielen Fällen benötigen Sie die getrennten Teile auch, um sie in Ihren Berichten als Datenschnitte verwenden zu können. Wo angebracht, können Sie Hierarchien aus Teilen wie Stunden, Minuten und Sekunden erzeugen.
    
-   Häufig enthalten Spalten mehr Informationen als sie wirklich müssten. Angenommen, eine Spalte speichert Dezimalstellen, Aber Sie haben eine Formatierung angewendet, um alle Dezimalstellen auszublenden. Runden kann eine sehr effektive Methode sein, um die Größe einer numerischen Spalte zu verringern.
    

Nachdem Sie nun alle möglichen Schritte unternommen haben, um die Größe der Arbeitsmappe zu verringern, können Sie auch noch den Workbook Size Optimizer ausführen. Damit wird die Excel-Arbeitsmappe analysiert und nach Möglichkeit weiter komprimiert. Laden Sie den [Arbeitsmappengrößenoptimierer](https://www.microsoft.com/en-us/download/details.aspx?id=38793) herunter.

## Links zu verwandten Themen

[Spezifikation und Beschränkungen von Datenmodellen](https://support.microsoft.com/de-de/office/spezifikation-und-beschr%C3%A4nkungen-von-datenmodellen-19aa79f8-e6e8-45a8-9be2-b58778fd68ef)

[Arbeitsmappengrößenoptimierer](https://www.microsoft.com/en-us/download/details.aspx?id=38793)

[Power Pivot: Leistungsstarke Datenanalyse und Datenmodellierung in Excel](https://support.microsoft.com/de-de/office/power-pivot-leistungsstarke-datenanalyse-und-datenmodellierung-in-excel-a9c2c6e2-cc49-4976-a7d7-40896795d045)
