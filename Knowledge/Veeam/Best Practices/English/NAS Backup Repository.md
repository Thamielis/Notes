---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html
author: 
---

# NAS Backup Repository | Veeam Backup & Replication Best Practice Guide

---
NAS Backup Repositories need to be sized differently than standard repositories due to the fact that the backup file format and the data structure is different. Additionaly there are two levels of primary retention (short term and short term copy) and an archival retention.

-   **Primary Repository**: Contains a copy of source File Share plus the recent file versions (according to retention set in the policy)
-   **Secondary Repository**: Provides a secondary copy of the Primary Repository. It is possible to set a different retention (by default it uses the same retention as the Primary Repository).
-   **Archive Repository**: Provides long-term archive of files version outside the operational restore window (with default move option). Starting with V12, a new Copy option is also available which provides the following:
    -   Copy Mode copies all the restore points also to the Archive Repository.
    -   Automatic failover to archive repository during restore, in case of primary repository is not available.

Regarding the archival retention, by default, only older file versions or deleted data are eligible to be moved to the Archive Repository as they age out and, as you can image, this constraint introduces a few challenges when sizing a NAS Backup Repository.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#file-format)File format

NAS Backup does not use VBK/VIB file format for storing data into the Backup Repository. A new file format has been developed specifically for this purpose and to properly treat the multitude of files to be protected. Its structure can be compared to an object storage, where data is divided into chunks and arranged into groups of files. The extension of those files is `.vblob` and their size is limited to 64MB.

**NOTE**: The backup mode is always incremental forever. GFS backup scheme for weekly, monthly or yearly backups is not available when using NAS backup, which of course has an impact when sizing the backup repositories.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#sizing-short-term-repositories-primary)Sizing short term repositories (primary)

The short term backup repository will always hold a copy of **all** source file, pulled from the network share.

NAS devices and file servers usually have a daily change rate between 1% and 3%. Please note that the percentage itself can vary a lot depending on the total capacity of the NAS: smaller units can have higher change rate with the change of only a minor subset of data, while larger devices may have a very small percentage with a huge amount of data is changed daily.

The achievable compression on NAS data depends on many factors. The data type is the most important, affecting how much compression is effective (e.g., plain text or office data are very easy to compress, binary files are more difficult); some kinds of data (like PDFs) are compressed by default, as are most media files and, along with files protected by encryption, will give very bad to zero compression ratios. In average, total compression varies between 0% and 30% of the source size.

| File Type | Expected Reduction |
| --- | --- |
| Media Files | 0% |
| File Mix | 10% |
| Office Documents | 20% |
| Highly Compressible Files | 30% |

**NOTE:**For mixed file type/office files a 15 to 20% data reduction has been observed.

Given the information above, to size the short term repository you can refer to the following formula.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#disk-based-repository-sizing)Disk-based Repository Sizing

| Sizing | Formula |
| --- | --- |
| Full Backup | Source size - data reduction (%) |
| Incremental Backups | (FUll Backup \* change rate) \* retention (days) |
| Backup size | Full Backup + Incremental Backup |
| Metadata | Backup Size \* 10% |
| Workspace | Backup Size \* 10% |
| Repository Capacity | Backup Size + Metadata + Workspace |

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#object-storage-repository-sizing)Object Storage Repository Sizing

| Sizing | Formula |
| --- | --- |
| Full Backup | Source size - data reduction (%) |
| Incremental Backups | (FUll Backup \* change rate) \* retention (days) |
| Backup size | Full Backup + Incremental Backup |
| Metadata | Backup Size \* 5% |
| Repository Capacity | Backup Size + Metadata + Workspace |

**NOTE**: Workspace space is only required for backup on disk and it’s not required for backup to Object Storage. In the same way, for NAS Backup to Object Storage, the Metadata will be kept in the Cache Repository AND in the Object Storage itself.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#sizing-examples)Sizing Examples:

**Example 1**: 3PB source data, 2% change rate, data reduction of 20%, 1 year of retention, disk-based repository.

| Sizing | Formula | Size |
| --- | --- | --- |
| Full Backup | 3PB - 20% | 2458TB |
| Incremental Backups | 2458TB \* 2% \* 365 | 17944TB |
| Backup size | 2458 + 17944 | 20402TB |
| Metadata | 20402 \* 5% | 1020 TB |
| Workspace | 20402 \* 5% | 1020 TB |
| Repository Capacity | 20402 + 1020 + 1020 | 22442 TB |

**Example 2**: 50TB source data, 5% change rate, data reduction of 30%, 60 days of retention, object storage repository.

| Sizing | Formula | Size |
| --- | --- | --- |
| Full Backup | 50TB - 30% | 35TB |
| Incremental Backups | 30 \* 5% \* 60 | 105TB |
| Backup size | 35 + 105 | 140TB |
| Metadata | 140 \* 5% | 7 TB |
| Repository Capacity | 140 + 7 | 147 TB |

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#sizing-short-term-repositories-secondary-copy)Sizing short term repositories (secondary copy)

By default, the secondary copy for NAS Backup is a complete mirror of the primary repository as **they use the same retention policy**, so no additional sizing is required, and you can use the same sizing for the primary and secondary short-term repositories.

However, starting with v12, the secondary copy could use a **different retention policy**, so you need to size the secondary short-term repository accordingly. You can use the same formula described above for the primary short-term repository, but changing the retention for the desired one.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#sizing-api-calls-backup-to-object-storage)Sizing API Calls (Backup to Object Storage)

When sending NAS backups to an Object Storage provided by a Public Cloud Provider, you should also consider the number of API calls when running the backup job, as they usually will mean additional cost.

To get an **estimation** of the number of API calls, you can use the folloing formula:

-   Number of PUTs(data) = Full (or Inc) / 64MB
-   Number of PUTs(metadata) = 10% of PUTs(data)

So, for example, if we have a full backup of 30TB, then:

-   **Number of PUTs(data)**: 30TB / 64MB = 468750 PUTs for data
-   **Number of PUTs(metadata)**: 10% x 468750 = 46875 PUTs for metadata

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#sizing-compute-resources)Sizing Compute resources

The short term backup repositories should have half the proxy cores and 4GB of memory per-core.

For example:

-   File Proxy requires 12 CPU cores
-   Backup repository CPU cores: 12 / 2 = 6
-   Backup repository Memory: 6 \* 4 = 24GB

**NOTE**: When sending the NAS backups directly to Object Storage, there is no need to configure Metadata Extents, as this metadata will be kept in the Cache Repository. Please check the [NAS Cache Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nascache) section for more details.

For better performance for NAS backups, a fast (SSD) repository should be used for the metadata. That requires a Scale-Out-Repository (SOBR) where metadata is stored on the meta extent. An additional copy of the metadata is stored on data extent(s) for metadata redundancy.

To configure the placement of the NAS backup metadata and data you have to use PowerShell:

```
Set-VBRRepositoryExtent –Extent "NAME_Of_SSD_EXTENT" –Metadata
Set-VBRRepositoryExtent –Extent "NAME_Of_DEDUPLICATION_EXTENT" –Data
```

If you have multiple extents in your Scale-Out Backup Repository, make sure they are all configured correctly. To check the settings for all the Scale-Out Backup Repository Extents you can do this with PowerShell as well:

```
Get-VBRRepositoryExtent -Repository “NAME_OF_SOBR”
```

___

For supported deduplication appliances, Veeam NAS backup blob size can be up to 1GB. GigaBlobs were introduced in v11 to alleviate some concerns around the maximum number of files these appliances support and to improve deduplication efficiency.

Storing Metadata on deduplicated repository is less than optimal as the Metadata is constantly accessed and updated during backup which causes unnecessary slowdowns due to the constant on-the-fly rehydration of said files.

In this scenario, it is recommended to combine a SSD disk-based repository (non-dedupe) with a deduplication appliance repository in a SOBR. The disk-based repository must be set as the Metadata extent and the dedupe-based repository as the Data extent. The goal is offer undeduped access to the Metadata therefore vastly improving backup performance.

Note that Metabackup (the metadata copy) will be stored on the Data extent in the dedupe appliance repository.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html#resources)Resources

-   [NAS Backup](https://helpcenter.veeam.com/docs/backup/vsphere/file_share_support.html)
-   [NAS Backup Repositories support](https://helpcenter.veeam.com/docs/backup/vsphere/file_share_support.html#backup_repository)
-   [Scale-Out Repository with Extents in Metadata and Data Roles](https://helpcenter.veeam.com/docs/backup/vsphere/sobr_extent_roles.html)

___
