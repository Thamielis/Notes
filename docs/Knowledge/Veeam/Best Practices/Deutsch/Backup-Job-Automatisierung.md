
---
created: 2024-08-01T11:39:45 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_automation.html
author: 
---

# Backup-Job-Automatisierung | Veeam Backup & Replication Best Practice Guide

> ## Auszug
> Best Practices aus dem Feld für Veeam Backup & Replication

---
Automatisierung hilft, das Design und die Konfiguration von Jobs zu vereinfachen. Sie erleichtert auch den täglichen Betrieb.

**Wichtig:** Beim Erstellen von Jobs auf Basis von Containern sicherstellen, dass die konfigurierten Konstrukte nicht überlappen.

Mit Veeam können Sie Jobs basierend auf VM-Tags erstellen, was zur Automatisierung der Jobkonfiguration beitragen kann. Anstatt die VMs manuell auszuwählen, die Sie in den Job aufnehmen möchten, können Sie alle VMs mit einem bestimmten Tag einbeziehen.

Auf diese Weise wird eine neue VM, wenn Sie ihr ein in einem Job verwendetes Tag zuweisen, beim nächsten Joblauf in die Jobverarbeitung einbezogen. Es ist keine Änderung des Jobs erforderlich, wenn Sie das Tag neuen VMs zuweisen.

Es wird empfohlen, die folgenden Richtlinien zu befolgen:

-   Überwachen Sie die Anzahl der automatisch zum Job hinzugefügten VMs, um zu vermeiden, dass zu viele VMs in einem einzigen Job gesichert werden.
-   Es kann nur ein Tag verwendet werden, um eine VM in einen Job einzuschließen.
-   Mit Tags können Sie VMs nach Service Levels klassifizieren und unterschiedliche Backup-Jobs für verschiedene Service Levels verwenden.
-   [Veeam ONE Business View](https://helpcenter.veeam.com/docs/one/monitor/bv.html) kann vSphere-Tags verwalten. Es ermöglicht die Erstellung von Klassifizierungsregeln und aktualisiert die entsprechenden Tags in vCenter. Klassifizierungen können aus CPU, RAM, VM-Namenskonvention, Ordner, Ressourcenpool, Datenspeicher usw. definiert werden. Business View kann auch VM/Host/Datenspeicher-Beschreibungen aus einer CSV-Datei importieren. Diese Funktion kann nützlich sein, um VMware-Tags zu aktualisieren, z.B. um eine CMDB zu aktualisieren.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_automation.html#container-based-jobs)Container-basierte Jobs

Das Hinzufügen von Ressourcenpools, Ordnern, Datenspeichern oder vSphere-Tags zu Backup-Jobs erleichtert das Backup-Management erheblich. Sie können die Backup-Jobs an eine VM zuweisen, indem Sie einfach eine VM in den entsprechenden Ordner verschieben, das Tag zuweisen oder die VM in den Ressourcenpool verschieben. Wenn die VM verschoben wird, ist sie beim nächsten Backup-Lauf automatisch im Job enthalten.

Bei Verwendung von Containern ist es wichtig, überlappende Konstrukte zu vermeiden, da dies zu unerwünschten Ergebnissen führen kann. Beispielsweise, wenn Jobs basierend auf Datenspeichern erstellt werden, VMs mit Festplatten, die sich auf mehreren Datenspeichern befinden, die in mehr als einem Backup-Job enthalten sind, werden in jedem Job gesichert.

Vermeiden Sie es, einzelne ESXi-Hosts in einem Backup-/Replika-Job auszuwählen, wenn Sie einen **vSphere Cluster mit DRS** haben. DRS könnte VMs automatisch (vMotion) von einem Host auf einen anderen migrieren, basierend auf Leistungs- oder Affinitätskriterien, was die Jobkonfiguration beeinflussen und dazu führen könnte, dass eine VM nicht mehr durch den Backup-/Replika-Job geschützt ist.

Dasselbe könnte passieren, wenn Sie einen einzelnen Datenspeicher für den Backup-/Replika-Job auswählen und der Datenspeicher zu einem **vSphere Datastore Cluster mit Storage DRS** gehört. Storage DRS könnte die VM (Storage vMotion) basierend auf Leistungs- oder Kapazitätskriterien auf einen anderen Datenspeicher migrieren, was wiederum dazu führen könnte, dass die VM nicht mehr durch einen Backup-/Replika-Job geschützt ist.

**Wichtig:** Es wird empfohlen, in einem Backup-/Replika-Job infrastrukturunabhängige Container/Konstrukte wie **Ordner oder Tags** zu verwenden und die Verwendung von Infrastrukturkomponenten wie Hosts, Datenspeichern oder sogar Clustern zu vermeiden, um unerwartete Verhaltensweisen zu verhindern und die VMs geschützt zu halten. Lösungen wie vRealize Operations Manager könnten sogar VMs von einem vSphere-Cluster zu einem anderen migrieren, indem sie [Workload Optimization](https://docs.vmware.com/en/vRealize-Operations-Manager/8.4/com.vmware.vcom.config.doc/GUID-F7DF8D29-89F3-455B-883B-6DECA11B0114.html) verwenden.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_automation.html#references)Referenzen

-   [Veeam ONE Business View](https://helpcenter.veeam.com/docs/one/monitor/bv.html)
-   [Container Jobs](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_vms_vm.html) - siehe Verweis auf die Symbolleiste zum Wechseln zwischen den Ansichten
-   [vSphere Tags](https://helpcenter.veeam.com/docs/backup/vsphere/vm_tags.html)
-   [VMware vRops Workload Optimizations](https://docs.vmware.com/en/vRealize-Operations-Manager/8.4/com.vmware.vcom.config.doc/GUID-F7DF8D29-89F3-455B-883B-6DECA11B0114.html)

___
