---
created: 2024-08-01T11:37:43 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html
author: 
---

# Backup job general | Veeam Backup & Replication Best Practice Guide

> ## Excerpt
> Best practice from the field for Veeam Backup & Replication

---
## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#exclusions)Exclusions

While [exclusions](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_excludes_vm.html) can be very useful, the virtual infrastructure is dynamic and changes rapidly. It is quite possible that a VM gets moved to a folder or resource pool that is excluded which makes it unprotected.

[Monitoring with Veeam ONE](https://helpcenter.veeam.com/docs/one/reporter/protected_vms.html) is highly recommended in tracking VMs that are under protection. Also, remember that exclusions have higher priority over inclusions in Veeam Backup & Replication.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#storage-latency-control)Storage Latency Control

Too many jobs accessing the same disk will load the storage significantly; this makes the job run slower or may have a negative impact on the VM’s performance (high latency). To mitigate this problem, we recommend to enable [Storage Latency Control](https://helpcenter.veeam.com/docs/backup/vsphere/io_settings.html) (also known as Backup I/O Control) settings.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#job-chaining)Job chaining

[Chaining backup jobs](https://helpcenter.veeam.com/docs/backup/vsphere/job_schedule.html#chain) should be avoided in general. For example, if a job as part of a chain fails or stops responding, the entire job chain delivers poor backup success rate. The alternative of job chaining is to start the jobs right after each other. For example:

-   Job 1 starts at 10:00 PM
-   Job 2 starts at 10:01 PM
-   Job 3 starts at 10:02 PM

Veeam’s Intelligent Load Balancing can handle proxy/repository resources by starting multiple jobs in parallel and consequently using all available proxy/repository resources. This allows optimal task scheduling and provides the shortest backup window.

Job chaining was a common practice with legacy backup solutions in order to prevent overloading the backup infrastructure resources by running too many concurrent tasks. This is no problem with Veeam, as every Veeam component has a maximum of concurrent tasks it can run. For instance, by default, a Proxy server with eight CPU cores, can run up to eight concurrent tasks (regardless how many backup jobs and VMs you are you trying to run concurrently).

Veeam backup speed can have negative impact on the production storage and the VMs performance. To mitigate this problem, you can utilize [Storage Latency Control](https://helpcenter.veeam.com/docs/backup/vsphere/io_settings.html) (or Backup I/O Control) settings.

Veeam has a load balancing method that automatically allocates proxy resources making a choice between all proxies managed by Veeam Backup & Replication that are available.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#binding-jobs-to-specific-proxies)Binding jobs to specific proxies

While configuring a backup job, you can [disable the automatic proxy selection](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_storage_vm.html). Instead, you can select individual proxies from the list of proxies managed by Veeam backup server, and assign them to the job. This is a very good way to manage distributed infrastructures; it also helps to keep performance under control.

For example, if you are backing up a cluster or clusters residing on a multiple blade chassis, and you are using virtual proxies, keep the proxies’ load well-balanced and optimize the network traffic.

Dedicated proxies can be also very helpful if you use a stretched cluster and do not want proxy traffic to cross inter-site links.

If you are going to manually select the proxy servers for a job, it’s also recommended you **select multiple proxy servers** in order to prevent having a single point of failure and increase availability. In that way, if one of the proxy server fails, the backup job could run anyway by using one of the other proxy servers set in the job.

**Tip:** to optimize load balancing in a distributed environment where backup proxies are located in multiple sites, it is recommended to select all proxies from the same site in the corresponding job.

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#assigning-virtual-repositories)Assigning virtual repositories

It is recommended to use a physical repository. When this is not possible, special care should be taken to ensure that the east-west traffic from the proxies to the ESXi with the repository’s links do not become a bottleneck.

It is recommended to increase the quantity of virtual machines with the repository service and distribute the bandwidth more evenly.

In environments with multiple clusters, it is recommended to assign a virtual repository or repositories to each. This will stop backup traffic traveling between clusters.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job.html#references)References

-   [Exclude Objects from Backup Job](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_excludes_vm.html)
-   [Binding Jobs to Specific Proxies](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_storage_vm.html)
-   [Monitoring Protected VMs](https://helpcenter.veeam.com/docs/one/reporter/protected_vms.html)
-   [Job Chaining](https://helpcenter.veeam.com/docs/backup/vsphere/job_schedule.html#chain)
-   [Storage Latency Control](https://helpcenter.veeam.com/docs/backup/vsphere/io_settings.html)
-   [Resource scheduling](https://helpcenter.veeam.com/docs/backup/vsphere/resource_scheduling.html)
-   [Proxy Affinity](https://helpcenter.veeam.com/docs/backup/vsphere/proxy_affinity.html)
-   [Per VM Backup Files](https://helpcenter.veeam.com/docs/backup/vsphere/per_vm_backup_files.html)

___
