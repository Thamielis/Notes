---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/scaleout.html
author: 
---

# Scale-Out Repos | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/scaleout.html#scale-out-backup-repository)Scale-out Backup Repository

Scale-out Backup Repository is, as the name implies, a scale-out architecture, based on multiple datamovers, with a notion of master and slave repository datamovers.

During backups, the master datamover is always started where the write is happening. During restore, the master is always started where the VBK is located, as most blocks are likely retrieved from this location.

![SOBR Data Mover](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/media/sobr_data_mover.png)

A master datamover is the only repository datamover receiving data from a source datamover (a proxy in a backup job or a source repository in a backup copy job). A master datamover is able to communicate if needed with other slave datamovers to retrieve their data.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/scaleout.html#network-considerations)Network considerations

As in any scale-out solution, careful design should be applied to the network. Communications between the different data movers may increase network consumption, regardless the policy in use or the specific design of the scale-out architecture. When using Scale-out Backup Repository, 10Gb networks are the recommended minimum.

___

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/scaleout.html#references)References

-   [Scale-out Backup Repository](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository_sobr.html)
-   [Capacity Tier](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier.html)

___
