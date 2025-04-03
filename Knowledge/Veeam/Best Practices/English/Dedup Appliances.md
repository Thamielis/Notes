---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html
author: 
---

# Dedup Appliances | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#deduplication-appliances)Deduplication appliances

The main use cases of deduplication appliances are:

-   reducing the storage consumed achieved by eliminating similar blocks of data
-   long-term storage of data.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#considerations)Considerations

Any choice or decision can have a significant impact on the design. Therefore, when considering the use of such appliance, we must ask the following questions and consider what is the most important to our given situation:

-   What are the RPO/RTO requirements?
-   Which (restore) features will be leveraged?
-   Is (backup file) encryption required?
-   Will there be secondary backup copies to another backup repository or tape?

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#rporto)RPO/RTO

These appliances are optimized for write operations, therefore will work great for ingesting lots of backup data. However, random read I/O suffers from the re-hydration processes required during restores (except appliances with a landing zone).

For this reason we recommend using inline deduplication appliances mainly as secondary targets, where parameters such as price per GB are more important than restore performance.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#required-restore-capabilities)Required (restore) capabilities

As mentioned above, with a deduplication appliance RTO is significantly impacted thus impacting the way certain (restore) capabilities will be experienced - unless the deduplication appliance offers a fast non-deduplicated area for the most recent restore points. Therefore it is important to qualify the main requirements when it comes to restore.

For example:

-   **High-priority restores.** You need to urgently migitate a ransomware attack, frequently perform automated restore tests, frequently spin up test environments from your backups, restore large databases or files, be able to restore application items very fast.  
    In this case, it is highly recommended to use a non-deduplicated backup repository (such as a landing zone) to be able to meet the required SLA.
    
-   **Low-priority restores.** You need to restore an entire non-critical VM, restore few files or items from an application not more than once a week. In this case, the restore time is accepted and will therefore meet the SLA.
    

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#encryption)Encryption

VBR supports the encryption of backup files at-rest. This is useful when we try to protect ourselves from backup data theft. However, when writing encrypted backup files to a deduplication appliance, the deduplication efficiency is negatively impacted as two identical blocks will be different after encryption. This results in less reduction of storage consumption and turns the deduplication appliance into a very expensive backup repository.

In this case you can better turn off the backup file encryption option and switch on data encryption on the deduplication appliance itself. This will make sure all data on the storage device is encrypted, but it will only protect against the theft of the physical device itself.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#secondary-copies)Secondary copies

When considering 3-2-1 into the design, it also means we will need to read data from the primary backup repository and copy (or move) it to a secondary backup repository or even tape. This operation puts extra load on the primary backup repository.

As described earlier, random read I/O suffers from the re-hydration processes which means that if a deduplication device is used as a primary backup repository, the performance of creating secondary copies of your backup data will be severely impaired.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#veeam-backup--replication-vbr)Veeam Backup & Replication (VBR)

VBR is a storage-agnostic solution that can use any deduplication appliance as a backup repository. The following use cases are supported:

-   Primary Backup Repository **(not recommended)**
-   Secondary Backup Repository
-   Virtual Tape Library (VTL)

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#integrated-vs-non-integrated)Integrated vs non-integrated

In general there are two types of deduplication appliances:

-   **Integrated.** This type is preferred and uses specific protocols such as DDBoost (DataDomain) and Catalyst (StoreOnce) or they even integrate the Veeam Data Mover agent directly onto their appliance (like Exagrid or Quantum). In this case, VBR can communicate with the storage device and only send the unique blocks instead of all of the new or changed backup data.
    
    Synthetic operations will be performed on the appliance itself, therefore they will require minimal additional time and lower the I/O. Using backup job default settings with (weekly) synthetic full backups will run fine.
    
    _Applies to using as primary and secondary backup repository._
    
-   **Non-integrated.** This type uses standard protocols such as SMB or NFS. In this case, VBR cannot communicate with the storage device directly and sends all of the new or changed backup data resulting in a higher flow of data traffic.
    
    Avoid synthetic operations and use [Active Full Backups](https://helpcenter.veeam.com/docs/backup/vsphere/active_full_backup.html). The downside is the need to transport the entire amount of backup data on a weekly or monthly basis. Therefore plan carefully as this can lead to a longer backup or copy window and issues like longer opened VM snapshots with longer VM snapshot commits when running primary backups.
    
    _Applies to using as primary and secondary backup repository._
    

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#use-as-virtual-tape-library-vtl)Use as Virtual Tape Library (VTL)

Using a deduplication appliance as VTL is not recommended given the considerations and limitations stated earlier:

-   reduced deduplication benefits when storing encrypted backups
-   limited restore options
-   reduced performance

Only use if there is a good reason such as the appliance already comes with a WORM VTL license.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#use-as-metadata-extents-for-nas-backups)Use as metadata extents for NAS backups

For better performance for NAS backups, a fast (SSD) repository should be used for the metadata.  
Please refer to the [NAS Backup Repository > Metadata extents](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#metadata-extents) section for more details.

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html#references)References

-   Architectural guidelines for deduplication systems: [KB2660](https://www.veeam.com/kb2660)
-   Deduplication Appliance Best Practices: [KB1745](https://www.veeam.com/kb1745)
-   Veeam Alliance Partner integrations and qualifications: [Backup Target - Deduplication](https://www.veeam.com/alliance-partner-integrations-qualifications.html?type=deduplication-target)
-   [NAS Backup Repository Best Practices](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#nas-backup-repository)
-   [Integrated Deduplicating storage appliances](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository.html)
-   [Scale-Out Repository with Extents in Metadata and Data Roles](https://helpcenter.veeam.com/docs/backup/vsphere/sobr_extent_roles.html)
-   [Tape](https://helpcenter.veeam.com/docs/backup/vsphere/system_requirements.html#tape)

___
