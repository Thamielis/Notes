
---
created: 2024-08-01T11:37:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/
author: 
---

# Backup-Jobs | Veeam Backup & Replication Best Practice Guide

> ## Auszug
> Best Practices aus dem Feld für Veeam Backup & Replication

---
Ein Job ist der Auslöser für den Backup- und Replikationsprozess: Er definiert, wo, wann und wie VM-Daten geschützt werden.

Die Konfiguration eines Jobs mag einfach und unkompliziert erscheinen, aber es gibt einige Überlegungen zu beachten, wie zum Beispiel: Ausschlüsse, Verkettungen und welche Methode für ein bestimmtes Backup-Repository am besten geeignet ist.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/#how-many-vms-per-job)Wie viele VMs pro Job?

Vermeiden Sie es, eine VM pro Job zu verwenden, es sei denn, es ist unbedingt erforderlich. Durch die Verwendung mehrerer VMs pro Job reduzieren wir die Verwaltungskomplexität, da es viel einfacher ist, eine kleine Anzahl von Jobs zu verwalten, als zu versuchen, Hunderte von Jobs zu verwalten. Andererseits kann die Verwaltung von zu vielen VMs in einem Job die Komplexität bestimmter Betriebsaktivitäten erhöhen. Bis zu 300 VMs pro Job bieten ein gutes Gleichgewicht für die Verwaltung von Backups.

Bedenken Sie, dass einige Aufgaben innerhalb eines Jobs immer noch sequentielle Prozesse sind. Zum Beispiel wird ein Zusammenführungsprozess (das Schreiben der ältesten inkrementellen Datei in die vollständige Backup-Datei) gestartet, nachdem die letzte VM die Backup-Verarbeitung abgeschlossen hat. Wenn Sie die VMs auf mehrere Jobs aufteilen, werden diese Hintergrundprozesse parallel ausgeführt und verkürzen somit das gesamte Backup-Fenster.

Seien Sie vorsichtig mit großen Jobs bei der Verwendung von Storage Snapshots bei [Backup von Storage Snapshots](https://bp.veeam.com/vbr/Support/S_Vmware/storage_integration.html). Gastverarbeitung und Planung von Jobs, die mehrere Snapshots enthalten, können zu schwierigen Planungssituationen führen und dazu, dass Jobs auf die Verfügbarkeit von Ressourcen warten müssen. Eine gute Größe für Jobs sind 50-200 VMs pro Job.

Denken Sie auch daran, dass die Anzahl der gleichzeitig laufenden Backup-Jobs 100 nicht überschreiten sollte. Veeam kann mehr bewältigen, aber ein „Sweet Spot“ für Datenbankbelastung, Lastverteilung und Gesamtabwicklung liegt bei etwa 80-100 gleichzeitig laufenden Jobs.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/#references)Referenzen

___

## Inhaltsverzeichnis

-   [Allgemeine Backup-Jobs](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html)
-   [Backup-Job-Methoden](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html)
-   [Backup-Job-Speicher](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html)
-   [Gastverarbeitung](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html)
-   [Backup-Job-Automatisierung](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_automation.html)

___
