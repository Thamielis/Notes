---
created: 2024-07-24T13:04:39 (UTC +02:00)
tags: []
source: https://support.microsoft.com/de-de/office/erstellen-eines-datenmodells-in-excel-87e7a54c-87dc-488e-9410-5c75dbcb0f7b?ui=de-de&rs=de-de&ad=de
author: 
---

# Erstellen eines Datenmodells in Excel - Microsoft-Support

> ## Excerpt
> Ein Datenmodell ist ein neuer Ansatz zum Integrieren von Daten aus mehreren Tabellen, wodurch innerhalb der Excel-Arbeitsmappe praktisch eine relationale Datenquelle entsteht. Datenmodelle werden in Excel transparent verwendet und stellen in PivotTables, PivotCharts und Power View-Berichten genutzte Daten bereit. Sie können das Modell mit dem Microsoft Office Power Pivot für Excel 2013-Add-In anzeigen, verwalten und erweitern.

---
Mit einem Datenmodell können Sie Daten aus mehreren Tabellen integrieren und so effektiv eine relationale Datenquelle innerhalb einer Excel-Arbeitsmappe erstellen. In Excel werden Datenmodelle transparent verwendet und stellen tabellarische Daten bereit, die in PivotTables und PivotCharts verwendet werden. Ein Datenmodell wird als Sammlung von Tabellen in einer Feldliste visualisiert, und in den meisten Fällen werden Sie nie wissen, dass es vorhanden ist.

Bevor Sie mit der Arbeit mit dem Datenmodell beginnen können, müssen Sie einige Daten abrufen. Hierfür verwenden wir die Benutzeroberfläche get & Transform (Power Query) (Abrufen & Transformieren (Power Query), sodass [Sie einen Schritt zurücktreten und sich ein Video ansehen oder unseren Lernleitfaden zum Abrufen & Transformieren und Power Pivot folgen möchten.](https://support.microsoft.com/de-de/office/informationen-zur-verwendung-von-power-query-und-power-pivot-in-excel-42d895c2-d1d7-41d0-88da-d1ed7ecc102d)

## Erste Schritte

Zunächst müssen Sie einige Daten abrufen.

1.  In Excel 2016 und Excel für Microsoft 365 verwenden Sie **Data** > **Get & Transform Data** > **Get Data** , um Daten aus einer beliebigen Anzahl externer Datenquellen zu importieren, z. B. aus einer Textdatei, einer Excel-Arbeitsmappe, einer Website, Microsoft Access, SQL Server oder einer anderen relationalen Datenbank, die mehrere verwandte Tabellen enthält.
    
2.  Sie werden in Excel aufgefordert, eine Tabelle auszuwählen. Wenn Sie mehrere Tabellen aus derselben Datenquelle abrufen möchten, aktivieren Sie die Option **Auswahl mehrerer Tabellen aktivieren** . Wenn Sie mehrere Tabellen auswählen, erstellt Excel automatisch ein Datenmodell für Sie.
    
    ![Abrufen & Transformationsnavigator (Power Query)](https://support.content.office.net/de-de/media/17d56cd3-2143-4996-a172-fa620a22e69c.png)
3.  Wählen Sie eine oder mehrere Tabellen aus, und klicken Sie dann auf **Laden**.
    
    Wenn Sie die Quelldaten bearbeiten müssen, können Sie die Option **Bearbeiten** auswählen. Weitere Informationen finden Sie unter [Einführung in den Abfrage-Editor (Power Query).](https://support.microsoft.com/de-de/office/einf%C3%BChrung-in-den-abfrage-editor-power-query-1d6cdb63-bf70-4ae8-a7d5-6ae9547004d9)
    

Sie verfügen jetzt über ein Datenmodell, das alle importierten Tabellen enthält, die in der **PivotTable-Feldliste** angezeigt werden.

**Hinweise:** 

-   Modelle werden implizit erstellt, wenn Sie mindestens zwei Tabellen gleichzeitig in Excel importieren.
    
-   Modelle werden explizit erstellt, wenn Sie Daten mithilfe des Power Pivot-Add-Ins importieren. Im Add-In wird das Modell in einem Layout im Registerkartenformat dargestellt, das Excel ähnelt, wobei jede Registerkarte tabellarische Daten enthält. Informationen zu den Grundlagen des Datenimports [mithilfe einer SQL Server-Datenbank finden Sie unter Abrufen von Daten mithilfe des Power Pivot-Add-Ins](https://support.microsoft.com/de-de/office/abrufen-von-daten-mithilfe-des-power-pivot-add-ins-f0431904-aab1-49c3-b50c-c6f5d4517a66).
    
-   Ein Modell kann eine einzelne Tabelle enthalten. Um ein Modell auf der Grundlage nur einer Tabelle zu erstellen, wählen Sie die Tabelle aus, und klicken Sie in Power Pivot auf **Zu Datenmodell hinzufügen**. Dies ist beispielsweise sinnvoll, wenn Sie Power Pivot-Funktionen, z. B. gefilterte Datasets, berechnete Spalten, berechnete Felder, KPIs und Hierarchien, verwenden möchten.
    
-   Tabellenbeziehungen können automatisch erstellt werden, wenn Sie verknüpfte Tabellen importieren, die Primär- und Fremdschlüsselbeziehungen aufweisen. In Excel können die Informationen zu importierten Beziehungen normalerweise als Grundlage für Tabellenbeziehungen im Datenmodell verwendet werden.
    
-   Tipps zum Reduzieren der Größe eines Datenmodells finden [Sie unter Erstellen eines speichereffizienten Datenmodells mit Excel und Power Pivot](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70).
    
-   Weitere Informationen finden Sie unter [Tutorial: Importieren von Daten in Excel und Erstellen eines Datenmodells](https://support.microsoft.com/de-de/office/lernprogramm-importieren-von-daten-in-excel-und-erstellen-eines-datenmodells-4b4e5ab4-60ee-465e-8195-09ebba060bf0).
    

## Erstellen von Beziehungen zwischen Ihren Tabellen

Der nächste Schritt besteht darin, Beziehungen zwischen Ihren Tabellen zu erstellen, damit Sie Daten aus allen Tabellen abrufen können. Jede Tabelle muss über einen Primärschlüssel oder einen eindeutigen Feldbezeichner wie Schüler-ID oder Klassennummer verfügen. Am einfachsten können Sie diese Felder ziehen und ablegen, um sie in der **Diagrammansicht** von Power Pivot zu verbinden.

1.  Wechseln Sie zu **Power Pivot** > **Verwalten**.
    
2.  Wählen Sie auf der Registerkarte **Start** die Option **Diagrammansicht** aus.
    
3.  Alle importierten Tabellen werden angezeigt, und Sie sollten sich etwas Zeit nehmen, um deren Größe zu ändern, je nachdem, wie viele Felder die einzelnen Tabellen haben.
    
4.  Ziehen Sie als Nächstes das Primärschlüsselfeld von einer Tabelle in die nächste. Das folgende Beispiel ist die Diagrammansicht unserer Schülertabellen:
    
    ![Power Query Data Model Relationship Diagram View](https://support.content.office.net/de-de/media/822dcf53-640d-425c-9829-18ae761a088b.png)
    
    Wir haben die folgenden Links erstellt:
    
    -   tbl\_Students | Studentenausweis > tbl\_Grades | Studenten-ID
        
        Anders ausgedrückt: Ziehen Sie das Feld Student ID aus der Tabelle Students in das Feld Student ID in der Tabelle Noten.
        
    -   tbl\_Semesters | Semesterausweis > tbl\_Grades | Semester
        
    -   tbl\_Classes | Klassennummer > tbl\_Grades | Klassennummer
        
    
    **Hinweise:** 
    
    -   Feldnamen müssen nicht identisch sein, um eine Beziehung zu erstellen, aber sie müssen derselbe Datentyp sein.
        
    -   Die Verbinder in der **Diagrammansicht** weisen auf der einen Seite eine "1" und auf der anderen seite ein "\*" auf. Dies bedeutet, dass zwischen den Tabellen eine 1:n-Beziehung besteht, die bestimmt, wie die Daten in Ihren PivotTables verwendet werden. Weitere Informationen finden Sie [unter Beziehungen zwischen Tabellen in einem Datenmodell](https://support.microsoft.com/de-de/office/beziehungen-zwischen-tabellen-in-einem-datenmodell-533dc2b6-9288-4363-9538-8ea6e469112b) .
        
    -   Die Connectors geben nur an, dass eine Beziehung zwischen Tabellen besteht. Sie zeigen nicht, welche Felder miteinander verknüpft sind. Um die Links anzuzeigen, wechseln Sie zu **Power Pivot** > **Verwalten >****Entwerfen** > **Beziehungen** > **Verwalten von Beziehungen**. In Excel können Sie zu **Daten** > **Beziehungen** wechseln.
        
    

## Verwenden eines Datenmodells zum Erstellen einer PivotTable oder eines PivotCharts

Eine Excel-Arbeitsmappe kann nur ein Datenmodell enthalten, aber dieses Modell kann mehrere Tabellen enthalten, die wiederholt in der gesamten Arbeitsmappe verwendet werden können. Sie können einem vorhandenen Datenmodell jederzeit weitere Tabellen hinzufügen.

1.  Navigieren **SiePower Pivot**zu **Verwalten**.
    
2.  Wählen Sie auf der Registerkarte **Start** die Option **PivotTable** aus.
    
3.  Wählen Sie aus, wo die PivotTable platziert werden soll: ein neues Arbeitsblatt oder die aktuelle Position.
    
4.  Klicken Sie auf **OK**, und Excel fügt eine leere PivotTable mit dem Bereich Feldliste auf der rechten Seite hinzu.
    
    ![Power Pivot Pivot Pivot-Feldliste](https://support.content.office.net/de-de/media/e652a85a-1fad-40df-a8cc-1199f687e0e8.png)
    

[Erstellen Sie als Nächstes eine PivotTable](https://support.microsoft.com/de-de/office/erstellen-einer-pivottable-zum-analysieren-von-arbeitsblattdaten-a9a84538-bfe9-40a9-a8e9-f99134456576) oder [ein Pivot Chart](https://support.microsoft.com/de-de/office/erstellen-eines-pivotcharts-c1b1e057-6990-4c38-b52b-8255538e7b1c). Wenn Sie bereits Beziehungen zwischen den Tabellen erstellt haben, können Sie jedes ihrer Felder in der PivotTable verwenden. Wir haben bereits Beziehungen in der Beispielarbeitsmappe Student Data Model erstellt.

## Hinzufügen von vorhandenen, nicht verknüpften Daten zu einem Datenmodell

Angenommen, Sie haben viele Daten, die Sie in einem Modell verwenden möchten, importiert oder kopiert, aber nicht dem Datenmodell hinzugefügt. Neue Daten in ein Modell zu übertragen, ist einfacher, als Sie denken.

1.  Wählen Sie zunächst eine beliebige Zelle innerhalb der Daten aus, die Sie dem Modell hinzufügen möchten. Dabei kann es sich um einen beliebigen Datenbereich handelt, aber Daten, die als [Excel-Tabelle](https://support.microsoft.com/de-de/office/%C3%BCbersicht-zu-excel-tabellen-7ab0bb7d-3a9e-4b56-a3c9-6c94334e492c) formatiert sind, sind am besten geeignet.
    
2.  Fügen Sie die Daten mithilfe eines der folgenden Verfahren hinzu:
    
3.  Klicken Sie auf **Power Pivot** > **Zu Datenmodell hinzufügen**.
    
4.  Klicken Sie auf **Einfügen** > **PivotTable**, und aktivieren Sie dann im Dialogfeld "PivotTable erstellen" die Option **Dem Datenmodell diese Daten hinzufügen**.
    

Jetzt wird der Bereich oder die Tabelle dem Modell als verknüpfte Tabelle hinzugefügt. Weitere Informationen zum Arbeiten mit verknüpften Tabellen in einem Modell finden Sie unter [Hinzufügen von Daten mit verknüpften Excel-Tabellen in Power Pivot](https://support.microsoft.com/de-de/office/hinzuf%C3%BCgen-von-arbeitsblattdaten-zu-einem-datenmodell-mithilfe-einer-verkn%C3%BCpften-tabelle-d3665fc3-99b0-479d-ba09-a37640f5be42).

## Hinzufügen von Daten zu einer Power Pivot Tabelle

In Power Pivot können Sie einer Tabelle keine Zeile hinzufügen, indem Sie Daten direkt in eine neue Zeile eingeben, wie dies in einem Excel-Arbeitsblatt der Fall ist. Sie können jedoch Zeilen hinzufügen, indem Sie die Quelldaten [kopieren und einfügen](https://support.microsoft.com/de-de/office/kopieren-und-einf%C3%BCgen-von-zeilen-in-ein-datenmodell-in-power-pivot-0a38a3d1-d644-45ee-b02b-7bdd48230d70) oder die Quelldaten aktualisieren und [das Power Pivot-Modell aktualisieren](https://support.microsoft.com/de-de/office/aktualisieren-einer-externen-datenverbindung-in-excel-1524175f-777a-48fc-8fc7-c8514b984440#bmPPivot).

## Benötigen Sie weitere Hilfe?

Sie können jederzeit einen Experten in der [Excel Tech Community](https://techcommunity.microsoft.com/t5/Excel/ct-p/Excel_Cat) fragen oder Unterstützung in den [Communities](https://answers.microsoft.com/lang/msoffice/forum/msoffice_excel?login_hint=Mario.Mellunig%40kostwein.at) erhalten.

## Siehe auch

[Lernhandbücher für & Transformation und Power Pivot abrufen](https://support.microsoft.com/de-de/office/informationen-zur-verwendung-von-power-query-und-power-pivot-in-excel-42d895c2-d1d7-41d0-88da-d1ed7ecc102d)

[Einführung in den Abfrage-Editor (Power Query)](https://support.microsoft.com/de-de/office/einf%C3%BChrung-in-den-abfrage-editor-power-query-1d6cdb63-bf70-4ae8-a7d5-6ae9547004d9)

[Erstellen eines speichereffizienten Datenmodells mit Excel und Power Pivot](https://support.microsoft.com/de-de/office/create-eines-speichereffizienten-datenmodells-mithilfe-von-excel-und-dem-power-pivot-add-in-951c73a9-21c4-46ab-9f5e-14a2833b6a70)

[Tutorial: Importieren von Daten in Excel und Erstellen eines Datenmodells](https://support.microsoft.com/de-de/office/lernprogramm-importieren-von-daten-in-excel-und-erstellen-eines-datenmodells-4b4e5ab4-60ee-465e-8195-09ebba060bf0)

[Feststellen, welche Datenquellen im Datenmodell einer Arbeitsmappe verwendet werden](https://support.microsoft.com/de-de/office/feststellen-welche-datenquellen-im-datenmodell-einer-arbeitsmappe-verwendet-werden-44ef9af5-fffd-45a2-8f7c-caa04a2f774f)

[Beziehungen zwischen Tabellen in einem Datenmodell](https://support.microsoft.com/de-de/office/beziehungen-zwischen-tabellen-in-einem-datenmodell-533dc2b6-9288-4363-9538-8ea6e469112b)
