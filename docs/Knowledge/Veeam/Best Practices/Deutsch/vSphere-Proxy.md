
---
created: 2024-08-01T13:48:42 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html
author: 
---

# vSphere-Proxy | Veeam Backup & Replikations-Best-Practice-Leitfaden

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#veeam-vmware-vsphere-backup-proxy)Veeam VMware vSphere Backup-Proxy

Die Wahl des richtigen Veeam-Proxy-Server-Designs für Ihre Umgebung gibt Ihnen viel Kontrolle über die Auswirkungen auf die vSphere-Infrastruktur und den Backup-Datenverkehr. Proxies sind die Arbeitspferde und entscheidende Komponenten, um gute Backup- und Wiederherstellungsgeschwindigkeiten zu erzielen.

Beim Nachdenken über das Proxy-Design müssen Sie mit den verschiedenen [Transportmodi](https://helpcenter.veeam.com/docs/backup/vsphere/transport_modes.html) vertraut sein, um Einschränkungen, Anforderungen usw. für die Platzierung und das Design des Proxys zu verstehen.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#proxy-placement)Proxy-Platzierung

Je nach gewähltem Transportmodus benötigen Sie möglicherweise virtuelle Proxies (Hot-Add, auch bekannt als Virtual Appliance Mode) oder physische Proxies (Direct SAN Access via iSCSI oder FC/Backup von Storage-Snapshots).

Es wird empfohlen, den Proxy-Server so nah wie möglich an den Quelldaten mit einer Hochgeschwindigkeitsverbindung zu platzieren. Der Datenverkehr vom Quell- zum Proxy-Server ist noch nicht optimiert (keine Komprimierung oder Deduplizierung), was bedeutet, dass 100% der Backup-Daten über diese Verbindung übertragen werden.

Berücksichtigen Sie auch eine gute Verbindung zwischen Proxy und Repository. Optimierte Daten (normalerweise ~50% der Quell-Datengröße nach Komprimierung und Deduplizierung) werden hier übertragen.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#proxy-os-requirements)Proxy-Betriebssystemanforderungen

Wir empfehlen die neueste unterstützte Version von Windows Server OS oder unterstütztem Linux OS für alle Proxies.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#vmware-transport-modes)VMware-Transportmodi

-   **Direct Storage Access**: Nutzt die SAN-Verbindung für den Datenzugriff. Unterstützt Fibre Channel (FC) und iSCSI.
-   **Virtual Appliance (Hot Add)**: Fügt dem Proxy-Server vDisk aus der VM hinzu.
-   **Network Mode (NBD and NBDSSL)**: Nutzt die Netzwerkkarte des ESXi-Hosts.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#proxy-sizing)Proxy-Dimensionierung

Die Größe des Proxys sollte auf der Anzahl der gleichzeitigen Aufgaben basieren, die er bewältigen kann. Ein allgemeiner Richtwert ist:

-   1 vCPU für jede gleichzeitige Aufgabe.
-   2 GB RAM pro vCPU.

**Beispiel**: Wenn ein Proxy 4 gleichzeitige Aufgaben bewältigen soll, sollte er 4 vCPUs und 8 GB RAM haben.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#minimum-proxy-requirements)Minimale Proxy-Anforderungen

Für kleinere Umgebungen oder Testzwecke kann ein einzelner Proxy-Server mit allen erforderlichen Ressourcen empfohlen werden. Ein einzelner Proxy-Server stellt jedoch einen Single Point of Failure (SPOF) dar.

Es wird empfohlen, mindestens zwei Proxy-Server pro Standort bereitzustellen, um eine Mindestverfügbarkeit für diese Rolle zu gewährleisten.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#spare-resources-for-proxy-role)Freie Ressourcen für die Proxy-Rolle

Es wird auch empfohlen, die Ressourcen zu berücksichtigen, die für Wiederherstellungsoperationen benötigt werden, da einige davon ebenfalls Proxy-Ressourcen erfordern. Berücksichtigen Sie auch, dass Sie, wenn alle Ihre Jobs laufen und alle Proxy-Ressourcen mit der Verarbeitung dieser Jobs beschäftigt sind, keine Ressourcen haben, um beispielsweise eine vollständige VM-Wiederherstellung durchzuführen, es sei denn, Sie haben freie Ressourcen für diese Operationen.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#proxy-servers-and-replication-jobs)Proxy-Server und Replikationsaufgaben

Bitte beachten Sie, dass auch Replikationsaufgaben Proxy-Ressourcen an Quell- und Zielstandorten erfordern. Diese Ressourcen kommen zusätzlich zu den Ressourcen, die für Backup-Aufgaben benötigt werden. Berücksichtigen Sie die erforderlichen Ressourcen sowohl für Backup- als auch für Replikationsaufgaben, wenn Sie beide Arten von Aufgaben innerhalb des gleichen Backup-Fensters ausführen möchten.

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#references)Referenzen

-   [Transportmodi](https://helpcenter.veeam.com/docs/backup/vsphere/transport_modes.html)
-   [Veeam Backup Proxy](https://helpcenter.veeam.com/docs/backup/vsphere/backup_proxy.html)
-   [Begrenzung gleichzeitiger Aufgaben](https://helpcenter.veeam.com/docs/backup/vsphere/limiting_tasks.html)
-   [Proxy-Anforderungen](https://helpcenter.veeam.com/docs/backup/vsphere/system_requirements.html?#proxy)
-   [Build - vSphere Proxy](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_backup_proxies/vmware_proxies.html)

___
