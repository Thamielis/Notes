---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/
author: 
---

# Repository Design | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#veeam-backup-repository-design)Veeam backup repository design

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#best-practice)Best practice

-   Ensure you comply with the 3-2-1 rule
-   Physical repositories are recommended where possible (ideally combined with proxy role using backup from storage snapshots).
-   Calculate one repository core per three proxy cores
-   Calculate 4GB RAM per repository CPU core
-   The recommended minimum for a repository is two cores and 8GB RAM

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#repository-server-placement)Repository server placement

The Veeam Backup Repository can be located wherever the environment allows it. The most common design has a primary backup on-site and a backup copy off-site.

The key recommendation is to follow the [3-2-1](https://www.veeam.com/blog/how-to-follow-the-3-2-1-backup-rule-with-veeam-backup-replication.html) rule.

-   Three copies of the data (production, backup and backup-copy)
-   Two different media
-   One copy off-site

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#repository-server-sizing)Repository server sizing

At the repository a task slot correlates to a concurrently processed disk which would have been calculated as part of the proxy sizing. See [Backup Proxy Design](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies) for details.

The quantity of cores required can be calculated by dividing the proxy core count by three. For example:

```
Proxy: 20 cores / 3 = 7 cores (rounded up)
```

The reason for the three value is that the CPU consuming compression is done on the proxy side. That allows more than a single task per-core at the repository.

To calculate the required RAM, take the repository core-count and multiply with 4GB. For example:

Always use 64 KB block allocation size. For ReFS based file systems the recommendation is to add 0.5GB RAM per TB of ReFS storage. However, you don’t have to scale this indefinitely. 128GB of RAM is often sufficient for the task, with OS and ReFS requirements if the total ReFS volume size of the server is below ~200TB. Depending on the ReFS size or task requirements you may want to add up more memory but there should be no need to go over 256 GB.

A word of caution about ReFS file systems and thin provisioned LUNs: ReFS does not support trim, unless on storage spaces, so space reclamation will not take place. For this reason, it’s recommended to use thick provisioned LUNs with ReFS.

Please see the full list of operations that consume task slots at the bottom of this page.

One known issue that requires attention is fragmentation of the ReFS filesystem, which is inevitable as clone operations are executed regularly.

Fragmentation affects negatively read performance, and even those reads that would normally be sequential will basically become random operations.

There are tools to defragment ReFS, but they should be used with caution, as it takes a long time for the procedure to complete and they generate a heavy performance hit.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#physical-or-virtual)Physical or virtual?

In general, we recommend whenever possible to use physical machines as repositories, in order to maximize performance and have a clear separation between the production environment that needs to be protected and the backup storage. It is also recommended to combine this with the proxy role if backup from Storage Snapshots, Direct SAN backup or NBD transport modes are be used. This keeps overheads on the virtual environment and network to a minimum.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#virtual-repository-considerations)Virtual repository considerations

If you choose to use a virtual machine as a repository or gateway server, keep in mind that the storage, the associated transport media and the network will be heavily occupied.

The best practice is to avoid using the same storage for backups and production. The loss of this single system would lead to the loss of both copies of the data, the production and the backups.

It is also recommended **not** to use VMFS based disks. If the disk was to be lost or corrupted, then all the backup data would also be lost as well. It is recommend that the repository VM either uses directly mounted iSCSI, or as RDMs in Physical access mode. This allows the disks to be either be reattached to a VM in a new cluster, or to a physical server.

The available network and storage bandwidth of the hypervisor needs to be considered when using a virtual repository. The reason for this is that the bandwidth from each proxy will converge on that ESXi host(s) where the repository runs.

Also take into account that multiple virtual repositories may be running on the same hypervisor host because of DRS (distributed resource scheduling). Consider using anti-affinity rules to keep repositories on different hosts to avoid network bottlenecks.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#virtual-linux-hardened-repository)Virtual Linux Hardened Repository

Virtual Hardened Repositories are NOT recommended for production environments. They should only be used for testing purposes.

The reason for this is that the attack surface is greatly increased as you not only need to secure the Linux OS, but also the VM running in VMware. This includes heavily locking down user management permissions on the VM as well as access to the VM via the console.

Ideally the Linux Hardened Repository should be an administratively and physically isolated system.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#repository-task-slot-use-reference)Repository task slot use reference

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#backup)Backup

| Backup type | Tasks |
| --- | --- |
| VMware/Hyper-V | One per disk |
| Nutanix | One per VM |
| Veeam Agent for Windows | One per disk |
| Veeam Agent for Linux | One per machine |

Merges and synthetic operations

| Hypervisor | Repository setting | Tasks |
| --- | --- | --- |
| VMware/Hyper-V | Per-Job | One per Job |
| VMware/Hyper-V | Per-Machine | One per VM |
| Nutanix AHV | Per-Job | One per VM |
| Nutanix AHV | Per-Machine | One per VM |

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#backup-copies)Backup copies

| Hypervisor | Tasks |
| --- | --- |
| VMware/Hyper-V/ AHV | One per VM |

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#capacity-tier-offload)Capacity-Tier offload

| Type | Tasks |
| --- | --- |
| Machines | One task per backup chain offloading |
| Database plugins (v11) | one plug-in job offloading |

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#enterprise-application-plug-ins)Enterprise application plug-ins

| Type | Tasks |
| --- | --- |
| SAP HANA | Depends on the [services](https://helpcenter.veeam.com/docs/backup/plugins/environment_planning_saphana.html) |
| RMAN | One Per-RMAN channel |
| MSSQL | One per-parallel data stream |

At restore plug-ins do not consume task slots as we cannot control how many restore streams are started by design of the backup applications.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#log-backups)Log backups

| Type | Tasks |
| --- | --- |
| Log shipping (backup) | One task per machine |
| Backup copy job | one task per machine |

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/#references)References

-   [Veeam Help Center - Backup Copy](https://helpcenter.veeam.com/docs/backup/vsphere/backup_copy.html) - About 3-2-1 rule
-   [Veeam Help Center - Repository System Requirements](https://helpcenter.veeam.com/docs/backup/vsphere/system_requirements.html#repo)
-   [Veeam Help Center - Backup Repository Section](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository.html)
-   [Veeam Plug-ins for Enterprise Applications](https://helpcenter.veeam.com/docs/backup/plugins/overview.html)

___

## Table of contents

-   [Scale-Out Repos](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/scaleout.html)
-   [Repository Storage](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html)
-   [NAS Backup Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nasrepo.html)
-   [NAS cache repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/nascache.html)
-   [Block Storage (DAS/SAN)](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/block.html)
-   [Data Domain](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/datadomain.html)
-   [Dedup Appliances](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/deduplication.html)
-   [Exagrid](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/exagrid.html)
-   [StoreOnce](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html)
-   [Gateway Server](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/gateway.html)
-   [Object Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/object.html)
-   [Veeam Ready](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/veeamready.html)

___
