---
created: 2024-08-01T11:39:24 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html
author: 
---

# Guest processing | Veeam Backup & Replication Best Practice Guide

> ## Excerpt
> Best practice from the field for Veeam Backup & Replication

---
## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#application-aware-image-processingguest-processing)Application-aware image processing/guest processing

When configuring backup and replication jobs, you can specify how to create the transactionally-consistent backup images of VMs. Two methods are available for bringing VM file system and applications into consistent state: VMware Tools/Hyper-V Integration Services quiescence or Veeam’s proprietary application-aware image processing (using Microsoft VSS or Linux scripts).

Key features of both methods are illustrated by the following table:

| Feature | VMware tools quiescence | Hyper-V quiescence | application-aware image processing |
| --- | --- | --- | --- |
| Support for consistent backup on Windows guest | Yes | Yes | Yes |
| Sync driver for Linux guest | Yes | No | No |
| Support for application-aware backup | Limited | Yes | Yes |
| Pre-VSS preparation for specific applications (e.g. Oracle) | No | No | Yes |
| Support for application log truncation (Microsoft SQL Server and Exchange Server) | No | No | Yes |
| Support for scripts | Yes (placed on VM guest) | Yes (placed on guest) | Yes (can be centrally distributed) |
| Error reporting | Within VM guest OS | Within VM guest OS | Centralized, on Veeam backup server |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#selecting-guest-processing-options)Selecting guest processing options

When on the **guest processing** step of the job wizard, you are presented with the variety of options (as described in detail in the User Guide for [vSphere](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_vss_vm.html) and [Hyper-V](https://helpcenter.veeam.com/docs/backup/hyperv/backup_job_vss_hv.html)).

Note that you can use pre- and post-job scripting to automate job global settings from the Veeam Backup & Replication server itself. It is recommended to use the VM guest processing options for interaction with VMs.

To select the necessary options, refer to the table below.

| VM guest OS type | Linux with applications (without known user for Guest OS processing) | Windows with applications (without known user for Guest OS processing) | Windows with VSS-aware applications | Windows (no VSS-aware applications) | Linux with applications | Windows / Linux (no applications) |
| --- | --- | --- | --- | --- | --- | --- |
| Guest OS processing is applicable | Y | Y | Y | Y | Y | N |
| Use Hypervisor quiescence | Y | Y | N | N | N | N |
| Enable Veeam Application-Aware Image Processing | N | N | Y | N | N | N |
| Enable Veeam Application-Aware Image Processing and InGuest Scripts | N | N | N | Y | Y | N |
| Disable Veeam Application-Aware Image Processing | Y | Y | N | N | N | Y |

For more details on the interaction check out [Support - Guest Interaction](https://bp.veeam.com/vbr/Support/S_Vmware/backup.html).

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#guest-access-credentials)Guest Access Credentials

Depending on the VM guest OS processing options selected (enabled or disabled application-aware image processing) and on the guest access method, you may need to supply access credentials for the guest OS, as described in the tables below.

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#windows-os)Windows OS

| Application-aware image processing (AAIP) | Hypervisor quiescence | Veeam via VIX/PSDirect | Veeam via RPC | Disabled (crash-consistent) |
| --- | --- | --- | --- | --- |
| Membership in the local administrators group | User account not needed | No | Yes | User account not needed |
| Enter username as \_\\ Administrator\_ <sup id="fnref:1"><a href="https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#fn:1">1</a></sup>(Local) or \_\\Administrator\_ | No | Yes<sup id="fnref:2"><a href="https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#fn:2">2</a></sup>(Only) | No | No |
| UAC can be enabled | Yes | Yes<sup id="fnref:3"><a href="https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#fn:3">3</a></sup>(When) | Yes | Yes |
| Guest tools must be installed and up to date | Yes | Yes | Yes | No |

### [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#linux-os)Linux OS

| Linux guest OS processing | Hypervisor quiescence | Veeam via SSH | Disabled (crash-consistent) |
| --- | --- | --- | --- |
| Root user account | No | Yes | No |
| User requires `sudo` rights | No | Yes | No |
| Certificate-based authentication available | No | Yes | No |
| Guest tools must be installed and up to date | Yes | Yes | No |

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#sizing)Sizing

Since guest processing produces very low impact on VM performance, no special considerations on sizing are required. If you use VSS processing with hypervisor quiescence or Veeam in-guest processing, you need free space on each drive of the VM for the software VSS snapshot. Please check Microsoft requirements for more information.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#file-exclusions)File exclusions

Another operation Veeam Backup can do on guest OS level (NTFS only) is excluding certain files or folders from the backup. Alternatively, the job can be configured to include only specified files or folders in the backup. This functionality operates very similarly and shares a lot of characteristics with excluding Windows page file and deleted file blocks. It may help reduce size of the backup files or implement additional data protection strategies for specific data. Backups for which this option was enabled remain image-level and hypervisor APIs are used to retrieve VM data.

File exclusion feature uses a combination of NTFS MFT data and guest file system indexes collected by in-guest coordination process to determine which virtual disk blocks belong to the excluded files and thus should not be included in the backup.

Full file/folder paths, environment variables or file masks can be used to define exclusions. For more details on configuring exclusions and its limitations refer to the corresponding [User Guide section](https://helpcenter.veeam.com/docs/backup/vsphere/guest_file_exclusion.html).

**Note**: Generic file exclusions (defined for high level folders) are most effective. File masks exclusions require guest file system indexes, and generating indexes may put additional stress on guest VM and will increase backup time. For this reason it is recommended to avoid using file system masks, especially on fileservers with large number (thousands) of small files and use high level folder exclusions instead. When using include filters, file exclusions are created for everything else and can take significant time.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html#references)References

-   [User Guide for vSphere - Guest Processing](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_vss_vm.html)
-   [User Guide for Hyper-V - Guest Processing](https://helpcenter.veeam.com/docs/backup/hyperv/backup_job_vss_hv.html)
-   [User Guide - VM Guest OS Files](https://helpcenter.veeam.com/docs/backup/vsphere/guest_file_exclusion.html)

___

___
