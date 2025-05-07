
---
created: 2024-08-01T11:37:43 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html
author: 
---

# Allgemeine Backup-Jobs | Veeam Backup & Replication Best Practice Guide

> ## Auszug
> Best Practices aus dem Feld für Veeam Backup & Replication

---
## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#exclusions)Ausschlüsse

Während [Ausschlüsse](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_excludes_vm.html) sehr nützlich sein können, ist die virtuelle Infrastruktur dynamisch und ändert sich schnell. Es ist durchaus möglich, dass eine VM in einen Ordner oder Ressourcenpool verschoben wird, der ausgeschlossen ist, was dazu führt, dass sie ungeschützt bleibt.

[Überwachung mit Veeam ONE](https://helpcenter.veeam.com/docs/one/reporter/protected_vms.html) wird dringend empfohlen, um VMs zu verfolgen, die unter Schutz stehen. Denken Sie auch daran, dass Ausschlüsse in Veeam Backup & Replication eine höhere Priorität haben als Einschlüsse.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#storage-latency-control)Storage-Latenzkontrolle

Zu viele Jobs, die auf dieselbe Festplatte zugreifen, belasten den Speicher erheblich; dies verlangsamt den Job oder kann sich negativ auf die Leistung der VM auswirken (hohe Latenz). Um dieses Problem zu mildern, empfehlen wir, die [Storage-Latenzkontrolle](https://helpcenter.veeam.com/docs/backup/vsphere/io_settings.html) (auch bekannt als Backup I/O Control) zu aktivieren.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#job-chaining)Job-Verkettung

[Verkettung von Backup-Jobs](https://helpcenter.veeam.com/docs/backup/vsphere/job_schedule.html#chain) sollte generell vermieden werden. Zum Beispiel, wenn ein Job als Teil einer Kette fehlschlägt oder nicht mehr reagiert, liefert die gesamte Jobkette eine schlechte Backup-Erfolgsrate. Die Alternative zur Job-Verkettung besteht darin, die Jobs direkt nacheinander zu starten. Zum Beispiel:

-   Job 1 startet um 22:00 Uhr
-   Job 2 startet um 22:01 Uhr
-   Job 3 startet um 22:02 Uhr

Dies verringert das Risiko eines einzelnen Ausfallpunkts und erhöht die Verfügbarkeit. Auf diese Weise, wenn ein Proxy-Server ausfällt, kann der Backup-Job dennoch mit einem der anderen im Job eingestellten Proxy-Server ausgeführt werden.

**Tipp:** Um das Lastenausgleich in einer verteilten Umgebung zu optimieren, in der Backup-Proxys an mehreren Standorten platziert sind, wird empfohlen, alle Proxys vom selben Standort im entsprechenden Job auszuwählen.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#assigning-virtual-repositories)Zuweisen virtueller Repositories

Es wird empfohlen, ein physisches Repository zu verwenden. Wenn dies nicht möglich ist, sollte besondere Sorgfalt darauf verwendet werden, sicherzustellen, dass der Ost-West-Verkehr von den Proxys zu den ESXi mit den Links des Repositories nicht zum Engpass wird.

Es wird empfohlen, die Anzahl der virtuellen Maschinen mit dem Repository-Dienst zu erhöhen und die Bandbreite gleichmäßiger zu verteilen.

In Umgebungen mit mehreren Clustern wird empfohlen, jedem Cluster ein virtuelles Repository oder Repositories zuzuweisen. Dies verhindert, dass Backup-Datenverkehr zwischen Clustern reist.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#references)Referenzen

-   [Objekte vom Backup-Job ausschließen](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_excludes_vm.html)
-   [Jobs an bestimmte Proxys binden](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_storage_vm.html)
-   [Überwachung geschützter VMs](https://helpcenter.veeam.com/docs/one/reporter/protected_vms.html)
-   [Job-Verkettung](https://helpcenter.veeam.com/docs/backup/vsphere/job_schedule.html#chain)
-   [Storage-Latenzkontrolle](https://helpcenter.veeam.com/docs/backup/vsphere/io_settings.html)
-   [Ressourcenplanung](https://helpcenter.veeam.com/docs/backup/vsphere/resource_scheduling.html)
-   [Proxy-Affinität](https://helpcenter.veeam.com/docs/backup/vsphere/proxy_affinity.html)
-   [Pro-VM-Backup-Dateien](https://helpcenter.veeam.com/docs/backup/vsphere/per_vm_backup_files.html)

___
