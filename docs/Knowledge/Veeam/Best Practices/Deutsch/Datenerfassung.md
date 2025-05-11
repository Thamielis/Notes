
---
created: 2024-08-01T12:52:45 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html
author: 
---

# Datenerfassung | Veeam Backup & Replication Best Practice Guide

---
Um eine Schätzung der benötigten Ressourcen zu machen, benötigen wir einige Eingabevariablen aus Ihrer aktuellen Infrastruktur. Um die benötigte Verarbeitungs- und Speicherkapazität zu definieren, müssen wir wissen, wie viele Daten wir schützen müssen.

## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html#amount-of-data)Datenmenge

Um einen klaren Einblick in die zu schützenden Daten zu erhalten, messen wir bevorzugt die Anzahl der zu schützenden (virtuellen) Maschinen und den von diesen Maschinen genutzten Speicherplatz. Diese Informationen können aus Ihrer Virtualisierungsinfrastruktur extrahiert werden, um die besten Ergebnisse zu erzielen.

Wenn wir nur die genutzte Kapazität einer Speicherlösung betrachten, erhalten wir nicht die richtigen Einblicke, da die meisten Speicherarrays heutzutage mehrere integrierte Effizienztechniken zur Inline-Kompression/Deduplizierung haben. Dies würde zu falschen Zahlen für unsere Berechnung führen.

## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html#daily-change-rate)Tägliche Änderungsrate

Wie viel der gesamten Datenmenge ändert sich tatsächlich täglich? Die tatsächlich geänderten Daten werden während des Backup-Prozesses gesammelt und in einer inkrementellen Backup-Datei geschrieben oder zur Erstellung einer vollständigen Backup-Datei verwendet. Infolgedessen hat die tägliche Änderungsrate einen großen Einfluss auf das Backup-Fenster und die Speicherkapazität, die zur Speicherung der Backups benötigt wird. Da das Veeam-Backup als Image-Level-Backup auf Blockebene erstellt wird, müssen wir die tägliche Änderungsrate auf Blockebene kennen. Dieser Wert kann von Veeam ONE gemessen und berichtet werden.

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html#veeam-one)Veeam ONE

Um diese Informationen aus der Virtualisierungsinfrastruktur zu sammeln, verwenden Sie [Veeam ONE®](https://www.veeam.com/virtualization-management-one-solution.html). Es bietet detaillierte Einblicke und Berichte über die tägliche Änderungsrate und andere wichtige Metriken.

___

## Inhaltsverzeichnis

-   [Datenerfassung](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html)
-   [SLA-Definition](https://bp.veeam.com/vbr/1_Assessment/A_SLA_Definition/SLA_Definition.html)
-   [Datenerfassung physischer Systeme](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html)
-   [Infrastrukturübersicht](https://bp.veeam.com/vbr/1_Assessment/A_Infra_Overview/infra_overview.html)

___
