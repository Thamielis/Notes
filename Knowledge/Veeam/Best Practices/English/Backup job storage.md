---
created: 2024-08-01T11:38:58 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html
author: 
---

# Backup job storage | Veeam Backup & Replication Best Practice Guide

> ## Excerpt
> Best practice from the field for Veeam Backup & Replication

---
## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#backup-job--storage-advanced-settings)Backup job — Storage advanced settings

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#source-storage-best-practices-overview)Source storage best practices overview

-   Defaults are good, don’t change values without understanding the impact.
-   Use compression levels above **optimal** only if you have plenty of CPU and understand that maximum throughput, especially during full backups, will likely be significantly lower, especially if the backup proxy CPUs can’t take more load.
-   Remember that higher compression ratios may also negatively impact restore speeds.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#storage-maintenance)Storage maintenance

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#full-backup-file-maintenance---defragment-and-compacting)Full backup file maintenance - “Defragment and compacting”

[Full backup file maintenance](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_advanced_maintenance_vm.html) will address two issues: VBK file fragmentation caused by transforms (forward incremental forever or reverse incremental) and left over whitespace from deleted data blocks. These issues are mitigated by synthesizing a new full backup file on the backup repository, i.e. copying blocks from the existing VBK file into a new VBK file, and subsequently deleting the original file. This process may also be referred to as “compacting”.

**Note:** Please be aware that this option will temporary require additional disk space in backup repository in order to create the new defragmented full backup. Once defragmentation process is complete, the “old” backup file will be removed, freeing up the “extra” space consumed during this task.

**When to use?** Enable storage maintenance on jobs where Forever Forward increments are in use to avoid full backup file fragmentation. Defragmentation will benefit most jobs that are configured to generate a single chain per job, keeping files smaller and restore optimal speed over time.

**When to avoid?** When using deduplication storage, it is recommended to disable the “Defragment and compact” option. As deduplication appliances are fragmented by their very nature and also have very poor support for random I/O workloads, the compacting feature will not enhance backup or restore performance.

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#storage-level-corruption-guard)Storage-level corruption guard

In addition to using SureBackup for restore validation, storage-level corruption guard was introduced to provide a greater level of confidence in integrity of the backups.

**When to use?** It is recommended to use storage-level corruption guard for any backup job with no active full backups scheduled. Synthetic full backups are still “incremental forever” and may suffer from corruption over time.

**When to avoid?** It is highly discouraged to use storage-level corruption guard on any storage that performs native “scrubbing” to detect silent data corruptions. Such storage will automatically heal silent data corruptions from parity disks or using erasure coding. This is the case for most deduplication appliances.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#storage-optimization)Storage optimization

Veeam Backup & Replication takes advantage of multiple techniques for optimizing the size of stored backups, primarily compression and deduplication.

The main goal of these techniques is to strike the correct balance between the amount of data read and transferred during backup as well as what is stored on the backup target while providing acceptable backup and restore performance. Veeam Backup & Replication attempts to use reasonable defaults based on various factors but there can be cases when leveraging settings other than default might be valuable.

As a rule, **the default settings provided by Veeam are designed to provide a good balance** between backup size and backup and restore performance and resource usage during the backup process. However, given an abundance of processing resources or other specifics of the environment, it might be useful to change the defaults for a particular job.

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#compression)Compression

Veeam compression should almost always be enabled. However, when using a deduplicating appliance as a repository for storing Veeam backups, it might be desirable to disable Veeam compression at the repository level by using the **Decompress backup data blocks before storing** advanced option in repository configuration.

Enabling compression at the job level, and decompressing once sent to the repository will reduce the traffic between proxy server and backup repository by approximately 50% on average. If proxy and repository run on the same server, the compression engine is automatically bypassed to prevent spending CPU for applying compression. The uncompressed traffic is sent between local data movers using shared memory instead.

**When do I change the defaults?**

As stated above, the default settings provided by Veeam are designed to provide a good balance. However, changing the compression level might be considered when CPU resources are plentiful and backups are unable to make full use of the CPU due to other bottlenecks (disk/network). In such a case it might be worth increasing the compression level.

Compression settings can be changed on the job at any time and any new backup sessions will write new blocks with the new compression mode. Old blocks already stored in backups will remain in their existing compression level.

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#bitlooker)Bitlooker

The option “Exclude deleted file blocks” is the third configurable option in job settings. In several places you will see references to this feature under the name “[BitLooker](https://helpcenter.veeam.com/docs/backup/vsphere/dirty_blocks.html)”.

When enabled, the proxy server will perform inline analysis of the Master File Table (MFT) of NTFS file systems and automatically skip blocks that have been marked as deleted.

It is always recommended to leave [BitLooker](https://helpcenter.veeam.com/docs/backup/vsphere/dirty_blocks.html) enabled, as it will reduce the amount of backup storage space required.

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#storage-optimizations)Storage optimizations

-   Unless you have a good understanding of the impact that can cause block size changing, stick to the defaults.
-   If you want to change the default block size, be sure to test it well and make sure you have planned appropriately for the extra I/O and memory requirements on the repository.
-   When using a block size smaller than the default one for a large server, it is recommended to use a backup mode that does not perform synthetic processing (like forward incremental with scheduled active full).

| Setting | Block Size | Maximum recommended job size |
| --- | --- | --- |
| WAN Target | 256 KB | 4 TB of source data |
| LAN Target | 512 KB | 8 TB of source data |
| Local Target | 1,024 KB | 16 TB of source data |
| Local (>16 TB) | 4,096 KB | 64 TB of source data |

**Note:** Block size changes will only become effective after an active full is created.

**Note** When backing up large (>1 TB) compressed or deduplicated source VMs that contain already compressed data (images, video, Windows deduplicated file servers, etc), it may be beneficial to simply disable Veeam deduplication since it is unlikely to gain additional space savings for this type of source data. Note that Veeam deduplication is a job-level setting, so VMs of the same type should be grouped and processed within the same job.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html#references)References

-   [BitLooker](https://helpcenter.veeam.com/docs/backup/vsphere/dirty_blocks.html)
-   [Storage Compatibility](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_advanced_storage_vm.html)
-   [Health Check for Backup Files](https://helpcenter.veeam.com/docs/backup/vsphere/backup_health_check.html)
-   [Backup Copy Job with GFS and Active Full](https://helpcenter.veeam.com/archive/backup/100/vsphere/active_full_archive_retention.html)
-   [Maintenance Settings](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_advanced_maintenance_vm.html)

___
