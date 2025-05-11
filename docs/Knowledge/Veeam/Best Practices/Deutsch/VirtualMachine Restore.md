
# VM-Wiederherstellung

- [VM-Wiederherstellung](#vm-wiederherstellung)
  - [1. Initialisierungsphase](#1-initialisierungsphase)
  - [2. Wiederherstellen der VM-Konfiguration](#2-wiederherstellen-der-vm-konfiguration)
  - [3. VM-Snapshot erstellen](#3-vm-snapshot-erstellen)
  - [4. VM-Datentransport](#4-vm-datentransport)
    - [4.1. Datentransportmodus mit direktem Speicherzugriff](#41-datentransportmodus-mit-direktem-speicherzugriff)
    - [4.2. Datentransportmodus der virtuellen Appliance](#42-datentransportmodus-der-virtuellen-appliance)
    - [4.3. Netzwerkdatentransportmodus](#43-netzwerkdatentransportmodus)
  - [5. VM-Snapshot festschreiben](#5-vm-snapshot-festschreiben)
  - [Ressourcen](#ressourcen)

Dieser Abschnitt enthält eine schrittweise Beschreibung eines vollständigen Wiederherstellungsprozesses für virtuelle Maschinen, der in Veeam Backup & Replication implementiert ist.

## 1. Initialisierungsphase

In der Initialisierungsphase bereitet Veeam Backup & Replication die für eine vollständige VM-Wiederherstellung erforderlichen Ressourcen vor. Dabei werden die folgenden Schritte ausgeführt:

1. Startet die notwendigen Prozesse auf dem Veeam Backup Server.
2. Überprüft die verfügbaren Ressourcen der Backup-Infrastruktur und weist einen Proxyserver für die Übertragung wiederhergestellter VM-Daten auf den Zielhost/-datenspeicher zu.
3. Kommuniziert mit Transport Services auf dem Backup-Proxy und dem Backup-Repository, wo sich die Backup-Dateien befinden. Transport Services wiederum starten Veeam Data Movers. Veeam Data Movers auf dem Backup-Proxy und dem Backup-Repository stellen für die Datenübertragung eine Verbindung miteinander her.
4. Stellt eine Verbindung zum vCenter Server oder ESXi-Host her, bei dem die wiederhergestellte VM registriert wird.

![VM-Wiederherstellungsworkflow](https://bp.veeam.com/vbr/Support/S_Vmware/media/vm_restore_image57.png)

## 2. Wiederherstellen der VM-Konfiguration

Veeam Backup & Replication ruft VM-Konfigurationsdaten aus dem Backup ab und stellt sie auf dem ausgewählten ESXi-Host/Datenspeicher wieder her. Anschließend weist es VMware vSphere an, die wiederhergestellte VM auf dem Host zu registrieren. Wenn ein Benutzer während der Wiederherstellung die VM-Konfiguration ändern möchte (z. B. Festplattenformat oder Netzwerkeinstellungen), nimmt Veeam die erforderlichen Änderungen vor.

![Wiederherstellen der VM-Konfiguration](https://bp.veeam.com/vbr/Support/S_Vmware/media/vm_restore_image58.png)

## 3. VM-Snapshot erstellen

Veeam Backup & Replication fordert den vCenter Server oder ESXi-Host auf, die Erstellung eines VM-Snapshots auf der wiederhergestellten VM zu initiieren.

![VM-Wiederherstellungs-Snapshot](https://bp.veeam.com/vbr/Support/S_Vmware/media/vm_restore_image59.png)

## 4. VM-Datentransport

Veeam Backup Manager weist VMware vSphere an, virtuelle Datenträger für die VM zu erstellen.

Um VM-Festplattendaten in den Zieldatenspeicher zu schreiben, kann Veeam Backup & Replication einen der drei Transportmodi verwenden:

- Direkter Speicherzugriff
- Virtuelle Appliance (HotAdd)
- Netzwerk (NBD)

Weitere Informationen zu den einzelnen Transportmodi finden Sie unter \[Veeam-Transportmodi\] im Benutzerhandbuch und im [entsprechenden Abschnitt](https://bp.veeam.com/vbr/Support/S_Vmware/backup.html#5-vm-data-transport) dieses Dokuments.

### 4.1. Datentransportmodus mit direktem Speicherzugriff

Dieser Modus ist für VMs, die über mindestens eine Thin-Provisioning-Festplatte verfügen, nicht verfügbar.

Im Modus „Direkter Speicherzugriff" stellt Veeam Backup & Replication eine Verbindung zum ESXi-Host her, auf dem die wiederhergestellte VM registriert ist. Der ESXi-Host lokalisiert die VM-Festplatten, ruft Metadaten zum Festplattenlayout auf dem Speicher ab und sendet diese Metadaten an den Backup-Proxy. Der Backup-Proxy verwendet diese Metadaten, um VM-Datenblöcke über das entsprechende SAN/NAS-Protokoll in den Datenspeicher zu kopieren.

![Direkte Speicherwiederherstellung](https://bp.veeam.com/vbr/Support/S_Vmware/media/vm_restore_image60.png)

Für SAN-Wiederherstellungen muss der Proxy Schreibzugriff auf die LUN(s) haben, die zum Erstellen des Ziel-Datastores verwendet werden. NAS-Wiederherstellungen verwenden den NFS-Client des Proxys.

### 4.2. Datentransportmodus der virtuellen Appliance

Im Transportmodus „Virtual Appliance" werden VM-Festplatten aus dem Backup per Hot-Add zu einem virtualisierten Veeam-Backup-Proxy hinzugefügt. Der Proxy stellt eine Verbindung zum ESXi-Host her, auf dem sich die wiederhergestellte VM befindet, und überträgt Festplattendaten über den ESXi vSCSI-Stack an den Zieldatenspeicher. Wenn der Datenübertragungsprozess abgeschlossen ist, werden die Festplatten vom Backup-Proxy getrennt.

![Wiederherstellung der virtuellen Appliance](https://bp.veeam.com/vbr/Support/S_Vmware/media/vm_restore_image61.png)

### 4.3. Netzwerkdatentransportmodus

Im Netzwerktransportmodus stellt der Veeam-Backup-Proxy eine Verbindung zum ESXi-Host her, auf dem sich die wiederhergestellte VM befindet, und schreibt VM-Festplattendaten mithilfe von NFC über TCP-Port 902 über den LAN-Kanal in den Zieldatenspeicher.

![NBD-Wiederherstellung](https://bp.veeam.com/vbr/Support/S_Vmware/media/vm_restore_image62.png)

## 5. VM-Snapshot festschreiben

Nachdem der Proxy das Schreiben der VM-Festplattendaten abgeschlossen hat, fordert Veeam Backup & Replication den vCenter Server oder ESXi-Host auf, ein Snapshot-Commit für die wiederhergestellte VM zu initiieren.

![Snapshot-Commit wiederherstellen](https://bp.veeam.com/vbr/Support/S_Vmware/media/vm_restore_image63.png)

## Ressourcen

- [Veeam Hilfecenter - Vollständige VM-Wiederherstellung](https://helpcenter.veeam.com/docs/backup/vsphere/full_recovery.html)
- [Veeam-Transportmodi](https://helpcenter.veeam.com/docs/backup/vsphere/transport_modes.html)
- [VM-Datentransport](https://bp.veeam.com/vbr/Support/S_Vmware/backup.html#5-vm-data-transport)

---
