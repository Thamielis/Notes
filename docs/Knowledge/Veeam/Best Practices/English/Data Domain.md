---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html
author: 
---

# Data Domain | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html#data-domain-dell-powerprotect-dd)Data Domain (Dell PowerProtect DD)

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html#data-domain-mtree-overview-and-limits)Data Domain MTree overview and limits

Dell EMC defines MTrees as logical partitions of the file system and they are identified by unique names. MTrees are used to create (protocols can be mixed, except VTL):

-   DD Boost storage units
-   VTL pools
-   NFS/SMB shares

MTrees allow granular management of snapshots and quotas. Quotas apply only to logical data written to an MTree.

There is a fixed amount of MTrees that can be created on a Data Domain system and it depends by the model and DD OS version.

| Data Domain system | DD OS version | Configurable MTrees | Concurrently active MTrees |
| --- | --- | --- | --- |
| DD9900 | 7.0+ | 256 | 256 |
| DD6900, DD9400 | 7.0+ | 128 | 128 |
| DD6400 | 7.7+ | 128 | 128 |
| DD9800 | 7.7+ | 256 | 256 |
| DD6800, DD9300 | 6.0+ | 128 | 128 |
| DD6300 | 6.0+ | 100 | 32 |

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html#data-domain-replication-overview)Data Domain replication overview

Data Domain Replicator is a technology that allows replication between two (or more) Data Domain systems. The replication process is network-efficient as no data re-hydrate happens when transferring data between two systems.

To reduce bandwidth usage, Data Domain Replicator performs two levels of deduplication:

-   local – determines the unique segments that must be replicated over WAN
-   cross-site – it further reduces bandwidth requirement when multiple systems are replicating to the same target (many to one architecture)

_Data Domain Replicator_ is a **licensed feature**.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html#replication-types)Replication types

Replication always involves at least two Data Domain systems, identified as source and destination and each system can be both source and destination (cross-replication). The process is always asynchronous.

A Data Domain can be set up for different kind of replication, such as:

-   Directory – replication based on single directory (the smallest entity within an MTree)
-   Collection – entire Data Domain content
-   MTree – entire MTree replication, including all subfolders

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html#veeam-backup-copy-vs-data-domain-replication)Veeam Backup Copy vs Data Domain Replication

Data Domain replication provides higher levels of data reduction than Veeam Backup Copy, but it sits outside of Veeam control and it is not possible to monitor the status of the replication process from Veeam console. Also, be aware that the backup copies will need to be reimported into Veeam before they can be used for restore.

Veeam Backup Copies are still highly efficient as they only transfer changed blocks, but the key advantage is that they do not need to be reimported before they can be used for restore. This results in a much faster restore process, and less manual intervention.

NOTE: The process of importing the Data Domain backups can be done through scripting using the following PowerShell commands:

[Add-VBRBackupRepository](https://helpcenter.veeam.com/docs/backup/powershell/add-vbrbackuprepository.html)

[Sync-VBRBackupRepository](https://helpcenter.veeam.com/docs/backup/powershell/sync-vbrbackuprepository.html)

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html#data-domain-replication-considerations)Data Domain Replication considerations

Watch the load on the DataDomain systems. Replication may get stuck with lower-end DataDomains, especially when undersized and with constant high load. While the issue is acknowledged and a fix may be in the way, parallelism in this case should be avoided, as doing backup and DD replication sequentially works properly.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html#references)References

-   [Alliance Partner Integrations & Qualifications - DellEMC Deduplication Target](https://www.veeam.com/alliance-partner-integrations-qualifications.html?alliancePartner=dell-technologies&type=deduplication-target)
-   [Knowledge Base - Deduplication Appliance Best Practices](https://www.veeam.com/kb1745)
-   [Helpcenter - Dell EMC Data Domain](https://helpcenter.veeam.com/docs/backup/vsphere/emc_dd.html)
-   [Dell EMC DD OS Administration Guide](https://www.delltechnologies.com/asset/en-us/products/data-protection/technical-support/docu95865.pdf)

___
