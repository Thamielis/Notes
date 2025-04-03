---
created: 2024-08-01T13:48:42 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html
author: 
---

# File Backup Proxy | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#proxy-placement)Proxy placement

As a general rule, the proxy should be as close to the source data as possible with a high bandwidth connection. The traffic from the source to the proxy is not yet optimized, meaning that 100% of the backup data will be transferred over this link.

Also, consider a good connection between proxy and repository. Optimized data, after being processed by the Proxy, will be transferred here.

**Note**: In v12, the backup proxy for File Backup has been renamed to **General-purpose backup proxy**

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#proxy-os-requirements)Proxy OS requirements

We recommend to use the latest supported OS version with latest updates to have all security and performance related updates included.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#proxy-sizing)Proxy sizing

Getting the right amount of processing power is essential to achieving the RTO/RPO defined by the business. In this section, we will outline the recommendations to follow for appropriate sizing.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#processing-resources)Processing resources

Proxies do have multiple task slots to process source data depending on the number of CPU cores available. A proxy task processes **one file share at a time** and CPU/RAM resources are used for inline compression and/or encryption.

It is best practice to plan for **4 GB of RAM for every concurrent proxy task**. When sizing a proxy, do not forget to dedicate necessary **resources for the operating system** (usually two core and 4GB RAM).

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#backup-io-control-and-proxy-resource-usage)Backup IO control and proxy resource usage

When configuring the file share in the Veeam Backup & Replication inventory, the backup IO control parameter will affect the way proxy resources will be used. It controls the number of proxies allowed to back up a given share and the number of concurrent threads per task following rules below :

| IO control | Max proxies per share | Threads per task |
| --- | --- | --- |
| Lower impact | 1 | 1 |
| Below normal | 1 | 4 |
| Normal | 2 | 8 |
| Above normal | 4 | 16 |
| Faster backup | unlimited | 16 |

**The backup IO control is a static setting**, it is not based on latency monitoring, because NAS filers don’t provide such values via SMB/NFS protocol. Similarly, the number of File Proxies is statically set at the time you define the File Share. In case it is needed, both settings can be manually adjusted by editing the File Share configuration in the Veeam Backup and Replication console.

**IMPORTANT** Note that when setting Backup IO control to the Fastest level to improve the File Backup performance, you could be moving the bottleneck to another component of the infrastructure, like the network bandwidth or the File Share itself. Careful planning is recommended when setting Backup I/O Control, as otherwise Veeam can potentially consume all I/O on a share. The sizing and design for File backup should consider all the related components in the infrastructure.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#expected-performance)Expected performance

There are several factors to consider when we design a File Backup strategy with an expected performance:

-   Source Data
-   Number of files
-   Number of shares
-   Change rate
-   Backup Window

Currently, these are the expected performance values for File Proxies:

1.  Each File Proxy core can process at a speed of 100MB/s or 0.34TB/h.
2.  Each File Proxy Task can handle 5 millions files per hour.
3.  File Proxy requires 2GB of RAM per task.

**Note:** these numbers are given assuming the infrastructure itself won’t present any limitation or bottleneck.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#guidelines)Guidelines

According to previous statements:

-   Generally speaking, the “normal” setting will be optimal. An exception might be the processing of a single, exceptionally large share, where a higher number of threads could be desirable, depending on the File Share storage performance.
-   If you have less shares than number of proxy cores, then consider spreading these cores across multiple proxies.
-   If you have more shares than proxy cores, consider adding proxy cores on existing proxies or adding more proxies to increase parallelization.
-   When using virtual proxies, keep in mind that the number of cores per proxy should not exceed 8 to avoid co-stop.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#sizing-guidelines)Sizing Guidelines

| Sizing | Formula |
| --- | --- |
| Incremental throughput requirement | (Source data TB / change rate %) / backup window hours |
| Files (M) to process per hour | ROUNDED UP: Number of files in millions / backup window hours |
| File proxy throughput | 0.34 TB/hour (100 MB/s) |
| File proxy file processing | 5 million files/hour |
| CPU core # based on incremental throughput | ROUNDED UP: Incremental throughput requirement / File proxy throughput / tasks per core |
| CPU core # based on millions of files | ROUNDED UP: Files (M) to process per hour / File proxy file processing / tasks per core |
| Highest CPU core # | ROUNDED UP TO EVEN NUMBER: Highest value of either CPU core # based on throughput or based on millions of files |
| Memory GB required | Highest CPU core # \* 2 \* # taks per core |

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#example-one)Example one

3PB source data, 800M files, 40 shares, 2% change rate, 8 hours backup window, 2 proxy tasks per core (v12).

| Sizing | Formula | Size |
| --- | --- | --- |
| Incremental throughput requirement | (3PB x 2%) / 8 hours | 7.68TB/h (at 100MB/s) |
| Files (M) to process per hour | 800M / 8 hours | 100 M/h |
| File proxy throughput | 0.34 TB/hour (100 MB/s) |   |
| File proxy file processing | 5 million files/hour |   |
| CPU core # based on incremental throughput | 7.68 / 0.34 / 2 | 12 file proxy cores |
| CPU core # based on millions of files | 100 / 5 / 2 | 10 file proxy cores |
| Highest CPU core # | 12 (highest core count rounded up to even number) |   |
| Memory GB required | 12 \* 2 \* 2 | 48 |

**Required file proxies resources are 12 cores and 48GB of RAM.** Remember consider additional resources for operating system These resources can be deployed on a single physical proxy (of at least 14 cores) or two virtual proxies (eight cores each). “Normal” and above backup IO control setting can be used.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html#example-two)Example two

300TB source data, 300M files, 2 shares, 3% change rate, 8 hours backup window, 2 proxy tasks per core (v12).

| Sizing | Formula | Size |
| --- | --- | --- |
| Incremental throughput requirement | (300TB x 3%) / 8 hours | 1.125TB/h (at 100MB/s) |
| Files (M) to process per hour | 300M / 8 hours | 37.5M/h |
| File proxy throughput | 0.34 TB/hour (100 MB/s) |   |
| File proxy file processing | 5 million files/hour |   |
| CPU core # based on incremental throughput | 1.125 / 0.34 / 2 | 2 file proxy cores |
| CPU core # based on millions of files | 37.5 / 5 / 2 | 4 file proxy cores |
| Highest CPU core # | 4 (highest core count rounded up to even number) |   |
| Memory GB required | 4 \* 2 \* 2 | 16 |

**Required file proxies resources are 4 cores and 16GB of RAM.** Remember consider additional resources for operating system These resources could be deployed on a minimum of two proxies (two shares, one proxy task per share) of four cores each. “Normal” and above backup IO control setting can be used.

___
