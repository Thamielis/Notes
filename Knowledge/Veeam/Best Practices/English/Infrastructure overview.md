---
created: 2024-08-01T12:52:45 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/1_Assessment/A_Infra_Overview/infra_overview.html
author: 
---

# Infrastructure overview | Veeam Backup & Replication Best Practice Guide

---
### [](https://bp.veeam.com/vbr/1_Assessment/A_Infra_Overview/infra_overview.html#3-2-1)3-2-1

Once we have defined all the numbers required for the sizing calculations, we need to have a look on the infrastructure estate. It is the best practice to follow the the [3-2-1](https://www.veeam.com/blog/how-to-follow-the-3-2-1-backup-rule-with-veeam-backup-replication.html) rule:

-   Have at least **three copies of your data.**
-   Store the copies on **two different media.**
-   Keep **one backup copy off-site.**

Veeam Backup & Replication can help you to fulfill all 3-2-1 backup rule requirements:

-   Have at least **three copies of data:**  
    Set up several backup jobs to create several backups for each of your virtual and physical machines.
-   Store the copies on **two different media:**  
    Veeam is storage-agnostic, meaning it supports disks, tapes, the cloud and more. You can store your backups to any of the listed media.
-   Keep **one backup copy off-site:**  
    Set up backup copy jobs to transfer your backups off-site to another location or a to a Veeam Cloud Connect repository, or use a [Scale-out Backup Repository](https://www.veeam.com/blog/5-reasons-why-sobr.html) to automatically offload all backups to an Object Storage in the Public Cloud, at another location or at a Veeam Cloud & Service Provider.

### [](https://bp.veeam.com/vbr/1_Assessment/A_Infra_Overview/infra_overview.html#air-gapped-backups-with-object-storage-immutability)Air-gapped backups with object storage immutability

Veeam Backup & Replication allows you to prohibit deletion of data from the extents of the Scale-out backup repository by making that data temporarily immutable. It is done for increased security: immutability protects your data from loss as a result of attacks, malware activity or any other injurious actions.

**Amazon S3 Object Lock** in **compliance mode** offers exactly this for the duration of the retention period.

In order to use immutability, you need to enable the _Object Lock_ and _Versioning_ features on your S3 bucket at the time you create the bucket. Keep in mind that you can enable Object Lock only at the time of creating the bucket.

### [](https://bp.veeam.com/vbr/1_Assessment/A_Infra_Overview/infra_overview.html#planning)Planning

Before you start planning the locations to store the backup data you need to get a proper overview of the network topology of your infrastructure. You need to know the type of connectivity and the amount of bandwidth available between locations.

Where you need to store a copy of the data can also be a business decision. Some organisations like to store a copy of all data within a specific region or location. Sometimes it’s even needed by law or segment regulations.

In the end, you need to gain insight into the planned data-flow within you infrastructure and the locations where storage capacity is required. With this planning in mind, the inventoried amount of data, the change-rates and the backup window you can determine the bandwidth needs between locations. A simple [bandwidth calculator](http://rps.dewin.me/bandwidth/) can help you with that.

## [](https://bp.veeam.com/vbr/1_Assessment/A_Infra_Overview/infra_overview.html#references)References

-   [3-2-1 rule explained](https://www.veeam.com/blog/how-to-follow-the-3-2-1-backup-rule-with-veeam-backup-replication.html)
-   [Scale-out Backup Repository](https://www.veeam.com/blog/5-reasons-why-sobr.html)
-   [Object Storage Immutability](https://www.veeam.com/blog/air-gapped-object-storage-cloud-tier-immutability.html)
-   [Bandwidth Calculator](http://rps.dewin.me/bandwidth/)

___
