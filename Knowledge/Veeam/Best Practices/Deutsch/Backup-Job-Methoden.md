
---
created: 2024-08-01T11:38:34 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html
author: 
---

# Backup-Job-Methoden | Veeam Backup & Replication Best Practice Guide

> ## Auszug
> Best Practices aus dem Feld für Veeam Backup & Replication

---
## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#forward-incremental-usage)Verwendung des Forward Incremental

Die Forward Incremental-Backup-Methode ist die einfachste und leicht verständlichste. Sie funktioniert im Allgemeinen gut mit allen Speichermedien, obwohl sie mehr Speicherplatz erfordert als andere Backup-Methoden, da periodische vollständige Backups (entweder mit aktiven oder synthetischen Backups) erstellt werden müssen, die typischerweise wöchentlich geplant sind. Dies ist notwendig, da die inkrementellen Backups vom anfänglichen vollständigen Backup abhängen. Ältere vollständige Backups können nicht aus der Aufbewahrungskette entfernt werden, bis eine neuere Backup-Kette erstellt wurde. Wenn ein neues vollständiges Backup erstellt wird, beginnt eine neue Kette, und die alten Backups können entfernt werden, sobald die neue Kette die Aufbewahrungsanforderungen erfüllt.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#active-full-usage)Verwendung von Active Full

Forward Incremental Backup bietet eine gute Leistung mit fast jedem Speicher und die höchste Konsistenz der Backup-Kette, da jede neue Kette durch erneutes Lesen der VM-Quelldaten gefüllt wird. Inkrementelle Backups werden weiterhin mit Changed Block Tracking (CBT) verarbeitet. Active Full kann verwendet werden, wenn ausreichend Repository-Speicherplatz vorhanden ist, das Backup-Fenster genügend Zeit bietet und die Netzwerkbandbreite ausreicht, um die Quelldaten vollständig zu lesen.

| Verwenden | Nicht verwenden |
| --- | --- |
| Empfohlen für Deduplizierungsgeräte, die SMB- oder NFS-Protokolle verwenden. | Wenn das Backup-Fenster nicht genügend Zeit für das erneute Lesen aller Quelldaten der VM zulässt. |
| Auf Speichersystemen, die Software- oder nicht-caching RAID-Hardware verwenden. | Bei Netzwerkverbindungen mit niedriger Bandbreite. |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#synthetic-full-usage)Verwendung von Synthetic Full

Synthetic Full Backup verwendet den vorhandenen Backup-Satz, um ein neues vollständiges Backup zu erstellen. Dabei werden die Blöcke aus den letzten inkrementellen Backups sowie dem letzten vollständigen Backup verwendet. Synthetic Full benötigt weniger Netzwerkbandbreite und reduziert die Belastung der Produktivumgebung. Allerdings benötigt es mehr Rechenressourcen und kann die Backup-Dauer verlängern.

| Verwenden | Nicht verwenden |
| --- | --- |
| Wenn die Netzwerkbandbreite begrenzt ist. | Wenn das Speichergerät keine gute Leistung bei Random I/O bietet. |
| Bei Deduplizierungsgeräten mit einer hohen Verarbeitungskapazität. | Wenn das Speichergerät über langsame Festplatten verfügt. |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#reverse-incremental-usage)Verwendung von Reverse Incremental

Reverse Incremental Backup erstellt bei jedem Backup-Lauf eine vollständige Backup-Datei und verschiebt die geänderten Blöcke in eine separate Rückwärtsinkrement-Datei. Diese Methode bietet die schnellste Wiederherstellung, da das letzte Backup immer ein vollständiges Backup ist. Allerdings erfordert sie mehr Schreibvorgänge auf dem Zielspeicher und kann die Backup-Dauer verlängern.

| Verwenden | Nicht verwenden |
| --- | --- |
| Wenn schnelle Wiederherstellungszeiten erforderlich sind. | Wenn das Zielspeichergerät keine gute Leistung bei Schreibvorgängen bietet. |
| Bei Speichergeräten mit hoher Schreibgeschwindigkeit. | Wenn viele gleichzeitige Jobs ausgeführt werden. |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#forever-forward-incremental-usage)Verwendung von Forever Forward Incremental

Forever Forward Incremental Backup erfordert nur ein vollständiges Backup und erstellt danach nur inkrementelle Backups. Das älteste inkrementelle Backup wird regelmäßig in das vollständige Backup integriert. Diese Methode benötigt weniger Speicherplatz und Netzwerkbandbreite, kann jedoch die Backup-Dauer verlängern.

| Verwenden | Nicht verwenden |
| --- | --- |
| Wenn weniger Speicherplatz benötigt wird. | Wenn schnelle Wiederherstellungszeiten erforderlich sind. |
| Bei beschränkter Netzwerkbandbreite. | Wenn viele gleichzeitige Jobs ausgeführt werden. |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#offload-backups-to-capacity-tier)Offload-Backups in den Capacity Tier

Backups können in den Capacity Tier verschoben werden, um den primären Speicher zu entlasten und die Kosten zu senken. Diese Methode ist ideal für langfristige Aufbewahrung und Archivierung.

| Verwenden | Nicht verwenden |
| --- | --- |
| Für langfristige Aufbewahrung und Archivierung. | Wenn sofortiger Zugriff auf Backups erforderlich ist. |
| Zur Kostensenkung durch Nutzung von günstigem Speicher. | Wenn der Zugriff auf Daten innerhalb von Sekunden erforderlich ist. |

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#references)Referenzen

-   [Backup-Methoden](https://helpcenter.veeam.com/docs/backup/vsphere/backup_methods.html)
-   [GFS Flags](https://helpcenter.veeam.com/docs/backup/vsphere/gfs_retention_policy.html)
-   [Gateway Server](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html)
-   [Deduplizierungsgeräte](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_backup_repositories/deduplication.html) (bietet wichtige Details zur Verwendung dedizierter Deduplizierungs-Hardwaregeräte für die Speicherung von Backups)
-   [Auswirkungen von Snapshot-Operationen](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#impact-of-snapshot-operations)
-   [Pro Machine Backup Files]
-   [Backup von Storage Snapshots](https://bp.veeam.com/vbr/Support/S_Vmware/storage_integration.html)
-   [Backups in den Capacity Tier verschieben](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier_move.html)
-   [Backups in den Capacity Tier kopieren](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier_copy.html)
-   [Fast Clone](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository_block_cloning.html)

___
