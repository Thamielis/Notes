---
created: 2024-08-01T14:11:11 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/object.html
author: 
---

# Object Repository | Veeam Backup & Replication Best Practice Guide

---
Starting from Veeam Backup & Replication v12, a Object Storage Repository can be used as a simple repository, or both as a Performance Tier or a Capacity Tier in a [Scale-out Backup Repository](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/scaleout.html).

Users can freely decide to use any of the storage types based on multiple business parameters: being Veeam a software solution that can adapt itself to any situation, they can keep the existing Block Storage and maximize the storage estate (not just the machines, but also the related connectivity infrastructure, for example FC fabric) for its entire life cycle. When a hardware refresh is due, they can keep using block storage - if they are more confident with this type of storage - or evaluate a progressive switch to Object storage, or a mix of both depending on the business requirements.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/object.html#on-premises-vs-hosted)On-premises vs hosted

The biggest choice when considering Object Storage is to either go for an on-premises (on-prem is short) solution or a hosted one.

-   if the goal is to host primary backup jobs, we strongly recommend choosing an on-prem solution. The same latency and performance considerations apply here as with a block storage solution, so the object storage must also be as close as possible to the production environment;
    
-   for the Capacity Tier of a SOBR, or for backup copy jobs, users can choose again an on-prem solution, or to pay for a hosted solution. Some considerations for the latter:
    
    -   Throttling: many hosted solutions apply limits to both IOPS and API calls per seconds. For this reason, having a single large bucket is not a correct choice. Better to have many smaller buckets, so to distribute the load and increase the overall performance (as that will be the sum of all the limits).
    -   Costs: consuming a public Object Storage is done via a price per month, calculated for both API calls and used space:
        -   putting and modifying data in object storage requires API calls like PUT, COPY or LIST. These calls have a possible price per call (depending on the chosen storage provider), and even if the cost of a single call is almost zero, thousands of calls make up for a value that has to be considered;
        -   for data at rest, the used resources are normally priced by GB/month;
        -   Enabling immutability on a given bucket is a choice we heavily recommend, but it comes with an additional cost, since retention becomes longer, and such the amount of storage GB’s per months.
    -   Bandwidth for restores: many public solutions offer free uploads, that is the bandwidth consumed for backups. But for restores, download bandwidth is heavily consumed, and that is usually paid. Egress traffic cost from the cloud data center can become significant depending on how much data is required to be pulled. Veeam tries to leverage the available data blocks in the Performance Tier to reduce costs, but blocks which are not present have to be downloaded by requesting the related objects.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/object.html#sizing-considerations)Sizing considerations

Due to the different technology, we cannot use the same concepts that come from the experience with Block Storage, like for example the ratio between CPU/Memory and the available storage space. For this reason, especially for on-prem solutions, we suggest to get in touch with your vendor/partner and let them know that you want to store Veeam backups to have the right sizing. Veeam backups put a high load on Object storage, so a proper design is required.

Be careful especially about the size of a bucket, and when possible prefer to use multiple smaller buckets. For primary backups we found so far that a bucket size of around 250 TB is a good choice, for multiple reasons:

-   amount of stored objects (and thus metadata)
-   amount of API calls
-   throughput

Some hyperscalers enable throttling on these values, so using multiple buckets can be seen as a scale-out solution to circumvent these limits, as Veeam can leverage the sum of the above mentioned limits. For example, if we need to have 500 TB of space, and a bucket is limited to 1000 ops/seconds, but using two buckets with 250TB each we can have 2000 ops/seconds, thus doubling the performance. Be sure to check with your vendor/partner to control which limits exist (if any).

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/object.html#lifecycle-rules-and-tiering)Lifecycle rules and tiering

Do **not configure any tiering or lifecycle rules** on object storage buckets used for Veeam Object Storage Repositories. They are **unsupported** as [documented in the Help Center](https://helpcenter.veeam.com/docs/backup/vsphere/object_storage_repository_cal.html#general-considerations-and-limitations).

Here is why:

1.  Tiering and lifecycle rules in object storages are based on object age. However, with Veeam’s implementation, even a very old object (which refers to a Veeam block) could still be relevant for the latest offloaded backup file when the block was not changed between the restore points. An object storage vendor can not know which blocks are still relevant and which are not and thus can not make proper tiering decisions.
2.  The vendor APIs for the different storage products are not transparent. For example, accessing Amazon S3 or Amazon Glacier requires the use of different APIs. When tiering/lifecycle management is done on the object storage side, Veeam services are most likely not aware of that and cannot decide on how to access the tiered objects.

___

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_backup_repositories/object.html#references)References

-   [Alliance Partner Integrations & Qualifications - Object Storage Target](https://www.veeam.com/alliance-partner-integrations-qualifications.html?type=object-storage-target)
-   [Object Storage Repository](https://helpcenter.veeam.com/docs/backup/vsphere/object_storage_repository.html)

___
