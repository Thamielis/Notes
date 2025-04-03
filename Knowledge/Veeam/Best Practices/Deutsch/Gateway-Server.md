
---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html
author: 
---

# Gateway-Server | Veeam Backup & Replikations-Best-Practice-Leitfaden

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html#veeam-gateway-server)Veeam Gateway-Server

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html#the-gateway-paradigm)Das Gateway-Paradigma

Für jeden Repository-Typ, der den Veeam-Transport-Agent nicht hosten kann, muss ein Repository-Gateway ausgewählt werden. Der Gateway-Server empfängt Daten von den Proxies, dekomprimiert die Daten optional, erstellt die Backup-Dateien und schreibt sie auf den Speicher.

Die Gateway-Auswahl kann statisch oder automatisch erfolgen. Jede Option hat Vor- und Nachteile, die unten erklärt werden. In jedem Fall muss die Gateway-Auswahl sorgfältig geprüft werden, da sie das gesamte Verhalten der Veeam-Arbeitslast beeinflusst.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html#gateway-compute-sizing)Größenbestimmung der Gateway-Berechnung

Die Gateway-Berechnung kann als äquivalent zur Standard-Repository-Berechnung betrachtet werden (siehe den entsprechenden Abschnitt dieses Leitfadens für weitere Berechnungsregeln). Es wird empfohlen, ein Verhältnis von 3:1 gegenüber der Proxy-Berechnung basierend auf der Anzahl der parallelen Aufgaben anzuwenden, die erforderlich sind, um das Backup-Fenster zu erfüllen.

Ein wichtiger Punkt, den Sie bei der Dimensionierung des Repository-Gateways beachten sollten, ist, dass es möglicherweise auch zur Bearbeitung sekundärer Aufgaben wie Backup-Kopie-Jobs verwendet wird.

Wenn das Gateway nicht mit dem Proxy gekoppelt ist, ist seine Dimensionierung die gleiche wie bei jedem einfachen Repository.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html#automatic-gateway)Automatisches Gateway

Bitte beziehen Sie sich auf das Helpcenter, um zu verstehen, [wie die automatische Gateway-Auswahl funktioniert](https://helpcenter.veeam.com/docs/backup/vsphere/gateway_server.html).

### Vorteile

-   Automatische Auswahl basierend auf der Verfügbarkeit von Gateways
-   Lastenausgleich

### Nachteile

-   Weniger Kontrolle über die Gateway-Auswahl

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html#static-gateway)Statisches Gateway

Ein statisches Gateway wird manuell zugewiesen und bleibt für alle Jobs konstant.

### Vorteile

-   Bessere Kontrolle über die Gateway-Auswahl
-   Konsistenz in der Leistung

### Nachteile

-   Kein Lastenausgleich

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html#gateway-scenarios)Gateway-Szenarien

### Automatisches Gateway

Automatische Gateway-Auswahl ist ideal für große, skalierbare Konfigurationen, bei denen nur Backup und Wiederherstellung wichtig sind. Virtuelle Maschinen als Proxy- und Gateway-Server bieten eine effektive Leistung und Skalierbarkeit, ohne zusätzlichen physischen Platzbedarf.

![alt text](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/media/Gateways_1.jpg "Many to one configuration")

### Statisches Gateway

Ein statisches Gateway wird bevorzugt, wenn Backup-Kopie-Jobs, LAN-freie Backups oder intensive Verwendung von Agent-Backups erforderlich sind, da es Vorhersehbarkeit bietet.

![alt text](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/media/Gateways_2.jpg "Many to many configuration")

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html#references)Referenzen

-   [Veeam Help Center - Gateway Server](https://helpcenter.veeam.com/docs/backup/vsphere/gateway_server.html)
-   [Repository Design](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/index)

___
