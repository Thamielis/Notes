---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html
author: 
---

# StoreOnce | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html#integrated-vs-non-integrated)Integrated vs Non-integrated

The preferred choice is to use HPE StoreOnce with Catalyst as it provides many performance benefits over the non-integrated type. These include, but are not limited to:

-   Much faster Synthetic Full Backups.
-   Increased performance for Instant Recovery, SureBackup and On-Demand Sandbox.
-   Replication between two HPE StoreOnce backup repositories.
-   Independent Software Vendor (ISV) Controlled Data Immutability (ISV-DI) to make data temporarily immutable.
-   Fixed Block Chunking which improves performance when creating incremental and synthetic full backup files by 4 to 5 times compared to variable chunking.
-   Cloud Bank Storage support.

For more details and required software versions, please refer to the [helpcenter](https://helpcenter.veeam.com/docs/backup/vsphere/storeonce_supported_features.html).

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html#backup-performance)Backup performance

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html#single-stream-vs-multiple-streams)Single stream vs multiple streams

While backup performance for single stream is roughly 30% faster with source side deduplication disabled (“High Bandwidth” mode), it’s still recommended to keep it enabled as it’s possible to achieve a high throughput by concurrently processing more than 10 streams (eg. more than 10 VMs).

To use multiple streams, make sure to use [Per-Machine Backup Files](https://helpcenter.veeam.com/docs/backup/vsphere/per_vm_backup_files.html) by ticking the checkbox under the [Advanced Repository Settings](https://helpcenter.veeam.com/docs/backup/vsphere/dsa_repository_repository.html#configuring-advanced-repository-settings).

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html#proxygateway-servers)Proxy/Gateway servers

To get the best level of performance, it’s best to have multiple proxy/gateway servers in order to distribute the load and avoid saturating the maximum number of connections allowed from a single host. The HPE StoreOnce Catalyst agent however:

-   is embedded into the Veeam Data Mover
-   must be installed on a 64-bit Microsoft Windows version

Keep this in mind when deciding on the operating system for the Veeam proxy servers. When proxy servers run Windows, the gateway server (and Catalyst agent) can be combined on the same servers. When proxy servers run Linux, dedicated Windows gateway servers must be used. It is not required to have a 1:1 relationship and one can have many Linux proxy servers and just a few Windows gateway servers.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html#syntheticactive-fulls)Synthetic/Active Fulls

It has been observed in multiple, specific environments where the primary storage is fast enough, that Active Fulls perform faster than Synthetic Fulls, regardless of the Catalyst bandwidth modes, with up to double the performance. However, Synthetic Full backups are still recommended for the majority of general cases as they reduce the load on the infrastructure and require likely less time to complete.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html#maximum-number-of-concurrently-opened-files)Maximum number of concurrently opened files

HPE StoreOnce has a limit on the number of concurrently opened files. Due to this limit, the maximum length of backup chains (chains that contain one full backup and a set of subsequent incremental backups) on HPE StoreOnce is also limited and depends on the particular storage model. For more information, refer to the following [table](https://helpcenter.veeam.com/docs/backup/vsphere/deduplicating_appliance_storeonce.html#limitations-and-recommendations-for-hpe-storeonce).

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html#catalyst-over-fc-vs-ethernet-single-stream-performance)Catalyst over FC vs. Ethernet single stream performance

It has been verified that single stream backups on Catalyst over FibreChannel (FC) are slower than Ethernet, by approximately 30-40%. While during backup operation its not an issue as you can have multiple streams to have the optimal level of performance, this negatively affects mount-based restores such as File Level Recovery (FLR), SQL, Exchange, Oracle, etc as they are limited to a single stream’s performance.

If you still want to use FC, then you can also do that with multiple gateway servers.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/storeonce.html#references)References

-   Veeam Alliance Partner integrations and qualifications: [HPE StoreOnce](https://www.veeam.com/alliance-partner-integrations-qualifications.html?type=deduplication-target&alliancePartner=hpe)
-   Deduplication Appliance Best Practices: [KB1745](https://www.veeam.com/kb1745)
-   Helpcenter: [HPE StoreOnce](https://helpcenter.veeam.com/docs/backup/vsphere/deduplicating_appliance_storeonce.html)

___
