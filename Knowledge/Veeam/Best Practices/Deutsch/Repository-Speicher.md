
---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html
author: 
---

# Repository-Speicher | Veeam Backup & Replikations-Best-Practice-Leitfaden

---
Dieser Abschnitt bezieht sich auf die Dimensionierung von Standard-Disk-Repositories.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html#best-practice)Best Practices

-   Verwenden Sie den [Veeam Size Estimator (VSE)](https://calculator.veeam.com/vse/) oder den [Veeam Capacity Calculator](https://calculator.veeam.com/vbr/), um die Kapazitätsanforderungen zu schätzen.
-   Verwenden Sie ReFS/XFS mit Block-Cloning, um den Platzbedarf für synthetische Voll-Backups und GFS-Wiederherstellungspunkte zu reduzieren und die Zusammenführungsleistung zu verbessern.
-   Fügen Sie mehr Ressourcen hinzu, wenn Sie Gesundheitsprüfungen planen, da Gesundheitsprüfungen zusätzliche Lese-IO erfordern.

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html#estimating-repository-capacity)Schätzung der Repository-Kapazität

Bei der Schätzung des erforderlichen Speicherplatzes sollten Sie Folgendes wissen:

-   Gesamtmenge der gesicherten Daten
-   Häufigkeit der Backups
-   Aufbewahrungszeitraum für Backups
-   Geplante Backup-Kettenart (empfohlen: Vorwärts inkrementell mit synthetischen Voll-Backups)
-   Wird ReFS/XFS-Block-Cloning verwendet (empfohlen)

Wenn Tests im Voraus nicht möglich sind, sollten Sie Annahmen über Komprimierungs- und Deduplizierungsverhältnisse, Änderungsraten und andere Faktoren treffen. Die folgenden Zahlen sind typisch für die meisten Bereitstellungen; es ist jedoch wichtig, die spezifische Umgebung zu verstehen, um mögliche Ausnahmen zu erkennen:

-   Die Datenreduktion dank Komprimierung und Deduplizierung beträgt normalerweise 2:1 oder mehr; es ist üblich, 3:1 oder besser zu sehen, aber Sie sollten immer konservativ sein, wenn Sie den benötigten Speicherplatz schätzen.
-   Die typische tägliche Änderungsrate liegt in einer mittelgroßen oder Unternehmensumgebung zwischen 2 % und 5 %. Dies kann je nach Umgebung variieren.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html#disk-considerations)Überlegungen zur Festplatte

Bei der Auswahl und Konfiguration der Festplatten für Ihr Repository sollten Sie Folgendes beachten:

-   Verwenden Sie Enterprise-Festplatten mit hoher Zuverlässigkeit und Leistung.
-   Verwenden Sie SSDs oder NVMe-Laufwerke für Metadaten und andere kritische Daten, die schnellen Zugriff erfordern.
-   Konfigurieren Sie RAID-Gruppen, um die Ausfallsicherheit und Leistung zu erhöhen.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html#refs-xfs-usage)Verwendung von ReFS/XFS

Die Verwendung von ReFS (für Windows) oder XFS (für Linux) wird empfohlen, da sie Funktionen bieten, die die Leistung und Effizienz des Repositorys verbessern, insbesondere bei der Verwendung von Block-Cloning.

-   ReFS/XFS mit Block-Cloning reduziert den Speicherplatzbedarf für synthetische Voll-Backups und GFS durch die Fast Clone-Funktion.

Unter Verwendung der oben genannten Zahlen können Sie den benötigten Speicherplatz für jeden Job schätzen. Lassen Sie außerdem immer zusätzlichen Spielraum für zukünftiges Wachstum, zusätzliche Voll-Backups, das Verschieben von VMs, das Wiederherstellen von VMs von Bändern usw.

Ein Tool zur Repository-Dimensionierung, das für Schätzungen verwendet werden kann, ist der [Veeam Size Estimator (VSE)](https://calculator.veeam.com/vse/) oder der [Veeam Capacity Calculator](https://calculator.veeam.com/vbr/).

-   Hinweis: Dies sind _Schätzungs_werkzeuge und die Ergebnisse können von einem realen Nutzungsszenario abweichen.
-   Hinweis: Beide Tools unterstützen nur Vorwärtsinkrementelle und für immer Vorwärtsinkrementelle Backup-Ketten. Für immer Vorwärtsinkrementelle können berechnet werden, wenn ReFS/XFS aktiviert ist, da die Berechnung die gleiche ist wie bei Vorwärtsinkrementellen mit synthetischen Voll-Backups.

Führen Sie den Bericht „Kapazitätsplanung für Backup-Repositories“ aus, um den zukünftigen Speicherverbrauch zu analysieren.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html#references)Referenzen

-   [Veeam Help Center - Backup Repository Section](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository.html)
-   [Veeam Help Center - Datenkomprimierung und Deduplizierung](https://helpcenter.veeam.com/docs/backup/vsphere/compression_deduplication.html)
-   [Veeam Help Center - Fast Clone](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository_block_cloning.html)
-   [Microsoft - ReFS Übersicht](https://docs.microsoft.com/en-us/windows-server/storage/refs/refs-overview)
-   [Veeam Capacity Calculator](https://calculator.veeam.com/vbr/)
-   [Veeam Size Estimation Tool (VSE)](https://calculator.veeam.com/vse/)
-   [Alliance Partner Integrations & Qualifications - Veeam Ready Repository](https://www.veeam.com/alliance-partner-integrations-qualifications.html?programCategory=repo)
-   [Backup Chain Detection](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier_inactive_backup_chain.html)

___
