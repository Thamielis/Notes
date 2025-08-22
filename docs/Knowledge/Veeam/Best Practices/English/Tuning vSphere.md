---
created: 2025-07-30T11:53:26 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/3_Build_structures/B_Other/vsphere.html
author: 
---

# Tuning vSphere | Veeam Backup & Replication Best Practice Guide

---
Please read the [Supplemental - vSphere - Interaction](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html) section to understand more details on the background of these configuration settings.

The best practice is to keep the default settings wherever possible, so adjust settings only where necessary.

## [](https://bp.veeam.com/vbr/3_Build_structures/B_Other/vsphere.html#adjust-number-of-concurrent-snapshots)Adjust number of concurrent snapshots

The default number of concurrently open snapshots per datastore in Veeam Backup & Replication is 4. This behavior can be changed by creating the following registry key:

-   Path: `HKEY_LOCAL_MACHINE\SOFTWARE\Veeam\Veeam Backup and Replication`
-   Key: `MaxSnapshotsPerDatastore`
-   Type: `REG_DWORD`
-   Default value: `4`

## [](https://bp.veeam.com/vbr/3_Build_structures/B_Other/vsphere.html#mitigate-snapshot-removal-impact)Mitigate snapshot removal impact

To mitigate the impact of snapshots, consider the following recommendations:

-   **Minimize the number of open snapshots per datastore**. Multiple open snapshots on the same datastore are sometimes unavoidable, but the cumulative effect can be bad. Keep this in mind when designing datastores, deploying VMs and creating backup and replication schedules. Leveraging backup by datastore can be useful in this scenario.
    
-   **Consider snapshot impact during job scheduling.** When possible, schedule backups and replication jobs during periods of low activity. Leveraging the backup window functionality can keep long-running jobs from running during production. See the corresponding setting on the **schedule** tab of the job wizard.
    
-   **Use the vStorage APIs for Array Integration (VAAI) where available.** VAAI can offer significant benefits:
    
    -   Hardware Lock Assist improves the granularity of locking required during snapshot growth operations, as well as other metadata operations, thus lowering the overall SAN overhead when snapshots are open.
    -   VAAI offers native snapshot offload support and should provide significant benefits once vendors release full support.
    -   VAAI is sometimes also available as an ESXi plugin from the NFS storage vendor.
-   **Design datastores with enough IOPS to support snapshots.** Snapshots create additional I/O load and thus require enough I/O headroom to support the added load. This is especially important for VMs with moderate to heavy transactional workloads. Creating snapshots in VMware vSphere will cause the snapshot files to be placed on the same VMFS volumes as the individual VM disks. This means that a large VM, with multiple VMDKs on multiple datastores, will spread the snapshot I/O load across those datastores. However, it actually limits the ability to design and size a dedicated datastore for snapshots, so this has to be factored in the overall design.
    
    **Note:** This is the default behavior that can be changed as explained in [VMware KB Article 1002929](https://kb.vmware.com/s/article/1002929).
    
-   **Allocate enough space for snapshots.** VMware vSphere by default puts the snapshot VMDK on the same datastore with the parent VMDK. If a VM has virtual disks on multiple datastores, each datastore must have enough space to hold the snapshots for their volume. Take into consideration the possibility of running multiple snapshots on a single datastore. According to the best practices, it is strongly recommended to have 10% free space within a datastore for a general use VM, and at least 20% free space within a datastore for a VM with high change rate (SQL server, Exchange server, and others).
    
    **Note:** This is the default behavior that can be changed as explained in [VMware KB Article 1002929](https://kb.vmware.com/s/article/1002929).
    
-   **Watch for low disk space warnings.** Veeam Backup & Replication warns you when there is not enough space for snapshots. The default threshold value for production datastores is 10% . Keep in mind that you must increase this value significantly if using very large datastores (up to 62TB). You configure a percentage-based threshold in the [notifications section of the general options](https://helpcenter.veeam.com/docs/backup/vsphere/global_notifications.html).
    
    **Tip:** Use the [Veeam ONE Configuration Assessment Report](https://helpcenter.veeam.com/docs/one/reporter/vm_configuration_assessment.html) to detect datastores with less than 10% of free disk space available for snapshot processing.
    
-   **Tune heartbeat thresholds in failover clusters.** Some application clustering software can detect snapshot commit processes as failure of the cluster member and failover to other cluster members. Coordinate with the application owner and increase the cluster heartbeat thresholds. A good example is Exchange DAG heartbeat. For details, see [Veeam KB Article 1744](https://www.veeam.com/kb1744).
    

## [](https://bp.veeam.com/vbr/3_Build_structures/B_Other/vsphere.html#considerations-for-nfs-datastores)Considerations for NFS datastores

Backup from NFS datastores involves some additional consideration, when the **virtual appliance (hot-add)** transport mode is used. Hot-add takes priority in the intelligent load balancer, when Backup from Storage Snapshots or Direct NFS are unavailable.

Datastores formatted with the VMFS file system have native capabilities to determine which cluster node is the owner of a particular VM, while VMs running on NFS datastores rely on the LCK file that resides within the VM folder.

During hot-add operations, the host on which the hot-add proxy resides will temporarily take ownership of the VM by changing the contents of the LCK file. This may cause significant additional “stuns” to the VM. Under certain circumstances, the VM may even end up being unresponsive. The issue is recognized by VMware and documented in [VMware KB Article 2010953](https://kb.vmware.com/s/article/2010953).

**Note**: This issue does not affect Veeam Direct NFS as part of Veeam Direct Storage Access processing modes and Veeam Backup from Storage Snapshots on NetApp NFS datastores. We highly recommend you use one of these two backup modes to avoid problems.

In hyperconverged infrastructures (HCI), it is preferred to keep the datamover close to the backed up VM to avoid stressing the storage replication network with backup traffic. If the HCI is providing storage via the NFS protocol (such as Nutanix), it is possible to force a Direct NFS data mover on the same host using the following registry key:

-   Path: `HKEY_LOCAL_MACHINE\SOFTWARE\Veeam\Veeam Backup and Replication`
-   Key: `EnableSameHostDirectNFSMode`
-   Type: `REG_DWORD`
-   Default value: `0` _(disabled)_
    
    **Value = `1`** - Preferred Same Host. When a Direct NFS proxy is available on the same host, Veeam Backup & Replication will leverage it. If the Direct NFS proxy is busy, Veeam Backup & Replication will use another Direct NFS proxy. If it fails to find one it will fall back to a virtual appliance (hot-add) and finally network mode (NBD).
    
    This mode is _not recommended for Nutanix_, if there is no Direct NFS proxy on the same host as the VM, it falls back to network mode (NBD). If it is busy or unavailable, it won’t use another hot-add proxy, it will instead switch to NBD mode.
    
    **Value = `2`** - Same Host Direct NFS mode. Recommended for Nutanix. If there is no Direct NFS proxy on the same host as the VM, it fails back to network mode (NBD). This mode will not fail back to a Hot-Add proxy.
    

To give preference to a backup proxy located on the same host as the VMs, you can create the following registry key:

-   Path: `HKEY_LOCAL_MACHINE\SOFTWARE\Veeam\Veeam Backup and Replication`
-   Key: `EnableSameHostHotAddMode`
-   Type: `REG_DWORD`
-   Default value: `0` _(disabled)_
    
    **Value = `1`** – When proxy A is available on the same host, Veeam Backup & Replication will leverage it. If proxy A is busy, Veeam Backup & Replication will wait for its availability; if it becomes unavailable, another Hot-Add proxy (proxy B) will be used, if that fails, it falls back to network (NBD) mode.
    
    **Value = `2`** - When proxy A is available on the same host, Veeam Backup & Replication will leverage it. If proxy A is busy, Veeam Backup & Replication will wait for its availability; if it becomes unavailable, Veeam Backup & Replication will switch to NBD mode.
    

This solution will typically result in deploying a significant number of proxy servers, and may not be preferred in some environments. For such environments, it is recommended switching to Network mode (NBD) if Direct NFS backup mode can not be used.

## [](https://bp.veeam.com/vbr/3_Build_structures/B_Other/vsphere.html#vcenter-server-connection-count)vCenter server connection count

If you attempt to start a large number of parallel Veeam backup jobs (typically, more than 100, with some thousand VMs in them) leveraging the VMware VADP backup API or if you use Network Transport mode (NBD) you may face two kinds of limitations:

-   Limitation on vCenter SOAP connections
-   Limitation on NFC buffer size on the ESXi side

All backup vendors that use VMware VADP implement the VMware VDDK kit in their solutions. This kit provides standard API calls for the backup vendor, and helps to read and write data. During backup operations, all vendors have to deal with two types of connections: the VDDK connections to vCenter Server and ESXi, and vendor’s own connections. The number of VDDK connections may vary for different VDDK versions.

If you try to back up thousands of VMs in a very short time frame, you can run into the SOAP session count limitation. This limit is 2,000 concurrent sessions or 640 concurrent requests, but can be increased if required.

Veeam’s scheduling component does not keep track of the connection count. For this reason, it is recommended to periodically check the number of vCenter Server connections within the main backup window to see if you can possibly run into a bottleneck in future, and increase the limit values on demand only.

You can also optimize the ESXi network (NBD) performance by increasing the NFC buffer size from 16384 to 32768MB (or conservatively higher) and reducing the cache flush interval from 30s to 20s. After increasing the NFC buffer setting, you can increase the following Veeam Registry setting to add addition Veeam NBD connections:

-   Path: `HKLM\SOFTWARE\VeeaM\Veeam Backup and Replication`
-   Key: `ViHostConcurrentNfcConnections`
-   Type: `REG_DWORD`
-   Default value: `7` _(disabled)_

Be careful with this setting. If the buffer vs. NFC Connection ratio is too aggressive, jobs may fail.

## [](https://bp.veeam.com/vbr/3_Build_structures/B_Other/vsphere.html#veeam-infrastructure-cache)Veeam infrastructure cache

“Veeam Broker Service” Windows service caches directly into memory an inventory of the objects in a vCenter hierarchy. The collection is very efficient as it uses memory and it is limited to just the data needed by Veeam Backup & Replication.

This cache is stored into memory, so at each restart of the Veeam services its content is lost; this is not a problem as the initial retrieval of data is done as soon as the Veeam server is restarted. From here on, Veeam “subscribed” to a specific API available in vSphere, so that it can receive in “push” mode any change to the environment, without the need anymore to do a full search on the vCenter hierarchy during every operation.

![](https://bp.veeam.com/vbr/3_Build_structures/B_Other/media/interaction-vmw-infrastructure_cache_1_1.png)

The most visible effects of using this service are:

-   The load against vCenter SOAP connection is heavily reduced, as we have now one single connection per Veeam server instead of each job running a new query against vCenter;
-   Every navigation operation of the vSphere hierarchy is instantaneous;
-   The initialisation of every job is almost immediate, as now the Infrastructure Cache service creates a copy in memory of its cache dedicated to each job, instead of the Veeam Manager service completing a full search against vCenter:

![](https://bp.veeam.com/vbr/3_Build_structures/B_Other/media/interaction-vmw-infrastructure_cache_2.png)

No special memory consideration needs to be done for the Infrastructure Cache, as its requirements are really low: as an example, the cache for an environment with 12 hosts and 250 VMs is only 120MB, and this number does not grow linearly since most of the size is fixed even for smaller environments.

___

## [](https://bp.veeam.com/vbr/3_Build_structures/B_Other/vsphere.html#references)References

-   [VMware KB Article 1002929](https://kb.vmware.com/s/article/1002929)
-   [Notification options](https://helpcenter.veeam.com/docs/backup/vsphere/global_notifications.html)
-   [Veeam ONE Configuration Assessment Report](https://helpcenter.veeam.com/docs/one/reporter/vm_configuration_assessment.html)
-   [Veeam KB Article 1744](https://www.veeam.com/kb1744)
-   [VMware KB Article 2010953](https://kb.vmware.com/s/article/2010953)
-   [Specifying I/O Settings](https://helpcenter.veeam.com/docs/backup/vsphere/options_parallel_processing.html)
-   [Required Permissions for VMware vSphere](https://helpcenter.veeam.com/docs/backup/permissions/)

___
