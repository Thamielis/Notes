---
created: 2024-07-24T13:06:00 (UTC +02:00)
tags: []
source: https://support.microsoft.com/de-de/office/lernprogramm-importieren-von-daten-in-excel-und-erstellen-eines-datenmodells-4b4e5ab4-60ee-465e-8195-09ebba060bf0
author: 
---

# Tutorial: Importieren von Daten in Excel und Erstellen eines Datenmodells - Microsoft-Support

> ## Excerpt
> Tutorial 1: Importieren von Daten in Excel und Erstellen eines Datenmodells. Erfahren Sie, wie Sie Power Pivot, Datenmodelle und Power View verwenden, um Daten zu kombinieren und coole, interaktive Berichte zu erstellen.

---
**Kurzfassung:**    Dieses Lernprogramm ist das erste aus einer Reihe von Lernprogrammen, in denen aufgezeigt wird, wie Sie sich mit den in Excel integrierten Datenkombinierungs- und Datenanalysefeatures vertraut machen. In diesen Lernprogrammen wird eine vollständig neue Excel-Arbeitsmappe erstellt und verfeinert, wird ein Datenmodell erstellt und werden schließlich mit Power View außergewöhnliche interaktive Berichte erstellt. Mit den Lernprogrammen werden die Microsoft Business Intelligence-Features sowie -Funktionen in Excel, PivotTables, Power Pivot und Power View veranschaulicht.

In diesen Lernprogrammen erfahren Sie, wie Sie Daten in Excel importieren und auswerten, ein Datenmodell mit Power Pivot verfeinern sowie interaktive Berichte mit Power View erstellen, die Sie veröffentlichen, schützen und freigeben können.

Zu den Lernprogrammen dieser Reihe gehören die folgenden:

1.  **Importieren von Daten in Excel 2016 und Erstellen eines Datenmodells**
    
2.  [Erweitern von Datenmodellbeziehungen mit Excel, Power Pivot und DAX](https://support.microsoft.com/de-de/office/lernprogramm-erweitern-von-datenmodellbeziehungen-mit-excel-power-pivot-und-dax-cf7197d3-1938-490e-93fb-20371e8dd67a)
    
3.  [Erstellen von kartenbasierten Power View-Berichten](https://support.microsoft.com/de-de/office/lernprogramm-erstellen-von-kartenbasierten-power-view-berichten-62ecd29a-91b8-4e5c-b3b7-4aef9f7ef962)
    
4.  [Einbinden von Internetdaten und Festlegen der Standardeinstellungen von Power View-Berichten](https://support.microsoft.com/de-de/office/lernprogramm-einbinden-von-internetdaten-und-festlegen-der-standardeinstellungen-von-power-view-berichten-a0b627f4-edcb-42fa-9815-646077064a7a)
    
5.  [Power Pivot-Hilfe](https://support.microsoft.com/de-de/office/power-pivot-hilfe-241aac41-92e3-4e46-ae58-2f2cd7dbcf4f)
    
6.  [Erstellen von außergewöhnlichen Power View-Berichten - Teil 2](https://support.microsoft.com/de-de/office/lernprogramm-erstellen-beeindruckender-power-view-berichte-361b1fca-4429-42a2-94a2-e4d5f3e7d170)
    

In diesem Lernprogramm starten Sie mit einer leeren Excel-Arbeitsmappe.

## Dieses Lernprogramm enthält die folgenden Abschnitte:

-   [Importieren von Daten aus einer Datenbank](https://support.microsoft.com/de-de/office/lernprogramm-importieren-von-daten-in-excel-und-erstellen-eines-datenmodells-4b4e5ab4-60ee-465e-8195-09ebba060bf0#__toc358186197)
    
-   [Importieren von Daten aus einem Arbeitsblatt](https://support.microsoft.com/de-de/office/lernprogramm-importieren-von-daten-in-excel-und-erstellen-eines-datenmodells-4b4e5ab4-60ee-465e-8195-09ebba060bf0#__toc358186198)
    
-   [Importieren von Daten über Kopieren und Einfügen](https://support.microsoft.com/de-de/office/lernprogramm-importieren-von-daten-in-excel-und-erstellen-eines-datenmodells-4b4e5ab4-60ee-465e-8195-09ebba060bf0#__toc358186199)
    
-   [Erstellen einer Beziehung zwischen importierten Daten](https://support.microsoft.com/de-de/office/lernprogramm-importieren-von-daten-in-excel-und-erstellen-eines-datenmodells-4b4e5ab4-60ee-465e-8195-09ebba060bf0#__toc358186200)
    
-   [Wissensstand und Prüfung](https://support.microsoft.com/de-de/office/lernprogramm-importieren-von-daten-in-excel-und-erstellen-eines-datenmodells-4b4e5ab4-60ee-465e-8195-09ebba060bf0#__toc358186201)
    

Am Ende dieses Lernprogramms gibt es eine Prüfung, mit der Sie Ihren Wissensstand testen können.

In dieser Lernprogrammreihe werden Daten verwendet, mit denen olympische Medaillen, Gastgeberländer und verschiedene olympische Sportereignisse angegeben werden. Es empfiehlt sich, jedes Lernprogramm der Reihe nach durchzuarbeiten. 

## Importieren von Daten aus einer Datenbank

Dieses Lernprogramm wird mit einer leeren Arbeitsmappe gestartet. Die Zielsetzung für diesen Abschnitt besteht darin, eine Verbindung mit einer externen Datenquelle herzustellen und aus dieser Datenquelle Daten in Excel zu importieren, um sie zu analysieren.

Beginnen Sie, indem Sie einige Daten aus dem Internet herunterladen. In den Daten sind olympische Medaillen beschrieben, und die Daten befinden sich in einer Microsoft Access-Datenbank.

1.  Klicken Sie auf die folgenden Links, um die Dateien herunterzuladen, die in dieser Lernprogrammreihe verwendet werden. Laden Sie jede der vier Dateien an einen leicht zugänglichen Speicherort herunter, z. B. _Downloads_ oder _Eigene Dokumente_, oder in einen neuen Ordner, den Sie erstellen:  
    \> [OlympicMedals.accdb Access-Datenbank](https://download.microsoft.com/download/e/9/8/e981203a-d902-4d63-afbf-424027b1e88c/olympicmedals.accdb)  
    \> [OlympicSports.xlsx Excel-Arbeitsmappe](https://download.microsoft.com/download/f/2/1/f215ee55-3574-4b8f-adbf-4d66379276fb/olympicsports.xlsx)  
    \> [Population.xlsx Excel-Arbeitsmappe](https://download.microsoft.com/download/5/b/d/5bd4a709-de6e-4586-883f-9701ab94e3e5/population.xlsx)  
    \> [DiscImage\_table.xlsx Excel-Arbeitsmappe](https://download.microsoft.com/download/c/1/9/c19a4e9a-9703-4097-8691-c95e740aa48a/discimage_table.xlsx)
    
2.  Öffnen Sie in Excel eine leere Arbeitsmappe.
    
3.  Klicken Sie auf **DATEN > Externe Daten abrufen > Aus Zugriff.** Das Menüband wird dynamisch basierend auf der Breite der Arbeitsmappe angepasst, sodass die Befehle auf dem Menüband geringfügig von den folgenden Bildschirmen abweichen können. Der erste Bildschirm zeigt das Menüband an, wenn eine Arbeitsmappe breit ist, das zweite Bild eine Arbeitsmappe, deren Größe so geändert wurde, dass sie nur einen Teil des Bildschirms einnimmt.
    
    ![Daten aus Access importieren](https://support.content.office.net/de-de/media/9f5b7ddb-753f-4786-8a55-15225746db91.png)![Daten aus Access importieren, kleines Menüband](https://support.content.office.net/de-de/media/1b7601bf-f907-44f6-99c4-425a5b20a695.png)
    
4.  Wählen Sie die Datei "OlympicMedals.accdb" aus, die Sie heruntergeladen haben, und klicken Sie auf **Öffnen**. Es wird das folgende Fenster "Tabelle auswählen" geöffnet, in dem die Tabellen angezeigt werden, die in der Datenbank enthalten sind. Tabellen in einer Datenbank sind mit Arbeitsblättern oder Tabellen in Excel vergleichbar. Aktivieren Sie das Kontrollkästchen **Auswahl mehrerer Tabellen aktivieren**, und wählen Sie alle Tabellen aus. Klicken Sie dann auf **OK**.
    
    ![Dialogfenster 'Tabelle auswählen'](https://support.content.office.net/de-de/media/8edcda6f-1c17-4b62-80cf-ef561b0d868f.png)
    
5.  Das Fenster "Daten importieren" wird angezeigt.
    
    **Hinweis:** Beachten Sie das Kontrollkästchen am unteren Rand des Fensters, mit dem Sie **diese Daten zum Datenmodell hinzufügen** können, wie im folgenden Bildschirm dargestellt. Ein Datenmodell wird automatisch erstellt, wenn Sie zwei oder mehr Tabellen gleichzeitig importieren oder damit arbeiten. Ein Datenmodell integriert die Tabellen und ermöglicht eine umfassende Analyse mithilfe von PivotTables, Power Pivot und Power View. Wenn Sie Tabellen aus einer Datenbank importieren, werden die vorhandenen Datenbankbeziehungen zwischen diesen Tabellen verwendet, um das Datenmodell in Excel zu erstellen. Das Datenmodell ist in Excel transparent, Aber Sie können es direkt mit dem Power Pivot-Add-In anzeigen und ändern. Das Datenmodell wird weiter unten in diesem Tutorial ausführlicher erläutert.
    
    Wählen Sie die Option **PivotTable-Bericht** aus, die die Tabellen in Excel importiert und eine PivotTable für die Analyse der importierten Tabellen vorbereitet, und klicken Sie auf **OK**.
    
    ![Fenster 'Daten importieren'](https://support.content.office.net/de-de/media/eba75c90-8c59-4711-818d-89de57bbcdde.png)
    
6.  Sobald die Daten importiert sind, wird aus den importierten Tabellen eine PivotTable erstellt.
    
    ![Leere PivotTable](https://support.content.office.net/de-de/media/eb903bb4-d831-40dd-b14b-f24087cab9f3.png)
    

Nachdem die Daten in Excel importiert wurden und das Datenmodell automatisch erstellt wurde, können Sie die Daten nun auswerten.

_Durchsuchen von Daten mithilfe einer PivotTable_

Ein Auswerten von importierten Daten ist einfach mithilfe einer PivotTable. In einer PivotTable ziehen Sie Felder (vergleichbar mit Spalten in Excel) aus Tabellen (etwa die Tabellen, die Sie soeben aus der Access-Datenbank importiert haben) in unterschiedliche **Bereiche** der PivotTable, um so anzupassen, wie Ihre Daten in der PivotTable dargestellt werden. Eine PivotTable hat vier Bereiche: **FILTER**, **SPALTEN**, **ZEILEN** und **WERTE**.

![Die vier PivotTable-Felder-Bereiche](https://support.content.office.net/de-de/media/f4d4a9f7-735f-44aa-a672-3d5ccbe50483.png)

Es kann einige Experimente erforderlich sein, um zu bestimmen, in welchen Bereich ein Feld gezogen werden soll. Sie können beliebig viele oder wenige Felder aus Ihren Tabellen ziehen, bis die PivotTable Ihre Daten so anzeigt, wie Sie sie sehen möchten. Sie können dies erkunden, indem Sie Felder in verschiedene Bereiche der PivotTable ziehen. Die zugrunde liegenden Daten sind nicht betroffen, wenn Sie Felder in einer PivotTable anordnen.

Werten Sie die Daten zu den olympischen Medaillen in der PivotTable aus. Beginnen Sie mit Olympiamedaillengewinnern, die nach Disziplin, Medaillentyp sowie Land oder Region des Athleten strukturiert sind.

1.  Erweitern Sie in **PivotTable-Felder** die Tabelle **Medals**, indem Sie auf den Pfeil neben dem Tabellennamen klicken. Suchen Sie nach dem Feld "NOC\_CountryRegion" in der erweiterten Tabelle **Medals**, und ziehen Sie das Feld in den Bereich **SPALTEN**. NOC steht für National Olympic Committee (Nationales Olympisches Komitee), das die Organisationseinheit für ein Land oder eine Region ist.
    
2.  Ziehen Sie aus der Tabelle **Disciplines** das Feld "Discipline" in den Bereich **ZEILEN**.
    
3.  Filtern Sie "Disciplines" so, dass nur fünf Sportarten angezeigt werden: Archery (Bogenschießen), Diving (Tauchen), Fencing (Fechten), Figure Skating (Eiskunstlauf) und Speed Skating (Eisschnelllauf). Dieses Filtern können Sie im Bereich **PivotTable-Felder** oder über den Filter **Zeilenbeschriftungen** direkt in der PivotTable vornehmen.
    
    1.  Klicken Sie auf eine beliebige Stelle in der PivotTable, um sicherzustellen, dass die Excel-PivotTable ausgewählt ist. Zeigen Sie in der Liste **PivotTable-Felder** , in der die Tabelle **Disziplinen** erweitert ist, auf das Feld Disziplin, und rechts neben dem Feld wird ein Dropdownpfeil angezeigt. Klicken Sie auf die Dropdownliste, klicken **Sie auf (Alle auswählen),** um alle Auswahlen zu entfernen. Scrollen Sie dann nach unten, und wählen Sie Bogenschießen, Tauchen, Fencing, Eiskunstlauf und Eisschnelllauf aus. Klicken Sie auf **OK**.
        
    2.  Oder klicken Sie im **Zeilenbeschriftungen**\-Abschnitt der PivotTable auf den Dropdownpfeil neben **Zeilenbeschriftungen**, klicken Sie auf **(Alle anzeigen)**, damit alle Aktivierungen entfernt werden, scrollen nach unten, und wählen Sie "Archery", "Diving", "Fencing", "Figure Skating" und "Speed Skating" aus. Klicken Sie auf **OK**.
        
4.  Ziehen Sie in **PivotTable-Felder** aus der Tabelle **Medals** das Feld "Medal" in den Bereich **WERTE**. Da WERTE numerisch sein müssen, hat Excel "Medal" automatisch in **Anzahl von Medal** geändert.
    
5.  Wählen Sie in der Tabelle **Medals** erneut das Feld "Medal" aus, und ziehen Sie es in den Bereich **FILTER**.
    
6.  Filtern Sie die PivotTable so, dass nur Länder oder Regionen angezeigt werden, die mehr als 90 Medaillen insgesamt haben. Nachstehend wird beschrieben, wie das geht.
    
    1.  Klicken Sie in der PivotTable auf den Dropdownpfeil rechts neben **Spaltenbeschriftungen**.
        
    2.  Zeigen Sie auf **Wertefilter**, und wählen Sie **Größer als...** aus.
        
    3.  Geben Sie **90** in das letzte Feld (das rechte Feld) ein. Klicken Sie auf **OK**.  
        ![Fenster 'Wertefilter'](https://support.content.office.net/de-de/media/403d4f7d-6eee-4b5d-b671-1b8c52308906.png)
        

Ihre PivotTable sieht so ähnlich aus wie auf dem folgenden Screenshot.

![Aktualisierte PivotTable](https://support.content.office.net/de-de/media/08cdf1ed-ae0e-4a35-b0cc-72eb32141d5a.png)

Sie haben nun mit wenig Aufwand eine einfache PivotTable erstellt, die Felder aus drei verschiedenen Tabellen umfasst. Diese Aufgabe war aufgrund der bereits vorhandenen Beziehungen zwischen den Tabellen so einfach. Da Tabellenbeziehungen in der Quelldatenbank vorhanden waren und Sie alle Tabellen in einem einzigen Schritt importiert haben, konnten diese Tabellenbeziehungen von Excel im eigenen Datenmodell wiederhergestellt werden.

Doch was ist, wenn die Daten aus verschiedenen Quellen stammen oder zu einem späteren Zeitpunkt importiert werden? Normalerweise können Sie Beziehungen mit neuen Daten auf Grundlage übereinstimmender Spalten erstellen. Im nächsten Schritt importieren Sie weitere Tabellen und lernen dabei, wie neue Beziehungen erstellt werden.

## Importieren von Daten aus einem Arbeitsblatt

Nun importieren wir Daten aus einer anderen Quelle, dieses Mal aus einer vorhandenen Arbeitsmappe, und geben dann die Beziehungen zwischen unseren vorhandenen Daten und den neuen Daten an. Mithilfe von Beziehungen können Sie Datensammlungen in Excel analysieren und aus den importierten Daten interessante und immersive Visualisierungen erstellen.

Erstellen Sie zunächst ein leeres Arbeitsblatt, und importieren Sie dann Daten aus einer Excel-Arbeitsmappe.

1.  Fügen Sie ein neues Excel-Arbeitsblatt hinzu, und geben Sie diesem den Namen **Sports** (Sportarten).
    
2.  Navigieren Sie zu dem Ordner, der die heruntergeladenen Beispieldatendateien enthält, und öffnen Sie **OlympicSports.xlsx**.
    
3.  Markieren Sie die Daten auf **Sheet1**, und kopieren Sie die Daten. Wenn Sie eine Zelle mit Daten markiert haben, etwa Zelle A1, können Sie STRG + A drücken, um alle benachbarten Daten zu markieren. Schließen Sie die Arbeitsmappe "OlympicSports.xlsx".
    
4.  Platzieren Sie den Cursor auf dem Arbeitsblatt **Sports** in der Zelle A1, und fügen Sie die Daten ein.
    
5.  Drücken Sie bei nach wie vor markierten Daten STRG + T, um die Daten als Tabelle zu formatieren. Sie können die Daten auch über das Menüband als Tabelle formatieren, indem Sie **START > Als Tabelle formatieren** auswählen. Da die Daten Überschriften haben, aktivieren Sie **Tabelle hat Überschriften** im Fenster **Tabelle erstellen** (siehe folgende Abbildung).
    
    ![Fenster 'Tabelle erstellen'](https://support.content.office.net/de-de/media/df3a3ecd-3d81-45ac-b85a-a9d6dfac2432.png)
    
    Das Formatieren der Daten als Tabelle hat viele Vorteile. Sie können einer Tabelle einen Namen zuweisen, sodass sie einfach zu identifizieren ist. Sie können außerdem Beziehungen zwischen Tabellen einrichten, wodurch Auswertungen und Analysen in PivotTables, Power Pivot und Power View ermöglicht werden.
    
6.  Benennen Sie die Tabelle. Suchen Sie in **TABELLENTOOLS > ENTWURF > Eigenschaften** nach dem Feld **Tabellenname**, und geben Sie **Sports** ein. Die Arbeitsmappe sieht wie auf dem folgenden Screenshot aus.  
    ![Eine Tabelle in Excel benennen](https://support.content.office.net/de-de/media/adf88fe6-eaf9-463a-849e-df51d6bc802c.png)
    
7.  Speichern Sie die Arbeitsmappe.
    

## Importieren von Daten über Kopieren und Einfügen

Nachdem Sie Daten aus einer Excel-Arbeitsmappe importiert haben, importieren Sie nun Daten aus einer Tabelle, die sich auf einer Webseite oder einer anderen Quelle befindet, aus der Daten kopiert und in Excel eingefügt werden können. In den folgenden Schritten fügen Sie die olympischen Gastgeberstädte aus einer Tabelle hinzu.

1.  Fügen Sie ein neues Excel-Arbeitsblatt hinzu, und geben Sie diesem den Namen **Hosts** (Gastgeberstädte).
    
2.  Wählen Sie die folgende Tabelle samt Tabellenüberschriften aus, und kopieren Sie die Tabelle.
    

| 
**City**

 | 

**NOC\_CountryRegion**

 | 

**Alpha-2 Code**

 | 

**Edition**

 | 

**Season**

 |
| --- | --- | --- | --- | --- |
| 

Melbourne/Stockholm

 | 

AUS

 | 

AS

 | 

1956

 | 

Sommer

 |
| 

Sydney

 | 

AUS

 | 

AS

 | 

2000

 | 

Sommer

 |
| 

Innsbruck

 | 

AUT

 | 

AT

 | 

1964

 | 

Winter

 |
| 

Innsbruck

 | 

AUT

 | 

AT

 | 

1976

 | 

Winter

 |
| 

Antwerpen

 | 

BEL

 | 

BE

 | 

1920

 | 

Sommer

 |
| 

Antwerpen

 | 

BEL

 | 

BE

 | 

1920

 | 

Winter

 |
| 

Montreal

 | 

CAN

 | 

CA

 | 

1976

 | 

Sommer

 |
| 

Lake Placid

 | 

CAN

 | 

CA

 | 

1980

 | 

Winter

 |
| 

Calgary

 | 

CAN

 | 

CA

 | 

1988

 | 

Winter

 |
| 

St. Moritz

 | 

SUI

 | 

CH

 | 

1928

 | 

Winter

 |
| 

St. Moritz

 | 

SUI

 | 

CH

 | 

1948

 | 

Winter

 |
| 

Peking

 | 

CHN

 | 

RC

 | 

2008

 | 

Sommer

 |
| 

Berlin

 | 

GER

 | 

DE

 | 

1936

 | 

Sommer

 |
| 

Garmisch-Partenkirchen

 | 

GER

 | 

DE

 | 

1936

 | 

Winter

 |
| 

Barcelona

 | 

ESP

 | 

SP

 | 

1992

 | 

Sommer

 |
| 

Helsinki

 | 

FIN

 | 

FI

 | 

1952

 | 

Sommer

 |
| 

Paris

 | 

FRA

 | 

FR

 | 

1900

 | 

Sommer

 |
| 

Paris

 | 

FRA

 | 

FR

 | 

1924

 | 

Sommer

 |
| 

Chamonix

 | 

FRA

 | 

FR

 | 

1924

 | 

Winter

 |
| 

Grenoble

 | 

FRA

 | 

FR

 | 

1968

 | 

Winter

 |
| 

Albertville

 | 

FRA

 | 

FR

 | 

1992

 | 

Winter

 |
| 

London

 | 

GBR

 | 

GB

 | 

1908

 | 

Sommer

 |
| 

London

 | 

GBR

 | 

GB

 | 

1908

 | 

Winter

 |
| 

London

 | 

GBR

 | 

GB

 | 

1948

 | 

Sommer

 |
| 

München

 | 

GER

 | 

DE

 | 

1972

 | 

Sommer

 |
| 

Athen

 | 

GRC

 | 

GR

 | 

2004

 | 

Sommer

 |
| 

Cortina d'Ampezzo

 | 

ITA

 | 

IT

 | 

1956

 | 

Winter

 |
| 

Rom

 | 

ITA

 | 

IT

 | 

1960

 | 

Sommer

 |
| 

Turin

 | 

ITA

 | 

IT

 | 

2006

 | 

Winter

 |
| 

Tokyo

 | 

JPN

 | 

JA

 | 

1964

 | 

Sommer

 |
| 

Sapporo

 | 

JPN

 | 

JA

 | 

1972

 | 

Winter

 |
| 

Nagano

 | 

JPN

 | 

JA

 | 

1998

 | 

Winter

 |
| 

Seoul

 | 

KOR

 | 

ROK

 | 

1988

 | 

Sommer

 |
| 

Mexiko

 | 

MEX

 | 

MX

 | 

1968

 | 

Sommer

 |
| 

Amsterdam

 | 

NED

 | 

NL

 | 

1928

 | 

Sommer

 |
| 

Oslo

 | 

NOR

 | 

NO

 | 

1952

 | 

Winter

 |
| 

Lillehammer

 | 

NOR

 | 

NO

 | 

1994

 | 

Winter

 |
| 

Stockholm

 | 

SWE

 | 

SW

 | 

1912

 | 

Sommer

 |
| 

St. Louis

 | 

USA

 | 

US

 | 

1904

 | 

Sommer

 |
| 

Los Angeles

 | 

USA

 | 

US

 | 

1932

 | 

Sommer

 |
| 

Lake Placid

 | 

USA

 | 

US

 | 

1932

 | 

Winter

 |
| 

Squaw Valley

 | 

USA

 | 

US

 | 

1960

 | 

Winter

 |
| 

Moskau

 | 

RUS

 | 

RU

 | 

1980

 | 

Sommer

 |
| 

Los Angeles

 | 

USA

 | 

US

 | 

1984

 | 

Sommer

 |
| 

Atlanta

 | 

USA

 | 

US

 | 

1996

 | 

Sommer

 |
| 

Salt Lake City

 | 

USA

 | 

US

 | 

2002

 | 

Winter

 |
| 

Sarajevo

 | 

YUG

 | 

YU

 | 

1984

 | 

Winter

 |

1.  Platzieren Sie den Cursor in Excel auf dem Arbeitsblatt **Hosts** in der Zelle A1, und fügen Sie die Daten ein.
    
2.  Formatieren Sie die Daten als Tabelle. Wie in diesem Lernprogramm bereits weiter oben beschrieben, drücken Sie STRG + T, oder wählen Sie **START > Als Tabelle formatieren** aus, damit die Daten als Tabelle formatiert werden. Da die Daten Überschriften haben, aktivieren Sie im angezeigten Fenster **Tabelle erstellen** das Kontrollkästchen **Tabelle hat Überschriften**.
    
3.  Benennen Sie die Tabelle. Suchen Sie in **TABELLENTOOLS > ENTWURF > Eigenschaften** nach dem Feld **Tabellenname**, und geben Sie **Hosts** ein.
    
4.  Markieren Sie die Spalte "Edition" (Austragungsjahr), und formatieren Sie diese Spalte über die Registerkarte **START** als **Zahl** mit 0 Dezimalstellen.
    
5.  Speichern Sie die Arbeitsmappe. Ihre Arbeitsmappe sieht so ähnlich aus wie auf dem folgenden Screemshot.
    

![Hosttabelle](https://support.content.office.net/de-de/media/34270c7b-475b-4068-912e-277a19904f25.png)

Da Sie nun eine Excel-Arbeitsmappe mit Tabellen haben, können Sie Beziehungen zwischen diesen Tabellen erstellen. Über das Erstellen von Beziehungen zwischen Tabellen können Sie die Daten aus den beiden Tabellen kombinieren.

## Erstellen einer Beziehung zwischen importierten Daten

Sie können sofort damit beginnen, Felder in Ihrer PivotTable aus den importierten Tabellen zu verwenden. Wenn Excel nicht ermitteln kann, wie ein Feld in die PivotTable eingebunden werden soll, muss eine Beziehung für das vorhandene Datenmodell eingerichtet werden. In den folgenden Schritten wird erläutert, wie eine Beziehung zwischen Daten erstellt wird, die Sie aus unterschiedlichen Quellen importiert haben.

1.  Klicken Sie auf **Sheet1** oben in**PivotTable-Felder** auf**Alle**, um die vollständige Liste der verfügbaren Tabellen anzuzeigen, wie im folgenden Bildschirm gezeigt.  
    ![Klicken Sie in 'PivotTable-Felder' auf 'ALLE', damit alle verfügbaren Tabellen angezeigt werden.](https://support.content.office.net/de-de/media/3e9fa5aa-b47a-4bc9-ba7d-43131e1f0b86.png)
    
2.  Scrollen Sie in der Liste, um die neuen Tabellen zu sehen, die Sie soeben hinzugefügt haben.
    
3.  Erweitern Sie **Sports**, und wählen Sie **Sport** aus, damit der PivotTable dieses Feld hinzugefügt wird. Sie werden von Excel aufgefordert, eine Beziehung zu erstellen (siehe folgenden Screenshot).  
    ![Die Eingabeaufforderung zum ERSTELLEN... einer Beziehung in 'PivotTable-Felder'](https://support.content.office.net/de-de/media/87f433e4-c3a6-4616-99f1-6332d3b35a35.png)  
     
    
    Diese Aufforderung wird angezeigt, weil Sie Felder aus einer Tabelle verwenden, die kein Bestandteil des zugrundeliegenden Datenmodells ist. Eine Möglichkeit, dem Datenmodell eine Tabelle hinzuzufügen, besteht darin, eine Beziehung zu einer Tabelle zu erstellen, die bereits zum Datenmodell gehört. Damit die Beziehung erstellt werden kann, muss eine der Tabellen eine Spalte mit eindeutigen, nicht wiederholten Werten haben. In den Beispieldaten enthält die Tabelle **Disciplines**, die aus der Datenbank importiert wurde, ein Feld mit Sportartencodes, das den Namen "SportID" hat. Dieselben Sportartencodes gibt es als ein Feld in den Excel-Daten, die Sie importiert haben. Erstellen Sie nun die Beziehung.
    
4.  Klicken Sie auf **ERSTELLEN...** im hervorgehobenen Bereich von **PivotTable-Felder**, damit das Dialogfeld **Beziehung erstellen** angezeigt wird (siehe folgenden Screenshot).
    
    ![Fenster 'Beziehung erstellen'](https://support.content.office.net/de-de/media/bbfcfcb9-253e-41d7-bf98-393c38034efe.png)
    
5.  Wählen Sie in der Dropdownliste von **Tabelle** die Tabelle **Disciplines** aus.
    
6.  Wählen Sie in **Spalte (fremd)** den Eintrag **SportID** aus.
    
7.  Wählen Sie in **Verwandte Tabelle** den Eintrag **Spors** aus.
    
8.  Wählen Sie in **Verwandte Spalte (primär)** den Eintrag **SportID** aus.
    
9.  Klicken Sie auf **OK**.
    

Die PivotTable wird entsprechend der neuen Beziehung geändert. Aber die PivotTable sieht wegen der Anordnung der Felder im Bereich **ZEILEN** noch nicht ganz richtig aus. "Discipline" ist eine Unterkategorie einer Sportart, da das Feld "Discipline" im Bereich **ZEILEN** aber über "Sport" angeordnet ist, ist es nicht ordnungsgemäß platziert. Der folgende Screenshot zeigt diese unerwünschte Anordnung.  
![PivotTable mit unerwünschter Anordnung](https://support.content.office.net/de-de/media/c65cb19f-4ddd-48f7-8092-062ddb83590d.png)

1.  Verschieben Sie im Bereich **ZEILEN** den Bereich Sport über Disziplin. Das ist viel besser, und die PivotTable zeigt die Daten so an, wie Sie sie sehen möchten, wie im folgenden Bildschirm gezeigt.
    
    ![PivotTable mit korrigierter Anordnung](https://support.content.office.net/de-de/media/2bc79c66-9c4e-4950-b40e-9484c3723c51.png)
    

Im Hintergrund erstellt Excel ein Datenmodell, das überall in der Arbeitsmappe in einer beliebigen PivotTable, in einem beliebigen PivotChart, in Power Pivot oder in einem beliebigen Power View-Bericht verwendet werden kann. Tabellenbeziehungen sind die Basis eines Datenmodells und sind die Elemente, die die Navigations und Berechnungswege bestimmen.

Im nächsten Tutorial **Erweitern von Datenmodellbeziehungen mit Excel,** Power Pivot**und DAX** bauen Sie auf den hier gelernten Informationen auf und erweitern das Datenmodell schrittweise mithilfe eines leistungsstarken und visuellen Excel-Add-Ins namens Power Pivot. Außerdem erfahren Sie, wie Sie Spalten in einer Tabelle berechnen und diese berechnete Spalte verwenden, damit Ihrem Datenmodell eine ansonsten nicht verknüpfte Tabelle hinzugefügt werden kann.

## Wissensstand und Prüfung

_Wiederholung des Gelernten_

Sie haben nun eine Excel-Arbeitsmappe, die eine PivotTable enthält, aus der auf Daten in mehreren Tabellen zugegriffen wird, von denen Sie einige gesondert importiert haben. Sie haben gelernt, wie Daten aus einer Datenbank, aus einer anderen Excel-Arbeitsmappe oder durch Kopieren und dann Einfügen in Excel importiert werden können.

Damit diese Daten zusammen auswertbar sind, mussten Sie eine Tabellenbeziehung erstellen, die von Excel dazu verwendet wird, die Zeilen zu verknüpfen. Sie haben außerdem gelernt, dass es für das Erstellen von Beziehungen und das Suchen nach zusammengehörenden Zeilen erforderlich ist, dass eine Tabelle Spalten hat, die mit Daten in einer anderen Tabelle korrelieren.

Sie können nun mit dem nächsten Lernprogramm aus dieser Reihe beginnen. Dies ist der entsprechende Link:

[Lernprogramm: Erweitern von Datenmodellbeziehungen mit Excel, Power Pivot und DAX](https://support.microsoft.com/de-de/office/lernprogramm-erweitern-von-datenmodellbeziehungen-mit-excel-power-pivot-und-dax-cf7197d3-1938-490e-93fb-20371e8dd67a)

PRÜFUNG

Sie möchten feststellen, wie gut Sie sich an das Gelernte erinnern? Nachstehend haben Sie Gelegenheit dazu. In der folgenden kleinen Prüfung werden Features, Möglichkeiten oder Anforderungen hervorgehoben, die Sie in diesem Lernprogramm kennengelernt haben. Am Ende der Seite finden Sie die Antworten. Viel Glück!

**Frage 1:** Warum ist es wichtig, importierte Daten in Tabellen zu konvertieren?

A: Sie müssen importierte Daten nicht in Tabellen konvertieren, weil alle importierten Daten automatisch in Tabellen umgewandelt werden.

B: Wenn Die importierte Daten in Tabellen konvertieren, werden sie aus dem Datenmodell ausgeschlossen. Nur wenn sie aus dem Datenmodell ausgeschlossen sind, sind sie in PivotTables, Power Pivot und Power View verfügbar.

C: Wenn Sie importierte Daten in Tabellen konvertieren, können sie in das Datenmodell einbezogen und für PivotTables, Power Pivot und Power View zur Verfügung gestellt werden.

D: Importierte Daten können nicht in Tabellen konvertiert werden.

**Frage 2:** Welche der folgenden Datenquellen können Sie in Excel importieren und in das Datenmodell einbeziehen?

A: Access-Datenbanken und viele andere Datenbanken

B: Vorhandene Excel-Dateien

C: Alle Daten, die Sie kopieren und in Excel einfügen und dort als Tabelle formatieren können. Dazu gehören Datentabellen in Websites, Dokumente oder alle sonstigen Elemente, die in Excel eingefügt werden können.

D: Alle vorstehend genannten Punkte

**Frage 3:** Was passiert in einer PivotTable, wenn Sie die Felder in den vier Bereichen von "PivotTable-Felder" umordnen?

A: Nichts. Sie können Felder nicht umordnen, sobald Sie diese in den Bereichen von "PivotTable-Felder" platziert haben.

B: Das PivotTable-Format wird geändert, um dem Layout zu entsprechen, auf die zugrundeliegenden Daten hat dies aber keine Auswirkungen.

C: Das PivotTable-Format wird geändert, um dem Layout zu entsprechen, und alle zugrundeliegenden Daten werden dauerhaft geändert.

D: Die zugrundeliegenden Daten werden geändert, sodass sich neue Datasets ergeben.

**Frage 4:** Was ist erforderlich, um eine Beziehung zwischen Tabellen zu erstellen?

A: Keine der Tabellen darf eine Spalte haben, die eindeutige, nicht wiederholte Werte enthält.

B: Eine Tabelle darf nicht in der Excel-Arbeitsmappe enthalten sein.

C: Die Spalten dürfen nicht in Tabellen konvertiert sein.

D: Keine der vorherigen Antworten ist richtig.

**Prüfungsantworten**

1.  Richtige Antwort: C
    
2.  Richtige Antwort: D
    
3.  Richtige Antwort: B
    
4.  Richtige Antwort: D
    

**Hinweise:** Daten und Bilder in dieser Lernprogrammreihe basieren auf folgenden Datenquellen:

-   Olympics Dataset von Guardian News & Media Ltd.
    
-   Flaggenbilder von CIA Factbook (cia.gov)
    
-   Bevölkerungsdaten von der Weltbank (worldbank.org)
    
-   Piktogramme der olympischen Sportarten von Thadius856 und Parutakupiu
