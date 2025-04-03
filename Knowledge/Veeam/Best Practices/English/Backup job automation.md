---
created: 2024-08-01T11:39:45 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_automation.html
author: 
---

# Backup job automation | Veeam Backup & Replication Best Practice Guide

> ## Excerpt
> Best practice from the field for Veeam Backup & Replication

---
Automation helps to simplify the jobs design and configuration. It also makes daily operation easier.

**Important:** When creating jobs based on containers, ensure that the configured constructs do not overlap.

With Veeam you can create jobs based on VM tags, which can help to automate the job configuration. Instead of choosing manually the VMs you want to include in the job, you can include all VMs with a specific tag.

In this way, if you assign a tag used in a job to a new VM, Veeam will include that new VM in the job processing the next time the job runs. No need for any job modification at all when you assign the tag to new VMs.

It is recommended to follow these guidelines:

-   Monitor the number of VMs automatically added to the job to avoid too many VMs being backed up within a single job
-   Only one tag can be used to include a VM in a job
-   Using tags, you can classify VMs by service levels, using different backup jobs for different service levels
-   [Veeam ONE Business View](https://helpcenter.veeam.com/docs/one/monitor/bv.html) can manage vSphere tags. It allows creating classification rules and updates corresponding tags in vCenter. Classifications can be defined from CPU, RAM, VM naming convention, folder, resource pool, datastore etc. Business view can also import VM/host/datastore descriptions from a CSV file. This feature can be useful when refreshing VMware tags, for example, to update a CMDB.

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_automation.html#container-based-jobs)Container based jobs

Adding resource pools, folders, datastores or vSphere tags to backup jobs makes backup management easier.

New machines that are members of such constructs or containers are automatically included in the backup job, and machines removed from the container are immediately removed from job processing. Overlapping constructs may cause undesired results. For instance, when creating jobs based on datastores, VMs with disks residing on multiple datastores included in more than one backup job will cause the VM to be backed up in each job.

Avoid choosing individual ESXi hosts in a backup/replica job when you have a **vSphere Cluster with DRS**. DRS could migrate VMs automatically (vMotion) from one host to another based on performance or affinity criteria, which could impact the job configuration and could lead a VM to stop being protected by the backup/replica job.

The same could happen when you choose an individual datastore to the backup/replica job, and the datastore belongs to a **vSphere Datastore Cluster with Storage DRS**. Storage DRS could migrate the VM (Storage vMotion) to another datastore based on performance or capacity criteria, which again could lead the VM to stop being protected by a backup/replica job.

**Important:** As a general rule, it’s recommended to use infrastructure-agnostic containers/constructs in a backup/replica job, like **folders or tags**, avoiding the use of infrastructure components like hosts, datastores or even clusters to prevent unexpected behaviors and getting the VMs unprotected. Solutions like vRealize Operations Manager could even migrate VMs from one vSphere cluster to another by using \[Workload Optimization\]\[VMware vRops Worload Optimizations\].

___

## [](https://bp.veeam.com/vbr/4_Operations/O_Veeam_Jobs/O_backup_jobs/backup_job_automation.html#references)References

-   [Veeam ONE Business View](https://helpcenter.veeam.com/docs/one/monitor/bv.html)
-   [Container Jobs](https://helpcenter.veeam.com/docs/backup/vsphere/backup_job_vms_vm.html) - see reference to toolbar to switch between views
-   [vSphere Tags](https://helpcenter.veeam.com/docs/backup/vsphere/vm_tags.html)
-   [VMware vRops Workload Optimizations](https://docs.vmware.com/en/vRealize-Operations-Manager/8.4/com.vmware.vcom.config.doc/GUID-F7DF8D29-89F3-455B-883B-6DECA11B0114.html)

___
