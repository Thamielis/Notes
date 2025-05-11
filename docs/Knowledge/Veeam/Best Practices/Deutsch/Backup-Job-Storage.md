
---
created: 2024-08-01T11:38:58 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html
author: 
---

# Backup-Job-Speicherung | Veeam Backup & Replikations-Best-Practice-Leitfaden

> ## Auszug
> Best Practices aus der Praxis für Veeam Backup & Replikation

---
## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#backup-job--storage-advanced-settings)Backup-Job — Erweiterte Speicher-Einstellungen

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#source-storage-best-practices-overview)Überblick über die besten Praktiken für Quellspeicher

-   Die Standardeinstellungen sind gut, ändern Sie Werte nicht, ohne die Auswirkungen zu verstehen.
-   Verwenden Sie Komprimierungsstufen über **optimal** nur, wenn Sie über genügend CPU-Leistung verfügen und verstehen, dass die maximale Durchsatzrate, insbesondere bei vollständigen Backups, wahrscheinlich erheblich niedriger sein wird, insbesondere wenn die CPUs des Backup-Proxys keine zusätzliche Last vertragen.
-   Denken Sie daran, dass höhere Komprimierungsraten auch die Wiederherstellungsgeschwindigkeit negativ beeinflussen können.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#storage-maintenance)Speicherwartung

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#full-backup-file-maintenance---defragment-and-compacting)Vollständige Backup-Datei-Wartung - „Defragmentieren und Kompaktieren“

[Wartung der vollständigen Backup-Datei](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_advanced_maintenance_vm.html) behandelt zwei Probleme: VBK-Dateifragmentierung, die durch Transformationen (vorwärts inkrementell für immer oder rückwärts inkrementell) verursacht wird, und übrig gebliebene Leerzeichen von gelöschten Datenblöcken. Diese Probleme werden durch die Synthese einer neuen vollständigen Backup-Datei auf dem Backup-Repository behoben, d.h. durch das Kopieren von Blöcken aus der vorhandenen VBK-Datei in eine neue VBK-Datei und anschließendes Löschen der Originaldatei. Dieser Prozess wird auch als „Kompaktierung“ bezeichnet.

**Hinweis:** Bitte beachten Sie, dass diese Wartung...

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#block-size-and-backup-file-size)Blockgröße und Backup-Dateigröße

-   Ändern Sie die Blockgröße nicht, ohne die Auswirkungen zu verstehen.
-   Wenn Sie die Standardblockgröße ändern möchten, testen Sie sie gründlich und stellen Sie sicher, dass Sie die zusätzlichen I/O- und Speicheranforderungen des Repositories entsprechend geplant haben.
-   Wenn Sie eine kleinere Blockgröße als die Standardgröße für einen großen Server verwenden, wird empfohlen, einen Backup-Modus zu verwenden, der keine synthetische Verarbeitung durchführt (z.B. vorwärts inkrementell mit geplanten aktiven vollständigen Backups).

| Einstellung | Blockgröße | Maximal empfohlene Jobgröße |
| --- | --- | --- |
| WAN-Ziel | 256 KB | 4 TB Quelldaten |
| LAN-Ziel | 512 KB | 8 TB Quelldaten |
| Lokales Ziel | 1.024 KB | 16 TB Quelldaten |
| Lokal (>16 TB) | 4.096 KB | 64 TB Quelldaten |

**Hinweis:** Änderungen der Blockgröße werden erst nach Erstellung eines aktiven vollständigen Backups wirksam.

**Hinweis:** Beim Backup großer (>1 TB) komprimierter oder deduplizierter Quell-VMs, die bereits komprimierte Daten enthalten (Bilder, Videos, Windows deduplizierte Dateiserver usw.), kann es vorteilhaft sein, die Veeam-Deduplizierung einfach zu deaktivieren, da es unwahrscheinlich ist, dass für diese Art von Quelldaten zusätzliche Speicherplatzersparnisse erzielt werden. Beachten Sie, dass die Veeam-Deduplizierung eine Job-Einstellung ist, sodass VMs desselben Typs gruppiert und innerhalb desselben Jobs verarbeitet werden sollten.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#references)Referenzen

-   [BitLooker](https://helpcenter.veeam.com/docs/backup/vsphere/dirty_blocks.html)
-   [Speicherkompatibilität](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_advanced_storage_vm.html)
-   [Gesundheitsprüfung für Backup-Dateien](https://helpcenter.veeam.com/docs/backup/vsphere/backup_health_check.html)
-   [Backup-Kopierjob mit GFS und aktivem Vollbackup](https://helpcenter.veeam.com/archive/backup/100/vsphere/active_full_archive_retention.html)
-   [Wartungseinstellungen](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_advanced_maintenance_vm.html)

___
