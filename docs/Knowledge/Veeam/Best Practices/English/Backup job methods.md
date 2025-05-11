---
created: 2024-08-01T11:38:34 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html
author: 
---

# Backup job methods | Veeam Backup & Replication Best Practice Guide

> ## Excerpt
> Best practice from the field for Veeam Backup & Replication

---
## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#forward-incremental-usage)Forward incremental usage

The forward incremental backup method is the simplest and easiest to understand. It generally works well with all storage devices although it requires more storage space than other backup methods due to the fact that it requires the creation of periodic full backups (either using active or synthetic backups), typically scheduled weekly. This is necessary because the incremental backups are dependent on the initial full backup. Older full backups cannot be removed from the retention chain until a newer backup chain is created. When a new full backup is created, a new chain is started, and the old backups can be removed once the new chain meets the retention requirements.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#active-full-usage)Active full usage

Forward incremental backup provides good performance with almost any storage and the highest level of backup chain consistency since each new chain is populated by re-reading VM source data. Incremental backups are still processed using Changed Block Tracking (CBT). Active full can be used when plenty of repository space is available, the backup window allows enough time and network bandwidth is sufficient to support reading the source data in full.

| Use | Don’t Use |
| --- | --- |
| Recommended for deduplication appliances that use SMB or NFS protocols. | When backup window does not allow enough time for re-reading all of the source VM data. |
| On storage systems that use software or non-caching RAID hardware such as many low-end NAS devices. | For large or performance sensitive VMs where re-reading the data can have a negative impact on the VMs performance. |
|   | When using ReFS or XFS formatting for block-cloning space reduction |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#synthetic-full-usage)Synthetic full usage

| Use | Don’t use |
| --- | --- |
| When repository storage uses fast disks with caching RAID controllers and large stripes. | Small NAS boxes with limited spindles that depend on software RAID. |
| Deduplication appliances that support offloading synthetic operations (e.g. DataDomain, StoreOnce, ExaGrid) | Deduplication appliances that use SMB or NFS protocols. |
| When using ReFS or XFS formatted disks for block-cloning space reduction |   |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#forever-incremental-usage)Forever incremental usage

The primary advantage of using forever forward incremental backup method is space savings. However, the tradeoff is the required resources for the merge process.

The merge process may take a considerable amount of time, depending on the amount of incremental changes that the job has to process. The advantage is that the merge process impacts only the target storage.

Forever Incremental does not close the backup chain regularly which in turn means that no part of the chain becomes inactive so it cannot be tiered to cloud (Capacity Tier) if you are planning to use the [“Move”](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier_move.html) option. If you want to use Capacity Tier with Forever Forward Incremental, you have to use the [“Copy”](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier_copy.html) option.

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#merge-process-usage)Merge process usage

| Use | Don’t use |
| --- | --- |
| Repositories with good performance | Smaller backup repositories or NAS devices with limited spindles and cache |
| Ideal for VMs with low change rate | Jobs with significant change rate may take a long time to merge |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#reverse-incremental-usage)Reverse incremental usage

| Use | Don’t use |
| --- | --- |
| When repository storage uses fast disk with caching RAID controllers | NAS devices |
| VMs with low change rate | Deduplication appliances due to random I/O pattern |
|   | High change rate VMs, as VM snapshot may be open for a long time |

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#backup-job-io-processes)Backup Job I/O processes

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#overview)Overview

Veeam Backup & Replication stores backups on disk using a simple, self-contained file based approach. However, there are several methods to create and store those files on the file system. This section will provide an overview of these methods, their pros and cons, as well as recommendations on use cases for each one.

Backup mode directly influences disk I/O on both production storage and backup repository, and backups size; for these reasons it is recommended to carefully review capabilities of the destination storage when selecting one.

As a generic overview for I/O impact of the backup modes, please see this table:

| Method | I/O impact on destination storage | Benefit from Fast Clone (ReFS/XFS) |
| --- | --- | --- |
| Forward incremental | 1 x write I/O | No |
| Active full | 1 x write I/O | No |
| Forever Forward incremental | 3 x I/O (1x read, 2x write) | Yes |
| Synthetic full | 2 x I/O (1x read, 1x write) | Yes |
| Reversed incremental | 3 x I/O (1x read, 2x write) | Yes |

**IMPORTANT:** While changing backup mode is one way of reducing amount of I/O on backup repository, it is also possible to leverage features of the filesystem to avoid extra I/O. Currently Veeam Backup and Replication supports [Fast Clone](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository_block_cloning.html) to leverage advanced features from ++Microsoft ReFS 3.1++ (available in Windows Server 2016 and newer) and **Linux XFS**, to completely eliminate unnecessary read/write operations in certain configurations. For more details refer to the corresponding section of this guide.

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#merge-io-process-forever-forward-incremental)Merge I/O process (Forever forward incremental)

The merging process is performed at the end of the backup job once the retention for the job has been reached. This process will read the blocks from the oldest incremental backup (VIB file) and write those blocks into the VBK file; the I/O pattern is a 33%-66% read-write mix on the target storage. The time required to perform the merge depends on the size of the incremental data and the random I/O performance of the underlying storage.

#### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#active-full-io-process)Active full I/O process

When creating an active full, the I/O pattern on the backup storage is mainly sequential writes, which generally provides good performance for most storage solutions. However, all the data (not just the changes) has to be copied from the production storage, which will increase the duration of the backup activity, and will increase the amount of read I/O operations on production storage, which could also increase disk latency on production storage.

In addition, during an active full backup, the time a VM snapshot remains open will be longer, which also could cause some performance and/or capacity issues on Datastores. The snapshot lifetime can be reduced by leveraging Backup from Storage Snapshots.

#### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#synthetic-full-io-process)Synthetic full I/O process

Synthetic full I/O patterns need to be split into two different operations: first is the creation of the additional incremental which is exactly like any other incremental job. The second is the synthetic creation of the full backup which is an I/O intensive process. Since the process reads individual blocks from the various files in the backup chain and writes those blocks to the full backup file, the I/O pattern is roughly 50%-50% read/write mix.

The processing speed is limited by the IOPS and latency capabilities of the repository storage, so it may take a significant amount of time. However, **there is no impact** on the source storage or production networks during this time as I/O occurs only inside the repository.

**NOTE**: if an SMB share type of repository is used, the Veeam repository role is executed in the Gateway Server there is going to be network traffic between the gateway server, and the SMB share.

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#reverse-incremental-io-process)Reverse incremental I/O process

During the backup process new blocks are read from the source VM and are written directly to the VBK file. If this block replaces an existing older block, this old block is read from the VBK and then written to the VRB file, and replaced by the new one into the VBK file itself.

This means that reverse incremental backups creates a 33%-66% read-write IO pattern on the target storage during the backup process. This I/O typically becomes the limiting factor for backup performance of the job. As the rollback is created during the backup process itself, backup throughput can be limited by target storage. This slower performance can lead to VM snapshots staying open for a longer time.

This can be especially noticeable for VMs with a high change rate, or when running multiple concurrent jobs.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html#references)References

-   [Backup Methods](https://helpcenter.veeam.com/docs/backup/vsphere/backup_methods.html)
-   [GFS Flags](https://helpcenter.veeam.com/docs/backup/vsphere/gfs_retention_policy.html)
-   [Gateway Server](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html)
-   [Deduplication Appliances](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_backup_repositories/deduplication.html) (provides important details on using dedicated deduplicating hardware appliances for storing backups)
-   [Impact of Snapshot Operations](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#impact-of-snapshot-operations)
-   \[Per Machine Backup Files\]
-   [Backup from Storage Snapshots](https://bp.veeam.com/vbr/Support/S_Vmware/storage_integration.html)
-   [Moving Backups to Capacity Tier](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier_move.html)
-   [Copying Backups to Capacity Tier](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier_copy.html)
-   [Fast Clone](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository_block_cloning.html)

___
