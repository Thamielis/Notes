---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html
author: 
---

# Repository Storage | Veeam Backup & Replication Best Practice Guide

---
This section refers to the sizing of standard disk repositories.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html#best-practice)Best practice

-   Use the [Veeam Size Estimator (VSE)](https://calculator.veeam.com/vse/) or [Veeam Capacity Calculator](https://calculator.veeam.com/vbr/) to estimate capacity requirements
-   Use ReFS/XFS with block cloning to reduce space requirements for synthetic fulls and GFS restore points and improve merge performance
-   Add more resources if you plan to use health-checks as health checks require additional read IO

___

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html#estimating-repository-capacity)Estimating repository capacity

When estimating the amount of required disk space, you should know the following:

-   Total amount of data being backed up
-   Frequency of backups
-   Retention period for backups
-   Planned backup chain type (recommended: Forward Incremental with synthetic full backups)
-   Is ReFS/XFS block cloning be used (recommended)

Also, when testing is not possible beforehand, you should make assumptions on compression and deduplication ratios, change rates and other factors. The following figures are typical for most deployments; however, it is important to understand the specific environment to figure out possible exceptions:

-   Data reduction thanks to compression and deduplication is usually 2:1 or more; it’s common to see 3:1 or better, but you should always be conservative when estimating required space.
-   Typical daily change rate is between 2% and 5% in a mid-size or enterprise environment. This can greatly vary among servers. Database servers have high change rates (up to 30-50% in worst case). If there is a high percentage of databases involved, calculate with higher values like (e.g. 10%).
-   Include additional space for one-off full backups.
-   Include additional space for backup chain transformation — at least the size of a full backup multiplied by 1.25.
    -   These are not recommended backup chain types, Forward Incremental with Synthetic Fulls is recommended.
    -   Note: Capacity Tier “Move” only supports Forward Incremental with Synthetic Fulls.
-   Use ReFS or XFS to improve merge performance and reduce space requirements for synthetic full and GFS through the Fast Clone feature.

Using the numbers above, you can estimate required disk space for any job. Besides, always leave extra headroom for future growth, additional full backups, moving VMs, restoring VMs from tape, etc.

A repository sizing tool that can be used for estimation is available at [Veeam Size Estimator (VSE)](https://calculator.veeam.com/vse/) or [Veeam Capacity Calculator](https://calculator.veeam.com/vbr/).

-   Note: These are _estimation_ tools and results may differ from a real-life usage scenario.
-   Note: That both tools only support Forward Incremental and Forever Forward Incremental backup chains. Forever Forward Incrementals can be calculated if ReFS/XFS is enabled as the calculation is the same as with forward incremental with Synthetic Fulls.

Run the “Capacity Planning for Backup Repositories” report to analyze future space consumption.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/repositories%20storage.html#references)References

-   [Veeam Help Center - Backup Repository Section](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository.html)
-   [Veeam Help Center - Data Compression and Deduplication](https://helpcenter.veeam.com/docs/backup/vsphere/compression_deduplication.html)
-   [Veeam Help Center - Fast Clone](https://helpcenter.veeam.com/docs/backup/vsphere/backup_repository_block_cloning.html)
-   [Microsoft - ReFS Overview](https://docs.microsoft.com/en-us/windows-server/storage/refs/refs-overview)
-   [Veeam Capacity Calculator](https://calculator.veeam.com/vbr/)
-   [Veeam Size Estimation Tool (VSE)](https://calculator.veeam.com/vse/)
-   [Alliance Partner Integrations & Qualifications - Veeam Ready Repository](https://www.veeam.com/alliance-partner-integrations-qualifications.html?programCategory=repo)
-   [Backup Chain Detection](https://helpcenter.veeam.com/docs/backup/vsphere/capacity_tier_inactive_backup_chain.html)

___
