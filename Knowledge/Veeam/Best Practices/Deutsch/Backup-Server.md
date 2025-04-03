
---
created: 2024-08-01T13:48:41 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html
author: 
---

# Backup-Server | Veeam Backup & Replikations-Best-Practice-Leitfaden

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#veeam-backup-server)Veeam Backup-Server

In diesem Abschnitt beschreiben wir, wie der Veeam Backup-Server entworfen und dimensioniert wird.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#single--or-multi--role)Einzelne oder mehrere Rollen

Die erste Entscheidung, die ein Designer treffen muss, ist, ob der Veeam-Server eine Maschine sein wird, die ausschließlich die zentrale Komponente einer Veeam Backup & Replication-Umgebung ausführt, oder ob er mehrere Rollen gleichzeitig hosten wird. Diese Entscheidung hängt in der Regel von der Größe und Komplexität der Umgebung ab:

-   All-in-One (Appliance-Modell): Alle Veeam-Komponenten (Backup-Server, Proxy, Repository und möglicherweise andere) sind auf einer einzigen Maschine installiert. In diesem Fall müssen die verschiedenen Konfigurationszahlen zusammengezählt werden, um die endgültige erforderliche Größe des Servers zu ermitteln.
-   Scale-out (Dedizierter Server): Die Maschine, auf der der Backup-Server installiert ist, führt nur diesen Dienst aus (möglicherweise sind auch Enterprise Manager und SQL-Server installiert), sodass die Dimensionierungsberechnungen nur diese Rollen betreffen.

Die Wahl des Bereitstellungsmodus hängt von mehreren Überlegungen ab. Hier sind einige davon:

-   All-in-One ist einfacher, erfordert minimalen Designaufwand (wir müssen nur den zugrunde liegenden Server dimensionieren) und der Veeam-Server ist eigenständig. Wenn dies auf einer physischen Maschine erfolgt, ist diese „Appliance“ völlig unabhängig von der Umgebung, die sie schützt. Es wird jedoch auch zu einem einzelnen Fehlerpunkt, da keine Redundanz vorhanden ist.
-   Das Scale-out-Modell ist leistungsfähiger: Wir können eine „Steuerebene“ betreiben, die VBR+EM+SQL in einer virtuellen Umgebung ausführt, um die Hochverfügbarkeitsfunktionen zu nutzen, ...

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#placement)Platzierung

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#backup-only-scenario)Nur-Backup-Szenario

Bei der Planung, Veeam Backup & Replication nur für Backup-Jobs zu verwenden, sollte der Backup-Server im Hauptrechenzentrum neben der zu schützenden Infrastruktur platziert werden, um schnelle Reaktionszeiten und lokalen Verwaltungsverkehr zu gewährleisten.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#when-replication-or-cdp-continuous-data-protection-is-in-use)Bei Verwendung von Replikation oder CDP (Continuous Data Protection)

Wenn Replikation oder CDP zwischen mehreren Standorten verwendet wird, sollte der Backup-Server im DR-Standort bereitgestellt werden, um sicherzustellen, dass Failover-Pläne nahtlos funktionieren, selbst im Fall eines vollständigen Ausfalls des primären Standorts. In diesem Fall sollte das Scale-out-Modell verwendet werden, sodass der Datenverkehr für Backups im primären Rechenzentrum bleibt, während nur Verwaltungs- und Replikationsverkehr zwischen den beiden Rechenzentren fließt.

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#references)Referenzen

_Für die Dimensionierung und Konfiguration des Backup-Servers siehe den Abschnitt [Build - Backup-Server](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_VBR_Server/Backup_Server.html) dieses Leitfadens._

-   [Build - Backup-Server](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_VBR_Server/Backup_Server.html)
-   [Benutzerhandbuch - Backup-Server](https://helpcenter.veeam.com/docs/backup/vsphere/backup_server.html)
-   [Benutzerhandbuch - Systemanforderungen](https://helpcenter.veeam.com/docs/backup/vsphere/system_requirements.html#backup_server)
-   [Benutzerhandbuch - Installationseinstellungen](https://helpcenter.veeam.com/docs/backup/vsphere/install_vbr_settings.html)
-   [Benutzerhandbuch - Veeam Backup-Katalog](https://helpcenter.veeam.com/docs/backup/vsphere/indexing_catalog.html)

___
