---
created: 2024-08-01T11:36:22 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/tape.html
author: 
---

# Tape Operations | Veeam Backup & Replication Best Practice Guide

> ## Excerpt
> Best practice from the field for Veeam Backup & Replication

---
## [](https://bp.veeam.com/vbr/4_Operations/tape.html#tape-jobs-and-backup-job-modes)Tape jobs and backup job modes

Backup jobs can create different types of backup file chains on disk depending on the backup mode used. Depending on this, “Backup to Tape” jobs either copies restore points to tape or synthesize a full backup. The following rules apply:

**When archiving reverse incremental backups**, the behaviour varies on the type of media pool used:

-   Standard media pool: The tape job will always copy the full backup and ignore any rollback files (VRB)
-   GFS media pool: The tape job will create a full backup from VRB files on specified day(s) as per schedule.

**When archiving forward incremental backups, with active or synthetic full scheduled**, the backup chain on tape will be a copy of the backup chain on disk. The virtual full option in tape job configuration is ignored.

**If you archive forward incremental backups without synthetic or active full enabled, or archive Backup Copy Jobs**, the full files are synthesized from existing restore points on disk.

The virtual full backup schedule can be configured on the “Backup to Tape” job. The forever forward incremental chain always keeps on disk one full backup followed by a fixed number of increments. The full backup is constantly rebuilt: as new increments appear, the older ones are injected into the full one. The periodic fulls split the forever incremental backup chain into shorter series of files that can be effectively stored to tapes. Each series contains one synthesized full backup and a set of increments. Such series are convenient for restore: you will need to load to the tape device only those tapes that are part of one series.

The virtual full does not require additional repository disk space: it is synthesized directly on tape on the fly, when the tape job runs. To build a full backup, Veeam Backup & Replication uses backup files that are already stored on the backup repository. If the primary job produces a forever incremental backup chain or is a backup copy job, Veeam Backup & Replication will periodically create a virtual full backup. You can configure the full backup with the scheduler.

The virtual full cannot be switched off; however, it is disabled automatically if the primary job periodically creates active full or synthetic full backups. The virtual full does not depend on the job settings for incremental backups. If you enable the virtual full for the job, it will be created in any case, no matter whether you enable or do not enable incremental backups. If the source backup job contains multiple chains, and the checkbox “Process latest full backup chain only” in advanced job settings is unchecked, you will be prompted for a decision when creating a Backup to Tape job. You may choose to either backup only the last chain or all existing restore points.

## [](https://bp.veeam.com/vbr/4_Operations/tape.html#prioritizing-tape-jobs-over-primary-backup-jobs)Prioritizing tape jobs over primary backup jobs

Sometimes, the primary job may start when the tape job is still running. By default, the primary job has priority. In this case, the tape job terminates with error and no data is written to tape. Select the `Prevent this job from being interrupted by primary backup jobs` option if you want to give the tape job a higher priority. If this option is selected, the primary job will wait until the tape job finishes. Note that the primary job may start with a significant delay.

## [](https://bp.veeam.com/vbr/4_Operations/tape.html#tape-encryption)Tape encryption

Veeam uses hardware encryption if it is provided by the tape device and enabled in Veeam Backup & Replication. The tape library should work in the application-managed encryption mode.

If the hardware based encryption is not supported by the tape device, software based AES-256 encryption is used. Please note, software based encryption may cause significant performance degradation, if not natively accelerated by the CPU of the tape server.

Hardware based encryption is typically available for LTO-4 or newer libraries, and while a license is often required, this is usually offered for free by the tape library vendor.

When archiving data, Veeam generates a user key which is stored with data on tape. If you restore data using another Veeam backup server, provide the password or utilize the _Password Loss Protection_ in Enterprise Manager. See the [User Guide](https://helpcenter.veeam.com/docs/backup/em/em_manage_keys.html) for more information.

If the hardware encryption option is used and you archive Veeam backups to tape which are already encrypted on disk, they will be encrypted twice. If you restore such backups with double encryption on the same Veeam backup server they will be decrypted automatically. To decrypt on another Veeam backup server, you will need to enter the two passwords accordingly.

### [](https://bp.veeam.com/vbr/4_Operations/tape.html#encryption-best-practices)Encryption best practices

-   Enable encryption if you plan to store tapes in locations outside of your security domain.
-   Consider the risks/benefits of enabling tape job encryption even if the source data is already encrypted and evaluate appropriately the acceptable level of risk.
-   Use strong passwords for tape job encryption and develop a policy for changing them regularly (you can use Veeam Backup & Replication password age tracking capability).
-   Store passwords in a secure location.
-   Configure Veeam Backup Enterprise Manager and connect backup servers to enable Password Loss Protection.
-   Back up the Veeam Backup Enterprise Manager configuration database and create an image-level backup of the Veeam Backup Enterprise Manager server. If these backups are also encrypted, make sure that passwords are not lost as there will be no Password Loss Protection for these backups.

## [](https://bp.veeam.com/vbr/4_Operations/tape.html#tape-server-failover)Tape server failover

Tape Failover used to continue backup operations running in case one tape server/library goes offline. When one tape server or library goes offline, the other will continue backup to tape jobs to another library. For instance:

-   There are two physical tape servers connected to the same Tape Library.
-   Both tape servers are added into a media pool.
-   When one tape server goes offline, the other will continue backups processing.

However, if you attempt to use this failover system for restores from tapes attached to a library which is offline, it will not work. You should first put the media (tapes) into the other working library, it will appear under the new library and data can be recovered.  
This is by design, tapes go offline with the library.

### [](https://bp.veeam.com/vbr/4_Operations/tape.html#reconnecting-tape-library-to-another-tape-server)Reconnecting Tape Library to Another Tape Server

You can reconnect your tape library to another tape server. For instance, you need to move Tape Server role from the Veeam Backup server to a dedicated tape server. To achieve this, select a tape server and follow the steps for connecting tape devices outlined in the helpcenter. Upon adding the new tape server to Veeam Backup & Replication, the system will recognise the tape library and retain all tape device settings.

## [](https://bp.veeam.com/vbr/4_Operations/tape.html#parallel-processing-for-tape-jobs)Parallel processing for tape jobs

To process the tape data in parallel, you can split the data across drives in two ways:

-   Parallel processing for tape jobs
-   Parallel processing for source chains of one (or more) tape jobs

### [](https://bp.veeam.com/vbr/4_Operations/tape.html#processing-tape-jobs-simultaneously)Processing tape jobs simultaneously

When you process tape jobs in parallel, the media pool assigns a drive to each running tape job.

The media pool can use the predefined maximum number of drives and process the equal number of tape jobs simultaneously.

For example, if you set three drives as the maximum, you can process up to three tape jobs at the same time. If you have more jobs running at the same time, they are queued. When one of the jobs finishes and releases its drive, the first queued job takes the drive.

This option is available for backup to tape and file to tape jobs. For example:

-   You set the maximum number of drives to three.
-   Four tape jobs start at the same time. The tape jobs start and jobs A, B and C occupy three drives to write data to tape. The Tape job D is queued and waits. When one of the jobs finishes and releases its drive, the Tape job D takes the drive and starts writing data.

### [](https://bp.veeam.com/vbr/4_Operations/tape.html#processing-backup-chains-simultaneously)Processing backup chains simultaneously

When you select processing backup chains in parallel, the media pool processes several backup chains simultaneously. This option is available for backup to tape jobs only. For example:

You set the maximum number of drives to three.

Tape job A has four primary jobs. Tape job A starts, and occupies three drives to process three primary jobs. The fourth primary job is queued and waits. When one of the drives is released, the fourth primary job takes the drive and starts writing data. If another tape job starts, it will be queued and wait until Tape job A finishes.

> **Note:** If the media pool is configured to fail over to another library in case all tape drives are busy, only new tape jobs can use drives of the next library. You cannot split source backup chains within one job across libraries.

### [](https://bp.veeam.com/vbr/4_Operations/tape.html#tape-out-to-multiple-tape-libraries)Tape out to multiple tape libraries

In scenarios where data needs to be stored in two different tape libraries, like having copies at both an on-site and an off-site data center, the current process involves running two distinct jobs to handle data from either the production environment or the repository. This setup can result in higher load of production or backup storage.

To optimize this process and improve the backup operations, there is a Tape Copy in Veeam Backup. Tape copy allows you to duplicate tapes to multiple tape drives. By doing so, you can reduce the number of separate backup jobs required, making the backup process more efficient and less resource-intensive. Consider that tapes should not be locked by backup operations at the moment.

Additionally, Tape Copy can be scheduled and managed using PowerShell cmdlet [Start-VBRTapeCopy](https://helpcenter.veeam.com/docs/backup/powershell/start-vbrtapecopy.html). This means you have the flexibility to automate and control the copying of backups to multiple tape drives at specific times or under certain conditions, further enhancing the overall manageability and reliability of your data backup strategy.

## [](https://bp.veeam.com/vbr/4_Operations/tape.html#tape-restores)Tape restores

### [](https://bp.veeam.com/vbr/4_Operations/tape.html#vm-restore-from-tape-to-infrastructure)VM restore from tape to infrastructure

Restoring a VM from tape with Veeam Backup & Replication is a lot like restoring a VM from disk. For example, you can choose a desired restore point, select the target location or change the configuration of the restored VM. To restore a VM from tape, you can choose between the following options in the restore wizard:

-   Restore directly to infrastructure
-   Restore through a staging repository

#### [](https://bp.veeam.com/vbr/4_Operations/tape.html#restore-directly-to-infrastructure)Restore directly to infrastructure

When you restore VMs from tape directly to the infrastructure, the restore process publishes the VMs to the virtual infrastructure copying the VM data directly from tape. This option is recommended if you want to restore one VM or a small number of VMs from a large backup that contains a lot of VMs. In this case, you do not need to provide a staging repository for a large amount of data most of which is not needed to you at the moment. This option is slow if you restore many VMs. The VMs are restored one by one: this requires a lot of rewinding of tape as tapes do not provide random access to data.

#### [](https://bp.veeam.com/vbr/4_Operations/tape.html#restore-through-staging-repository)Restore through staging repository

When you restore VMs from tape through a staging repository, the restore process temporarily copies the whole restore point to a backup repository or a folder on disk. After that Veeam starts a regular VM restore. This option is recommended if you want to restore a lot of VMs from a backup as the disk provides a much faster access to random data blocks than tape.

#### [](https://bp.veeam.com/vbr/4_Operations/tape.html#backup-restore-from-tape-to-repository)Backup restore from tape to repository

This option allows you to copy VM backups from tape to repository. This is helpful if you need some backups on disk for later use, or also for VM guest OS files restore. You can restore full backups or incremental backups to a repository or any location of your choice. The restored backup is registered in the Veeam Backup & Replication console as an imported disk backup so that you can use it for any restore from disk scenario later on. Per restore session you can choose one restore point available on tape.

### [](https://bp.veeam.com/vbr/4_Operations/tape.html#file-restore-from-tape)File restore from tape

You can restore files and folders that were previously archived with file to tape jobs. Restoring capabilities allow you to restore files to their original location or another server, preserving ownership and access permissions. The file restore process allows you to restore files from any restore point available on tape.

## [](https://bp.veeam.com/vbr/4_Operations/tape.html#general-tips)General tips

-   “Short Erase” all tapes before use with Veeam to avoid any problems cause by data from other backup software.
-   Install latest operating system updates.
-   Install latest firmware on library, drives, HBA (verify interoperability).
-   Installation of separate HBAs for tape is recommended, but not required.
-   A staging area for backup files is required when restoring from tape. Keep this in mind when sizing backup repositories.
-   Use Export to VBK and File to Tape job in case you need a one-time export of restore point.
-   Tape compression should be disabled for tape jobs, when backup files are already compressed at the backup repository.

___

## [](https://bp.veeam.com/vbr/4_Operations/tape.html#references)References

-   [Helpcenter - Tape Device Support](https://helpcenter.veeam.com/docs/backup/vsphere/tape_device_support.html)
-   [Alliance Partner Integrations & Qualifications - Tape Backup Target](https://www.veeam.com/alliance-partner-integrations-qualifications.html?type=tape-backup-target)

___
