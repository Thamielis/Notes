---
created: 2024-08-01T13:48:41 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/
author: 
---

# Proxy Design | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/#backup-proxy)Backup proxy

The backup proxy is the component that reads the data from the source infrastructure, elaborates and transfers it to the final destination: either the backup repository or the DR infrastructure (in case of replication).

In this section, we will be providing all the recommendations for proper sizing of this crucial component.

___

## Table of contents

-   [vSphere Proxy](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/vmware_proxies.html)
-   [Hyper-V Proxy](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/hyperv_proxies.html)
-   [File Backup Proxy](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_proxies/nas_proxies.html)

___
