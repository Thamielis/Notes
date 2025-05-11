---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/block.html
author: 
---

# Block Storage (DAS/SAN) | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/block.html#direct-attached-storage-das)Direct-Attached Storage (DAS)

This is a fast, easy and cost-effective way to use storage. It can be used as single system or grouped together in a Scale-out Backup Repository. DAS is a normal industry standard x64 server with a bunch of disks attached to it.

-   It is recommended to use a performant RAID controller with battery cache. Be aware the RAID overhead when designing a DAS solution. Typically RAID 6/60 (depends on the amount of disks) is the best solution from a price/performance /reliability perspective.
-   Since a DAS storage can be fully dedicated to backup operations, this type of repository is considered to offer a good balance between “performance” and “cost” factors.
-   For scalability you can scale vertical (more disks in an enclosure or additional) and horizontal (more servers, e.g. if the network throughput is reached -the SAS channels are saturated- more IOPS are needed for restore reasons)

**Note:** When using Windows based REFS repositories: only use certified RAID controllers from the Windows Server Catalog

| Pros | Cons |
| --- | --- |
| cost efficiency | RAID Controller is a single point of failure |
| High performance |   |
| Simplicity |   |

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/block.html#storage-area-network-san-storage)Storage Area Network (SAN) Storage

SAN storage has same advantages as DAS plus more features like high-availability of storage controllers or volume sizes that can be increased online.

**Tip**: You can configure multiple backup repositories on one SAN storage system to increase throughput.

| Pros | Cons |
| --- | --- |
| Reliability | Complexity |
| Performance | Costs |
| Technical capabilities |   |

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/block.html#references)References

-   [Build Section - Block Storage](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_backup_repositories/block.html)
-   [Veeam Help Center - Backup Repository Section](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository.html)
-   [Alliance Partner Integrations & Qualifications - Disk Backup Target](https://www.veeam.com/alliance-partner-integrations-qualifications.html?type=disk-backup-target)

___
