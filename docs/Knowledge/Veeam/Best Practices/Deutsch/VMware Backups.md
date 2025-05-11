# VMware Backups

- [VMware Backups](#vmware-backups)
  - [VMware-Backup](#vmware-backup)
  - [1. Initialisierungsphase](#1-initialisierungsphase)
  - [2. Guest Processing](#2-guest-processing)
    - [2.1. Gastverarbeitung für Windows-basierte VMs](#21-gastverarbeitung-für-windows-basierte-vms)
    - [2.2. Gastverarbeitung für Windows-basierte VMs (VIX)](#22-gastverarbeitung-für-windows-basierte-vms-vix)
    - [2.3. Gastverarbeitung für Linux/Unix-basierte VMs](#23-gastverarbeitung-für-linuxunix-basierte-vms)
  - [3. Erstellen eines VM-Snapshots](#3-erstellen-eines-vm-snapshots)
  - [4. Freigeben der Gastbetriebssystemaktivitäten](#4-freigeben-der-gastbetriebssystemaktivitäten)
  - [5. VM-Datentransport](#5-vm-datentransport)
    - [5.1. Datentransportmodus mit direktem Speicherzugriff](#51-datentransportmodus-mit-direktem-speicherzugriff)
    - [5.2. Datentransportmodus der virtuellen Appliance](#52-datentransportmodus-der-virtuellen-appliance)
    - [5.3. Netzwerkdatentransportmodus](#53-netzwerkdatentransportmodus)
  - [6. VM-Snapshot festschreiben](#6-vm-snapshot-festschreiben)
  - [Ressourcen](#ressourcen)

## VMware-Backup

Dieser Abschnitt enthält eine schrittweise Beschreibung eines in Veeam Backup & Replication implementierten Sicherungsprozesses für virtuelle VMware-Maschinen.

## 1. Initialisierungsphase

Ein Sicherungsauftrag kann automatisch oder manuell in der Veeam Backup & Replication-Konsole, der Veeam Backup Enterprise Manager-Webkonsole, mittels PowerShell, RESTful API und anderen Mitteln gestartet werden.

In der Initialisierungsphase bereitet Veeam Backup & Replication die für einen Backup-Job erforderlichen Ressourcen vor. Damit Sie die Firewall-Einstellungen und den Ablauf der Verbindungsinitiierung besser verstehen, wird der Prozess im folgenden Diagramm veranschaulicht (siehe unten):

1. Wenn ein Sicherungsauftrag initialisiert wird, wird der Veeam Backup Manager-Prozess auf dem Veeam-Sicherungsserver gestartet.
2. Veeam Backup Manager liest Jobeinstellungen aus der Veeam Backup-Konfigurationsdatenbank und erstellt eine Liste der zu verarbeitenden VM-Aufgaben (eine Aufgabe steht für eine VM-Festplatte).
3. Veeam Backup Manager stellt eine Verbindung zum Veeam Backup Service her. Der Veeam Backup Service enthält eine Ressourcenplanungskomponente zur Verwaltung aller Aufgaben und Ressourcen in der Backup-Infrastruktur. Der Ressourcenplaner prüft, welche Ressourcen verfügbar sind, und weist Backup-Proxys und -Repositorys zu, um diese Jobaufgaben mithilfe des Lastenausgleichs von Veeam zu verarbeiten.
4. Nachdem die erforderlichen Ressourcen der Backup-Infrastruktur zugewiesen wurden, stellt Veeam Backup Manager eine Verbindung zu den Transportdiensten im Zielrepository und auf dem Backup-Proxy her. Die Transportdienste wiederum starten die Veeam Data Mover. Auf dem Backup-Proxy wird für jede Aufgabe, die der Proxy verarbeitet, ein neuer Veeam Data Mover gestartet.
5. Veeam Backup Manager stellt eine Verbindung mit Veeam Data Movers im Backup-Repository und Backup-Proxy her und legt eine Reihe von Regeln für die Datenübertragung fest (z. B. Regeln zur Drosselung des Netzwerkverkehrs usw.).
6. Veeam Data Mover auf dem Backup-Proxy und dem Repository stellen zur Datenübertragung eine Verbindung miteinander her.
7. Veeam Backup Manager stellt eine Verbindung zum vCenter Server oder ESXi-Host her und sammelt Metadaten über VMs und Hosts, die am Backup-Prozess beteiligt sind. In diesem Schritt wird keine Verbindung zwischen dem Veeam-Backup-Server und den VM-Gastnetzwerken hergestellt.

![Workflow für Sicherungsaufträge](https://bp.veeam.com/vbr/Support/S_Vmware/media/backup_image49.png)

## 2. Guest Processing

### 2.1. Gastverarbeitung für Windows-basierte VMs

Bei VMs mit Microsoft Windows-Gastbetriebssystem erhält Veeam Backup & Replication Informationen zu den IP-Adressen des Gasts von VMware Tools. Veeam verwendet diese IP-Adressen, um eine Verbindung zum Gastbetriebssystem herzustellen und Verarbeitungsaufgaben im Gast auszuführen (sofern die anwendungsbezogene Bildverarbeitung aktiviert ist).

Wenn keine Verbindung zum Gastbetriebssystem möglich ist oder die Verbindung durch eine Firewall blockiert wird, versucht Veeam Backup & Replication, eine Verbindung mithilfe von VIX herzustellen, wie in Abschnitt 2b beschrieben.

![Windows](https://bp.veeam.com/vbr/Support/S_Vmware/media/backup_image50.png)

### 2.2. Gastverarbeitung für Windows-basierte VMs (VIX)

Wenn keine Netzwerkverbindung zum VM-Gastbetriebssystem besteht, verwendet Veeam Backup & Replication den von VMware Tools (VIX) bereitgestellten Kommunikationskanal, um mit dem Gastbetriebssystem zu interagieren und Verarbeitungsaufgaben im Gastbetriebssystem auszuführen.

![Gästeabwicklung](https://bp.veeam.com/vbr/Support/S_Vmware/media/backup_image51.png)

### 2.3. Gastverarbeitung für Linux/Unix-basierte VMs

Wenn in den Eigenschaften des Sicherungsauftrags Pre-Freeze- und Post-Thaw-Skripte aktiviert sind, erhält Veeam Backup & Replication von VMware Tools Informationen zur IP-Adresse des Gasts. Veeam verwendet diese IP-Adresse, um über SSH eine Verbindung zum Gastnetzwerk herzustellen und Verarbeitungsaufgaben im Gast auszuführen. Skripte befinden sich auf dem Sicherungsserver und werden zum Zeitpunkt der Sicherung in das Gastbetriebssystem eingefügt.

Wenn keine Netzwerkverbindung mit einer Linux-basierten VM besteht, unterstützt Veeam Backup & Replication v10 jetzt auch die VIX-Verarbeitung für Linux-Betriebssysteme und führt ein Failover auf diese Methode durch.

Zu beachten ist, dass Pre-Freeze- und Post-Thaw-Skripte für Linux keine Erhöhung des Root-Rechts (sudo) durchführen, wenn die netzwerklose Verarbeitung (VIX) verwendet wird.

## 3. Erstellen eines VM-Snapshots

Jetzt fordert Veeam Backup & Replication den vCenter Server oder ESXi-Host auf, die Erstellung eines VM-Snapshots zu initiieren. Ein VM-Snapshot ist erforderlich, um VMware VADP-Backup-Methoden zu verwenden und Funktionen wie VMware Changed Block Tracking (CBT) zu nutzen.

![Snapshot-Prozess](https://bp.veeam.com/vbr/Support/S_Vmware/media/backup_image52.png)

## 4. Freigeben der Gastbetriebssystemaktivitäten

Unmittelbar nach der Erstellung des VM-Snapshots werden alle ruhenden Festplatten-E/A-Aktivitäten im Gastbetriebssystem wieder aufgenommen.

## 5. VM-Datentransport

Zum Lesen und Übertragen von Daten aus dem VM-Snapshot kann Veeam Backup & Replication einen der folgenden Transportmodi verwenden:

- Direkter SAN-Zugriff
- Virtuelle Appliance (HotAdd)
- Netzwerk (NBD)

Weitere Informationen zu den einzelnen Transportmodi finden Sie im Abschnitt [„Transportmodi"](https://helpcenter.veeam.com/docs/backup/vsphere/transport_modes.html) des Veeam Backup & Replication-Benutzerhandbuchs oder in einem entsprechenden Abschnitt auf dieser Site.

### 5.1. Datentransportmodus mit direktem Speicherzugriff

Im Modus „Direkter Speicherzugriff" stellt der Veeam-Backup-Proxy eine Verbindung zum ESXi-Host her, auf dem sich die VM befindet, und liest die erforderlichen VM-Konfigurationsdateien (z. B. \*.vmx) per NFC über Port 902. Backup-Proxys verwenden VM-Konfigurationsdetails, um VM-Daten direkt aus dem SAN/NAS-Datenspeicher zu lesen.

![Direkter SAN-Backup-Workflow](https://bp.veeam.com/vbr/Support/S_Vmware/media/backup_image53.png)

### 5.2. Datentransportmodus der virtuellen Appliance

Im Transportmodus „Virtual Appliance" stellt der Veeam-Backup-Proxy eine Verbindung zum ESXi-Host her, auf dem sich die VM befindet, und liest die erforderlichen VM-Konfigurationsdateien (z. B. \*.vmx) mithilfe von NFC über Port 902. VM-Festplatten werden im Snapshot-Zustand per Hot-Add zu einem virtualisierten Veeam-Backup-Proxy hinzugefügt. Der Proxy liest VM-Daten über den ESXi vSCSI-Stack und hebt die Zuordnung der VM-Festplatten auf, wenn der Vorgang abgeschlossen ist.

![Workflow zur Sicherung virtueller Appliances](https://bp.veeam.com/vbr/Support/S_Vmware/media/backup_image54.png)

### 5.3. Netzwerkdatentransportmodus

Im Netzwerktransportmodus stellt der Veeam-Backup-Proxy eine Verbindung zum ESXi-Host her, auf dem sich die VM befindet, und liest die erforderlichen VM-Konfigurationsdateien (z. B. \*.vmx) mithilfe von NFC über Port 902. In diesem Modus wird derselbe Datenkanal auch zum Lesen der VM-Festplattendaten verwendet.

![NBD-Backup-Workflow](https://bp.veeam.com/vbr/Support/S_Vmware/media/backup_image55.png)

## 6. VM-Snapshot festschreiben

Nachdem der Veeam-Backup-Proxy das Lesen der VM-Daten abgeschlossen hat, fordert der Veeam-Backup-Server den vCenter Server oder ESXi-Host auf, ein VM-Snapshot-Commit zu initiieren.

![Snapshot-Commit](https://bp.veeam.com/vbr/Support/S_Vmware/media/backup_image56.png)

---

## [](https://bp.veeam.com/vbr/Support/S_Vmware/backup.html#resources)Ressourcen

- [Standardmäßige VMware Tools-Skripte](https://docs.vmware.com/en/VMware-vSphere/6.0/com.vmware.vsphere.vm_admin.doc/GUID-A024460D-28A4-4541-B6BB-CFA1A31D9CE9.html#GUID-A024460D-28A4-4541-B6BB-CFA1A31D9CE9)
- [Transportmittel](https://helpcenter.veeam.com/docs/backup/vsphere/transport_modes.html)
- [Veeam Hilfecenter - So funktioniert VMware Backup](https://helpcenter.veeam.com/docs/backup/vsphere/backup_hiw.html)

---
