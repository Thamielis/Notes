---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/exagrid.html
author: 
---

# Exagrid | Veeam Backup & Replication Best Practice Guide

---
ExaGrid appliances run an integrated Veeam data mover similar to a Linux based backup repository. With ExaGrid, there is no requirement for an extra gateway server.

> Note: Windows based mount server is still required for [some operations](https://helpcenter.veeam.com/docs/backup/vsphere/mount_server.html?ver=120).

The “landing zone” (which is the zone that will hold most recent set of data) must have sufficient capacity to keep at least one uncompressed full backup and one incremental backup. This ensures Backup copy, SureBackup, Instant VM Recovery and item-level restores will be usable for the latest restore point without rehydration overhead.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/exagrid.html#exagrid-and-scale-out-backup-repository)Exagrid and Scale-Out Backup Repository

The best practice is to configure Exagrid appliances as part of a grid and use individual ExaGrid Shares as part of SOBR.

When using Veeam’s Scale Out Backup Repository (SOBR) - only one Veeam Share with ExaGrid-Veeam Accelerated Data Mover should be enabled on each ExaGrid appliance in an ExaGrid Site. The Veeam SOBR will load balance backups automatically across all ExaGrid appliances in the ExaGrid Site.

In case of large Veeam environment ExaGrid share limit can be reached quickly. In such cases it’s recommended to use one share per ExaGrid and so each VBR targeting to separate folder in that share.

The deduplication engine will run asynchronously and deduplicate the landing zone into a global retention zone for each grid member. Whenever a deduplicated block is already hosted on a member of the grid, it will not be treated by the local grid member.

As a consequence, each member of the grid will be considered as a unique extent holding its own data by the Veeam Scale-Out Backup Repository engine, while the deduplicated data effectively used by the extent could reside on a different member of the grid.

![Exagrid Scale-Out Backup Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/media/Deduplication_exagrid.png)

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/exagrid.html#fast-clone-technology)Fast Clone Technology

With the introduction of ExaGrid Version 6.2 and Veeam Version 12, when a Veeam synthetic backup is written to an ExaGrid Share that is configured as a Veeam repository with Fast Clone enabled, ExaGrid will re-synthesize the synthetic backup into a real full.

This ensures that the latest backup is always on the Landing Zone and available for most common restore operations.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/exagrid.html#encryption-and-security)Encryption and security

It’s recommended to disable data encryption on Veeam side, as it has a negative effect on the deduplication ratio.

In case data encryption is required, the best practice is to use ExaGrid systems with Self-Encrypting Drive. However, the decision have to be done in advance, as upgrade from un-encrypted ExaGrid system to encrypted is possible only through replacement of the hardware itself.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/exagrid.html#maintenance)Maintenance

In case of extent maintenance the landing zone will be brought offline by the Scale-Out Backup Repository manager. All the backup chains kept in the landing zone will be unavailable while the deduplicated part of the data held by an appliance where the offline extent resides will still be available to the other members of the grid. All chains but the ones hosted on the offline member will be available for Veeam operations.

If an evacuate operation is triggered on the Veeam Backup & Replication side to remove an appliance from the grid, only the landing zone will be evacuated by the Veeam transport agent. The deduplicated data should thereafter be evacuated through a specific process handled by the Exagrid support.

If the grid member becomes offline before being evacuated by Exagrid support, some unique deduplicated blocks might be lost potentially corrupting all the backup chains of the grid.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/exagrid.html#references)References

-   [Alliance Partner Integrations & Qualifications - Exagrid Deduplication Target](https://www.veeam.com/alliance-partner-integrations-qualifications.html?type=deduplication-target&alliancePartner=exagrid)
-   [Knowledge Base - Deduplication Appliance Best Practices](https://www.veeam.com/kb1745)
-   [Helpcenter - Exagrid](https://helpcenter.veeam.com/docs/backup/vsphere/deduplicating_appliance_exgrid.html)
-   [ExaGrid Website Best Practices](https://www.exagrid.com/exagrid-products/product-architecture/veeam-kbxxxxx/)

___
