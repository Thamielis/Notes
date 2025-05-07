---
created: 2024-08-01T13:48:42 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html
author: 
---

# VBR Database | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#veeam-backup--replication-database)Veeam Backup & Replication Database

Veeam Backup & Replication stores all information about backup infrastructure, jobs settings, job history, sessions and other configuration data in a Database server often referred to as the “Configuration Database”

When planning the Veeam Backup & Replication deployment, you must choose the placement of the configuration database. It may be either a local or a remote Database Server. Please see the following recommendations to ensure your Veeam setup will scale to the size of your infrastructure.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#database-engine)Database Engine

Starting from Veeam Backup & Replication v12, you can also use PostgreSQL instead of Microsoft SQL Server. In fact the default installation will now install PostgreSQL. This decision was made because Microsft SQL Express edition came with a lot of limitation in terms of scaling (eg max 10 GB Database size). PostgreSQL does not have these limitations while it does not require an expensive license either. Additionally, the default installation will automatically tune the database for Veeam Backup & Replication.

However, since v12 is the first version to support PostgreSQL, it is still recommended to use Microsoft SQL Server when you backup more than 5000 VMs. Refer to the flow chart below for the best choice matching your environment. Also, if you have implemented High Availability as discussed in Database placement section and you have no licensing concerns, there is no hard requirement to migrate to PostgreSQL. Finally, if you are in a complex environment with multiple Veeam Backup & Replication servers and Veeam Enterprise Manager, consider that all of them must use the same Database Engine.

![](https://mermaid.ink/svg/eyJjb2RlIjoiJSV7XG5pbml0OiB7XG4ndGhlbWUnOiAnYmFzZScsXG4ndGhlbWVWYXJpYWJsZXMnOiB7XG4ncHJpbWFyeUNvbG9yJzogJyMwMGI0MzYnLFxuJ3ByaW1hcnlUZXh0Q29sb3InOiAnI2ZmZmZmZicsXG4ncHJpbWFyeUJvcmRlckNvbG9yJzogJyM0OTUxNWYnLFxuJ2xpbmVDb2xvcic6ICcjNDk1MTVmJyxcbidzZWNvbmRhcnlDb2xvcic6ICcjNDk1MTVmJyxcbid0ZXJ0aWFyeUNvbG9yJzogJyNmZmYnXG59XG59XG59JSVcbiUlLVxuZmxvd2NoYXJ0IFRCXG5jbGFzc0RlZiBkZWZhdWx0IHN0cm9rZS13aWR0aDozcHg7XG4lJS1cbkZbRnVsbCBNaWNyb3NvZnRcXG4gU1FMIHNlcnZlcl1cblBbUG9zdGdyZVNRTF1cbk1bTWlncmF0ZSBBTEwgdG8gUG9zdGdyZVNRTFxcbmFmdGVyIHYxMiB1cGdyYWRlXVxuJSUtXG5WQ0N7VmVlYW1cXG5DbG91ZCBDb25uZWN0fVxuVns-IDUwMDBcXG5WTXN9XG5Te1wiSGVhdmlseSByZWx5IG9uXFxuc3RhZ2luZyBzZXJ2ZXIqXCJ9XG5Ve1VwZ3JhZGUgZnJvbVxcbiB2MTF9XG5FRXtFeGlzdGluZyBWZWVhbVxcbmVudmlyb25tZW50fVxuRkN7QWxyZWFkeSBPblxcbkZ1bGwgTVMgU1FMIFNlcnZlcn1cbkx7XCJNaWNyb3NvZnRcXG5saWNlbnNpbmdcXG5jb25jZXJuc1wifVxuJSUtXG5WQ0MgLS0-fFllc3wgRlxuVkNDIC0tPnxOb3wgVlxuJSUtXG5WIC0tPnxZZXN8IEZcblYgLS0-fE5vfCBTXG4lJS1cblMgLS0-fFllcywgY29uc2lkZXJ8IEZcblMgLS0-fE5vfCBVXG4lJS1cblUgLS0-fFllc3wgRkNcblUgLS0-fE5vfCBFRVxuJSUtXG5FRSAtLT4gfFllc3wgRkNcbkVFIC0tPiB8Tm98IFBcbiUlLVxuRkMgLS0-fFllc3wgTFxuTCAtLT4gfE5vfCBGXG5MIC0tPiB8WWVzLCBjb25zaWRlcnwgTVxuJSUtXG5GQyAtLT58Tm8sIGNvbnNpZGVyfCBNIiwibWVybWFpZCI6bnVsbH0)

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#database-placement)Database placement

There may still be scenarios where a remote DB Server is the better choice then a local install:

-   **High Availability** - Microsoft SQL Clustering and AlwaysOn Availability Group on external SQL Servers can be used for configuration database high availability. Please refer to the following [KB article](https://www.veeam.com/kb2301) for the configuration details
-   **Licensing** - Some enterprises have dedicated virtual clusters for SQL Server due to licensing constraints. In such cases, you may place the Veeam configuration database on existing instances to lower the overall TCO. Alternatively, if you are well below 5000 VMs, consider using PostgreSQL.
-   **DB Load Management** - By separating the database you can avoid race conditions between the Veeam Backup & Replication server software and the database engine. It will be easier to pinpoint performance issues.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#migrating--using-postgresql)Migrating / Using PostgreSQL

Migrating to PostgreSQL is not a straight forward process and requires careful planning. **_All backup servers must be based on the same database engine as Veeam Backup Enterprise Manager (PostgreSQL or Microsoft SQL Server)._**

-   Upgrade Veeam Enterprise Manager and then upgrade all Veeam Backup & Replication servers to v12 including all the latest patches ([P20230412](https://www.veeam.com/kb4409) specifically contains a fix for a PostgreSQL migration issue)
-   Migrate the [Veeam Enterprise Manager to Postgres](https://www.veeam.com/kb4409)
-   Migrate the [Veeam Backup & Replication server to Postgres](https://helpcenter.veeam.com/docs/backup/vsphere/vbr_config_migrate_to_postgresql.html)

It is also important to understand that if you are installing a new Veeam Backup & Replication Server in an existing environment and you are not planning to migrate fully to PostgreSQL, you must explicitely install/use a Microsoft SQL Server.

Finally, if you are planning on using PostgreSQL, it is recommended to always download the [latest supported PostgreSQL installer](https://www.veeam.com/kb4386) instead of the default one shipped with the Veeam Backup & Replication installer. If you do so, do not forget to tune the database by using the corresponding [PowerShell utility](https://helpcenter.veeam.com/docs/backup/powershell/set-vbrpsqldatabaseserverlimits.html).

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#sizing)Sizing

Veeam Backup & Replication may consume high amounts of CPU and RAM while processing backup or replication jobs. To achieve better performance and load balancing it is necessary to provide sufficient RAM and CPU resources to Veeam components. Remember to add additional resources, if the backup server is responsible for multiple roles, such as repository server or backup proxy.

Please follow these guidelines:

| Number of concurrently running jobs | CPU | RAM |
| --- | --- | --- |
| Up to 25 | 2 | 4GB |
| Up to 50 | 4 | 8GB |
| Up to 100 | 8 | 16GB |

**Note:** Concurrently running jobs include any job type with a continuous schedule such as Backup Copy Jobs.

When running more than 100 jobs concurrently increase the amount of resources by 2 CPU cores and 4GB of RAM for every 25 concurrently running jobs.

It is recommended to place the configuration database on a fast, resilient storage subsystem, preferred flash. High-performance storage for backing the configuration database will result in overall increased processing performance. Jobs with a lot of metadata such as very large SharePoint farms with thousands of sites, SQL Server instances with many databases or Files to Tape jobs may increase the I/O requirements for the configuration database.

In general PostgreSQL is expected to use less resources than Microsoft SQL Server. Because PostgreSQL integration is fairly new, you can use the same sizing for PostgreSQL.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#disk-space-usage)Disk space usage

500 VMs use around 10GB disk space for the configuration database. File-to-tape jobs can increase the size massively depending on the number of files.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#microsoft-sql-db-staging-server)Microsoft SQL DB Staging Server

It is possible to leverage a remote SQL Server as staging server during restores in Veeam Explorer products. For example if you use PostgreSQL for your configuration database engine, you might consider the production host as a staging server or any other Microsoft SQL Server.  
If you are using the explorers extensively, you might want to consider a Full Micrsoft SQL Server on the backup server for lowest latency and highest performance.

Veeam Backup & Replication does not require any specific settings<sup id="fnref:sqlrequirements"><a href="https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#fn:sqlrequirements">1</a></sup> on the SQL Server in order to utilize the capabilities of Veeam Explorer _for SharePoint_ or _SQL_.

Both local and remote SQL Servers can be used for staging purposes, the corresponding requirements are detailed on [Veeam Helpcenter](https://www.veeam.com/documentation-guides-datasheets.html) and can be found through the following links:

-   [Veeam Explorer for Microsoft SharePoint](https://helpcenter.veeam.com/docs/backup/explorers/vesp_staging_microsoft_sql_server.html)
-   [Veeam Explorer for Microsoft SQL Server](https://helpcenter.veeam.com/docs/backup/explorers/vesql_configure_staging.html)

**Tip:**

-   Enable and configure all features used by production databases.
-   When possible use the highest license level and latest version and cumulative update level installed in any VM.
-   Using an older version of SQL Server for the configuration database than running in a protected VM may result in warnings in job session logs when such VMs are processed.

If you plan to restore encrypted databases with Veeam Explorer _for Microsoft SQL Server_ or _SharePoint_ you will need a valid encryption certificate on the staging Microsoft SQL Server<sup id="fnref:kb2006"><a href="https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#fn:kb2006">2</a></sup>.

Follow Microsoft general recommendations for optimal SQL performance, for example, place the SQL `tempdb` on the fastest disks for best performance.

___

___
