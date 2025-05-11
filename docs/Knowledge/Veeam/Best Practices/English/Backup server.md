---
created: 2024-08-01T13:48:41 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html
author: 
---

# Backup server | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#veeam-backup-server)Veeam backup server

In this section, we will describe how to design and size the Veeam backup server.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#single--or-multi--role)Single- or multi- role

The first choice a designer has to make is if the Veeam server is going to be a machine dedicated to run only the central component of a Veeam Backup & Replication environment, or if it will host multiple roles at the same time. This choice usually relates to the size and complexity of the environment:

-   All-in-one (Appliance Model): all the Veeam components (backup server, proxy, repository and possibly others) are installed in one single machine. In this case, the different configuration numbers need to be summed together to find out the final required size of the server;
-   Scale-out (Dedicated server): the machine where the backup server is installed runs only this service (maybe also Enterprise Manager and SQL server are installed), so the sizing calculations only involves these roles.

Choosing which deployment mode to use involves multiple considerations. We list a few here:

-   All-in-one is more simple, requires minimum design effort (we only have to size the underlying server) and the Veeam server is self-contained. If this is done on a physical machine, this “Appliance” is totally independent from the environment it is protecting. But it also become a single point of failure, as there is no redundancy.
-   Scale-out model is more powerful: we can have a “control plane” running VBR+EM+SQL in a virtual environment, to leverage the High Availability features, while the “data plane” with proxies and repositories will be different machines, each with their specific and optimized sizing. This design can protect big environments as both proxies and repositories can be deployed in multiple instances when needed.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#placement)Placement

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#backup-only-scenario)Backup only scenario

When planning to use Veeam Backup & Replication for backup jobs only, the backup server should be placed in the main data center alongside the infrastructure to be protected to leverage quick response times and local management traffic.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#when-replication-or-cdp-continuous-data-protection-is-in-use)When replication or CDP (Continuous Data Protection) is in use

When replication or CDP is used among multiple sites, the backup server should be deployed in the DR site to allow failover plans to work seamlessly, even in the case of the complete loss of the primary site. In this case, the scale-out model should be used, so that data traffic for backups stays in the primary datacenter, while only management and replication traffic flows between the two datacenters.

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_server/backup_server.html#references)References

_For backup server sizing and configuration refer to the [Build - Backup server](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_VBR_Server/Backup_Server.html) section of this guide._

-   [Build - Backup server](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_VBR_Server/Backup_Server.html)
-   [User Guide - Backup Server](https://helpcenter.veeam.com/docs/backup/vsphere/backup_server.html)
-   [User Guide - System requirements](https://helpcenter.veeam.com/docs/backup/vsphere/system_requirements.html#backup_server)
-   [User Guide - Installation settings](https://helpcenter.veeam.com/docs/backup/vsphere/install_vbr_settings.html)
-   [User Guide - Veeam Backup Catalog](https://helpcenter.veeam.com/docs/backup/vsphere/indexing_catalog.html)

___
