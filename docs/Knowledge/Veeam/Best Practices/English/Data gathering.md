---
created: 2024-08-01T12:52:45 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html
author: 
---

# Data gathering | Veeam Backup & Replication Best Practice Guide

---
To make an estimation on the needed resources, we need some input variables from your current infrastructure. To define the needed processing and storage capacity, we need to know how much data we need to protect.

## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html#amount-of-data)Amount of data

To have a clear insight on the amount of data we need to protect, we prefer to measure the number of (virtual) machines we need to protect and the amount of disk space in use by those machines. This information can be extracted out of your virtualization infrastructure for the best results.

When we only look into the used capacity of a storage solution, we do not get the right insights as most storage arrays have multiple integrated efficiency techniques nowadays to do inline compression/deduplication. This will result in incorrect numbers for our calculation.

## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html#daily-change-rate)Daily change rate

How much of the total amount of data is actually changing on a daily level? The actual changed data is collected during the backup process and written in an incremental backup file or used to compose a full backup file. As a result, the daily change rate has a huge effect on the backup window and the storage capacity needed to store the backups. As the Veeam backup will be created as an image-level backup on block level, we need to know the daily change rate on block level. This value can be measured and reported by Veeam ONE.

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html#veeam-one)Veeam ONE

To collect this information out of the virtualization infrastructure, [Veeam ONE®](https://www.veeam.com/virtualization-management-one-solution.html), part of [Veeam Availability Suite™](https://www.veeam.com/data-center-availability-suite.html), can easily generate several reports to get the right insights. To collect the needed information before you implement Veeam Backup and Replication, a trial installation of Veeam ONE can be used.

The following reports are useful to collect the needed information for a proper sizing calculation:

-   VMs Configuration
-   VM Configuration Assessment
-   VM Change Rate Estimation

![VMs Configuration](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Media/vmware_vms_configuration_02.png)

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html#rvtools)RVtools

When you need to get a fast export of the configuration details of a VMware vSphere infrastructure, a commonly used tool, [RVtools](https://www.robware.net/rvtools/), can also help you to get most of the needed details within an Excel-export.

## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Data_gathering.html#references)References

-   [Veeam ONE](https://www.veeam.com/virtualization-management-one-solution.html)
-   [Veeam Availability Suite](https://www.veeam.com/data-center-availability-suite.html)
-   [RVtools](https://www.robware.net/rvtools/)

___
