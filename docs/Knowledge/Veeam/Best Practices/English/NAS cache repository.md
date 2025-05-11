---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nascache.html
author: 
---

# NAS cache repository | Veeam Backup & Replication Best Practice Guide

---
The cache repository was introduced in Veeam Backup & Replication v10 and holds a cache of folders information in the structure of the protected NAS share. It is used for NAS backup only and it is crucial to accelerate the incremental backup process, allowing to identify any object that has changed since the last backup. It is also the controlling unit of a NAS backup job.

Whenever a NAS backup job runs, it is the cache repository that requests the [File Proxy](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies) to retrieve data from the source share. The file proxy sends back the top level structures hashes, the cache repository loads them into memory and initiates a CRC check on the data stored in the cache (generated with the previous job run). If there is a match to the cache value, no file has to be processed and the file proxy will be instructed to iterate and repeat this process on deeper levels of the share to find folders with a mismatch.

Note that there can be only **one cache repository** per source file share.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nascache.html#best-practice)Best practice

Ideally, the cache repository should sit as close as possible to the [File Proxy](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies) and source data. The bigger the share, the more the traffic between file proxies and cache repository. At the best, they should be **one hop away** from each other.

No disk sizing is required **unless using backup to Object Storage**: usually the size of the cache files does not exceed 4GB and due to the optimized size of the cache, data will be loaded into memory when needed. This also makes fast disks not necessary.

If you have multiple proxy or repository servers, you can distribute the load over all machines.

The cache repository is always a **standard repository**. It cannot be part of a Scale-out Backup Repository, but you can create an extra standard repository on a machine that also hosts Scale-out Backup Repository extents.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nascache.html#nas-backup-and-object-storage-repository)NAS Backup and Object Storage repository

Starting with v12, the NAS Backups can be sent directly to Object Storage. The main difference in compare with backup to other kind of repositories, is that the Active Metadata is kept **in the cache repository**, and a copy of this Metadata is kept in the Object Storage with the backup data. For other kind of repositories, the metadata files are kept in the repository itself ([See NAS Backup Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo#metadata-extents)).

Because of this, it’s recommended to provision enough disk space for metadata in Cache repository. The recommendation is to provision **at least 5% of space of source data**, and using SSD disks to provide a proper performance.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nascache.html#sizing-guidelines)Sizing Guidelines

| Sizing | Formula |
| --- | --- |
| Cores | The cache repository needs 2/3rd of the File Proxy calculated cores, or simply “File Proxy CPU # cores” / 1.5 |
| Memory | The cache repository requires 4GB of RAM per cache repository core. |
| Disk (when backup to Object Storage is used) | Source Data x 5% |

Let’s review the same examples discussed for [File Proxy sizing](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies#proxy-sizing)

**Example 1**: 3PB source data, 10M files, 40 NFS shares, 2% change rate, 8 hours backup window.

| Sizing | Formula | Size |
| --- | --- | --- |
| Required File Proxy resources | 24 cores and 48GB of RAM |   |
| Cache repository required core count | 24 / 1.5 | 16 Cores |
| Cache repository required RAM | 16 x 4 | 64 GB |
| Cache repository required disk (if using backup to Object Storage) | 3PB x 5% | 153,6TB |

**Example 2**: 50TB source data, 300M files, 2 SMB shares, 3% change rate, 8 hours backup window.

| Sizing | Formula | Size |
| --- | --- | --- |
| Required File Proxy resources | 8 cores and 16GB of RAM |   |
| Cache repository required core count | 8 / 1.5 | 6 Cores |
| Cache repository required RAM | 6 x 4 | 24 GB |
| Cache repository required disk (if using backup to Object Storage) | 50TB x 5% | 2.5TB |

___

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nascache.html#references)References

-   [Cache Repository](https://helpcenter.veeam.com/docs/backup/vsphere/file_share_support.html#cache_repository)
-   [NAS Backup](https://helpcenter.veeam.com/docs/backup/vsphere/file_share_support.html)
-   [Scale-Out Repository as NAS Backup Repository](https://helpcenter.veeam.com/docs/backup/vsphere/sobr_in_nas_backup.html)
-   [Object Storage as NAS Backup Repository](https://helpcenter.veeam.com/docs/backup/vsphere/object_storage_in_nas.html)

___
