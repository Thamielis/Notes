---
created: 2024-08-01T13:48:42 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html
author: 
---

# vSphere Proxy | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#veeam-vmware-vsphere-backup-proxy)Veeam VMware vSphere backup proxy

Choosing the right Veeam proxy server design for your environment gives you much control over the impact on the vSphere infrastructure and the backup traffic flow. Proxies are the work horses and are critical components to achieve good backup and restore speeds.

When thinking about proxy design, you have to be familiar with the different [Transport Modes](https://helpcenter.veeam.com/docs/backup/vsphere/transport_modes.html) to understand limitations, requirements, etc. for proxy placement and design.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#proxy-placement)Proxy placement

Based on your chosen transport mode you might require virtual proxies (Hot-Add also known as Virtual Appliance Mode) or physical proxies (Direct SAN Access via iSCSI or FC/Backup from Storage Snapshots).

It is recommended to have the proxy server as close to the source data as possible with a high bandwidth connection. The traffic from the source to the proxy is not yet optimized (no compression or deduplication whatsoever), meaning that 100% of the backup data will be transferred over this link.

Also, consider a good connection between proxy and repository. Optimized data (normally ~50% of the source data size after compression and deduplication) will be transferred here.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#proxy-os-requirements)Proxy OS requirements

We recommend the latest supported version of Windows Server OS or supported Linux OS for all proxies.

We see almost no performance differences between Windows and Linux proxies. So, the OS decision can be based upon other design criterias, for example licensing.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#proxy-sizing)Proxy sizing

Getting the right amount of processing power (compute resources) is essential to achieving the RTO/RPO defined by the business. In this section, we will outline the recommendations to follow for appropriate sizing.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#processing-resources)Processing resources

Proxy performance depends on two main factors:

-   If it is Physical or virtual
-   Block or Object storage

Estimated performance of a proxy CPU core is as presented in the table:

| Proxy Type | Target storage | Full, MB/s | Incremental, MB/s |
| --- | --- | --- | --- |
| Virtual | Block | 180 | 80 |
| Virtual | Object | 110 | 80 |
| Physical | Block | 250 | 250 |
| Physical | Object | 150 | 150 |

The standard calculation can be used but now taking into account the different performance characteristics of the storage and the proxy type.

The calculation is:

```
Required Full Proxy CPU cores = (Source Data Size MB / Backup Window Sec) / Throughput per Task MBps
Required Incremental Proxy CPU cores = ((Source Data Size MB * Change Rate) / Backup Window Sec) / Throughput per Task MBps
```

```
source mb = 100 x 1024 x 1024
source mb incremental = source mb x change rate
backup window = backup window hours x 3600
```

Assuming a virtual proxy with block storage, a backup window of 24 hours for full, 8 hours for incremental and a daily change rate of 5%:

```
Required Proxy CPU cores Full = (100 x 1024 x 1024) / (8 x 3600) / 180 = 21
Required Proxy CPU cores Incremental = ((100  x 1024 x 1024) x 0.05) / (8 x 3600) / 80 = 3
```

Assuming a physical proxy with object storage, a backup window of 8 hours and change rate of 5%:

```
Required Proxy CPU cores Full = (100 x 1024 x 1024) / (8 x 3600) / 150 = 25
Required Proxy CPU cores Incremental = ((100  x 1024 x 1024) x 0.05) / (8 x 3600) / 150 = 2
```

It is best practice to configure 2 proxy tasks for one physical core or one vCPU and plan for:

-   Up to 2 GB of RAM for each physical core or vCPU

For the examples above the following RAM would be required:

| Proxy Type | Storage | Backup Type | Cores/vCPUs | RAM |
| --- | --- | --- | --- | --- |
| Virtual | Block | Full | 21 | 42 |
| Virtual | Block | Incremental | 3 | 6 |
| Physical | Object | Full | 25 | 50 |
| Physical | Object | Incremental | 2 | 4 |

A task processes 1 VM disk at a time and CPU/RAM resources are used for inline data reduction and encryption.

Please consider requirements from [User Guide](https://helpcenter.veeam.com/docs/backup/vsphere/system_requirements.html?#proxy) as minimum requirements. Using the above mentioned recommendations allow for growth and additional inline processing features or other special job settings that increase RAM consumption.

If the proxy server is used for other roles like Gateway Server for SMB shares, EMC DataDomain DDBoost, HPE StoreOnce Catalyst, or if you run the backup repository on the server, remember stacking system requirements for all the different components. This means you should provide enough resources for every role assigned to this server, in addition to proxy role resources. Please see related chapters for each components for further details.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#how-many-proxy-servers)How many proxy servers?

We have already discussed about how to size the resources required for proxy servers. We also have discussed about how many tasks we should have per proxy (this largely depends on the chose of using virtual or physical proxy servers). In addition, it’s also important to decide how many proxy servers should be deployed considering other criterias.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#availability-for-proxy-role)Availability for proxy role

It’s not enough to know how much resources we need for the proxy role. Availability is also important, as the failure of the proxy server could prevent the jobs to run properly, or even worse, could prevent us from restoring our data. Because of this, it isn’t recommended to have a single proxy server with all resources required. By having a single proxy server, we basically have a Single Point of Failure (SPOF).

It’s recommended to deploy at least two proxy servers per site, in order to provide a minumum of availability for this role.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#spare-resources-for-proxy-role)Spare resources for proxy role

It’s also recommended to consider the resources you will need for restore operations, as some of them are also going to require proxy resources to run. Consider also that when you are running all your jobs, and all proxy resources are busy processing those jobs, you won’t have resources to run, for instance, a Full VM Restore unless you have spare resources for these operations.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#proxy-servers-and-replication-jobs)Proxy servers and replication jobs

Please remember that replication jobs are also going to require proxy resources at source and target sites. These resources are in addition to the resources required for backup jobs. Please consider the resources required for both backup and replication jobs in case you want to run both kind of jobs within the same backup window.

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html#references)References

-   [Transport Modes](https://helpcenter.veeam.com/docs/backup/vsphere/transport_modes.html)
-   [Veeam Backup Proxy](https://helpcenter.veeam.com/docs/backup/vsphere/backup_proxy.html)
-   [Limitation of Concurrent Tasks](https://helpcenter.veeam.com/docs/backup/vsphere/limiting_tasks.html)
-   [Proxy Requirements](https://helpcenter.veeam.com/docs/backup/vsphere/system_requirements.html?#proxy)
-   [Build - vSphere Proxy](https://bp.veeam.com/vbr/3_Build_structures/B_Veeam_Components/B_backup_proxies/vmware_proxies.html)

___
