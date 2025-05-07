
---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/
author: 
---

# Repository-Design | Veeam Backup & Replikations-Best-Practice-Leitfaden

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#veeam-backup-repository-design)Veeam Backup-Repository-Design

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#best-practice)Best Practices

-   Stellen Sie sicher, dass Sie die 3-2-1-Regel einhalten.
-   Physische Repositories werden nach Möglichkeit empfohlen (idealerweise in Kombination mit der Proxy-Rolle unter Verwendung von Backups von Speichersnapshots).
-   Berechnen Sie einen Repository-Kern pro drei Proxy-Kerne.
-   Berechnen Sie 4 GB RAM pro Repository-CPU-Kern.
-   Das empfohlene Minimum für ein Repository sind zwei Kerne und 8 GB RAM.

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#repository-server-placement)Platzierung des Repository-Servers

Das Veeam Backup-Repository kann überall in der Umgebung platziert werden. Das häufigste Design umfasst ein primäres Backup vor Ort und eine Backup-Kopie außerhalb des Standorts.

Die wichtigste Empfehlung ist die Einhaltung der [3-2-1](https://www.veeam.com/blog/how-to-follow-the-3-2-1-backup-rule-with-veeam-backup-replication.html)-Regel.

-   Drei Kopien der Daten (Produktion, Backup und Backup-Kopie).
-   Zwei verschiedene Medien.
-   Eine Kopie außerhalb des Standorts.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#repository-server-sizing)Größenbestimmung des Repository-Servers

Beim Repository korreliert ein Task-Slot mit einer gleichzeitig verarbeiteten Festplatte, die als Teil der Proxy-Dimensionierung berechnet wurde. Siehe [Backup Proxy Design](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies) für Details.

Die Anzahl der erforderlichen Kerne kann berechnet werden, indem die Anzahl der Proxy-Kerne durch drei geteilt wird. Zum Beispiel:

```
Proxy: 20 Kerne / 3 = 7 Kerne (aufgerundet)
```

Die empfohlene Mindestgröße für ein Repository beträgt zwei Kerne und 8 GB RAM.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#scalability)Skalierbarkeit

Veeam Backup & Replication unterstützt eine Vielzahl von Repository-Typen, darunter:

-   Scale-Out-Repository
-   NAS-Backup-Repository
-   Blockspeicher (DAS/SAN)
-   Deduplizierungs-Appliances
-   Objekt-Repository

Die Skalierbarkeit eines Repositories sollte sorgfältig geplant werden, um sicherzustellen, dass es mit dem Wachstum der Datenmengen und der Anzahl der Backup-Jobs mithalten kann.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#security)Sicherheit

Die Sicherheit des Backup-Repositories ist von größter Bedeutung. Hier sind einige Best Practices:

-   Implementieren Sie strenge Zugriffsrichtlinien und -kontrollen.
-   Verschlüsseln Sie Backup-Daten sowohl im Ruhezustand als auch während der Übertragung.
-   Überwachen und protokollieren Sie Zugriffe auf das Repository.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#performance)Leistung

Die Leistung des Backup-Repositories kann durch folgende Maßnahmen verbessert werden:

-   Verwendung von schnellen Festplatten (SSD/NVMe) für kritische Daten.
-   Optimierung des Netzwerks für hohe Durchsatzraten.
-   Regelmäßige Wartung und Überprüfung der Repository-Gesundheit.

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#references)Referenzen

-   [Veeam Help Center - Backup Copy](https://helpcenter.veeam.com/docs/backup/vsphere/backup_copy.html) - Über die 3-2-1-Regel
-   [Veeam Help Center - Repository System Requirements](https://helpcenter.veeam.com/docs/backup/vsphere/system_requirements.html#repo)
-   [Veeam Help Center - Backup Repository Section](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository.html)
-   [Veeam Plug-ins für Enterprise-Anwendungen](https://helpcenter.veeam.com/docs/backup/plugins/overview.html)

___

## Inhaltsverzeichnis

-   [Scale-Out-Repositories](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/scaleout.html)
-   [Repository-Speicher](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html)
-   [NAS-Backup-Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html)
-   [NAS-Cache-Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nascache.html)
-   [Blockspeicher (DAS/SAN)](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/block.html)
-   [Data Domain](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html)
-   [Deduplizierungs-Appliances](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html)
-   [Exagrid](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/exagrid.html)
-   [StoreOnce](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html)
-   [Gateway-Server](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html)
-   [Objekt-Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/object.html)
-   [Veeam Ready](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/veeamready.html)

___
