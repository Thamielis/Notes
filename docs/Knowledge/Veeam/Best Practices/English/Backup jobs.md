---
created: 2024-08-01T11:37:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/
author: 
---

# Backup jobs | Veeam Backup & Replication Best Practice Guide

> ## Excerpt
> Best practice from the field for Veeam Backup & Replication

---
A job is the trigger for the backup and replication process: It defines where, when and how to protect VM data.

Configuring a job may look easy and straight forward, but there are some consideration to keep in mind, such as: Exclusions, chaining and what method is best for a given backup repository.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/#how-many-vms-per-job)How many VMs per job?

Avoid using one VM per job unless is strictly necessary. By using multiple VM per job we will reduce management complexity, as it’s much easier to manage a small amount of jobs than trying to manage hundreds of jobs. On the other hand having too many VMs in a job can increase complexity of certain operational activities. Sticking to up to 300 VMs per job provides a good balance for manageability of backups.

Consider that some tasks within a job are still sequential processes. For example, a merge process (writing the oldest incremental file into the full backup file) is started after the last VM finishes backup processing. If you split the VMs into multiple jobs, these background processes will run in parallel and thus reduce the overall backup window.

Be careful with large jobs when using Storage Snapshots at [Backup from Storage Snapshots](https://bp.veeam.com/vbr/Support/S_Vmware/storage_integration.html). Guest processing and scheduling of jobs that contain multiple snapshots can lead into difficult scheduling situations and jobs spending time waiting for resource availability. A good size for jobs is 50-200 VMs per job.

Also, remember that the number of concurrently running backup jobs should not exceed 100. Veeam can handle more, but a “sweet spot” for database load, load balancing and overall processing is about 80-100 concurrently running jobs.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/#references)References

___

## Table of contents

-   [Backup job general](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html)
-   [Backup job methods](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_methods.html)
-   [Backup job storage](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_storage.html)
-   [Guest processing](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/guest_processing.html)
-   [Backup job automation](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_automation.html)

___
