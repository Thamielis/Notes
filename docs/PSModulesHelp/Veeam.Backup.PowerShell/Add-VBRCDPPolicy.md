Add-VBRCDPPolicy
----------------

### Synopsis
Creates CDP policies.

---

### Description

This cmdlet creates CDP policies.
Note: The cmdlet will create a CDP policy in the disabled state unless you enable a policy schedule. Run the Enable-VBRCDPPolicy cmdlet to enable the policy.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Example 1. Creating CDP Policy that Replicates VM to Cluster

$vm = Find-VBRViEntity -Name "WinSrv05"
$cluster = Find-VBRViEntity -Name "CDP"
Add-VBRCDPPolicy -Entity $vm -TargetCluster $cluster -Name "SQL09" -Description "Microsoft SQL database replica"
This example shows how to create the SQL09 CDP policy that will replicate the WinSrv05 VM to the CDP cluster. The description of the policy is set to Microsoft SQL database replica.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $cluster variable.
3. Run the Add-VBRCDPPolicy cmdlet. Set the $vm variable as the Entity parameter value. Set the $cluster variable as the TargetCluster parameter value.
> Example 2. Creating CDP Policy that Replicates VM to ESXi Host

$vm = Find-VBRViEntity -Name "DevOps Production"
$host = Find-VBRViEntity -Name "esx05.tech.local"
Add-VBRCDPPolicy -Entity $vm -TargetHost $host -Name "DevOps61021" -Description "DevOpsVM replica"
This example shows how to create the DevOps61021 CDP policy that will replicate the DevOps Production VM to the esx05.tech.local VMware host. The description of the policy is set to DevOpsVM replica.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $host variable.
3. Run the Add-VBRCDPPolicy cmdlet. Specify the following settings:
- Set the $vm variable as the Entity parameter value.
- Set the $host variable as the TargetHost parameter value.
- Specify the Name parameter value.
- Specify the Description parameter value.

---

### Parameters
#### **CompressionLevel**
Specifies the compression level of the replicated data:
* None: use this option if you do not want to enable data compression.
* Dedupe-friendly: use this option to set a dedupe-friendly compression level.
* Optimal: use this option to set an optimal compression level.
* High: use this option to set a high compression level.
* Extreme: use this option to set an extreme compression level.
Default: Optimal.
Valid Values:

* None
* DedupeFriendly
* Optimal
* High
* Extreme

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRCompressionLevel]`|false   |named   |False        |

#### **Datastore**
Specifies a datastore to which you want to replicate VMs.
Accepts the VBRViDatastoreBase object. To get this object, run the Find-VBRViDatastore cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **Description**
Specifies a description for a CDP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DiskType**
Specifies the type of disks for replicas:
* Source: use this option to create replica disks of the same type as the source VM.
* Thick: use this option to create thick replica disks.
* Thin: use this option to create thin replica disks.
* ThickEagerZeroed: use this option to create thick eager zeroed replica disks.
Valid Values:

* Source
* Thick
* Thin
* ThickEagerZeroed

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[EDiskCreationMode]`|false   |named   |False        |

#### **Entity**
Specifies an array of VMs that you want to add to a CDP policy.
Accepts the IViItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IViItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Exclusions**
Specifies an array of VMs that you want to exclude from a CDP policy processing.
Accepts the IViItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IViItem[]]`|false   |named   |False        |

#### **Folder**
Specifies a folder to which you want to replicate VMs.
Accepts the CViFolderItem object. To get this object, run the Find-VBRViEntity cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **GuestProcessingOptions**
Specifies guest processing options of a CDP policy. Accepts the VBRReplicaApplicationProcessingOptions object. To create this object, run the New-VBRReplicaApplicationProcessingOptions cmdlet.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRReplicaApplicationProcessingOptions]`|false   |named   |False        |

#### **Name**
Specifies a name for a CDP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings of a CDP policy.
Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping.
Specifies an array of production VMs that you want to replicate using replica mapping.
The CDP policy will map this VM to the VM in the disaster recovery site.
Use the ReplicaVM parameter to specify the replicated VM on the disaster recovery site.
Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **ReIpRule**
Specifies re-IP rules.
Accepts the VBRViReplicaReIpRule object. To get this object, run the Get-VBRViReplicaReIpRule cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRViReplicaReIpRule[]]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping.
Specifies an array VM on the disaster recovery site. The cmdlet will map the production VM to this VM.
Use the OriginalVM parameter to specify the production VM.
Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding.
Specifies a backup repository that keeps a full backup of VMs that you want to replicate.
Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **ResourcePool**
Specifies a resource pool to which you want to replicate VMs.
Accepts the CViResourcePoolItem object. To get this object, run the Find-VBRViEntity cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RetentionOptions**
Specifies retention settings of a CDP policy.
Accepts the VBRCDPPolicyRetentionOptions object. To create this object, run the New-VBRCDPPolicyRetentionOptions cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCDPPolicyRetentionOptions]`|false   |named   |False        |

#### **SourceNetwork**
For network mapping.
Specifies an array of production networks to which the VMs added to a CDP policy are connected.
Note: The number of source networks must match the number of target networks.
Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the proxy in the production site that you want to assign to the CDP policy.
Default: Automatic selection.
Accepts the VBRCDPProxy[] object. To get this object, run the Get-VBRCDPProxy cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **StoragePolicy**
Specifies a VMware storage policy that must be applied to the replica virtual disks.
Accepts the VBRViStoragePolicy object. To get this object, run the Find-VBRViStoragePolicy cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that the cmdlet will add to the name of VMs replicated with CDP policies.
Default: "_replica".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetCluster**
Specifies the target cluster. The cmdlet will replicate VMs to this cluster.
Accepts the CViClusterItem object. To get this object, run the Find-VBRViEntity cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CViClusterItem]`|true    |named   |False        |

#### **TargetHost**
Specifies the target ESXi host. The cmdlet will replicate VMs to this ESXi host.
Accepts the CEsxItem object. To get this object, run the Find-VBRViEntity cmdlet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[CEsxItem]`|true    |named   |False        |

#### **TargetNetwork**
For network mapping.
Specifies an array of networks in the disaster recovery site. VMs that are replicated with the CDP policy will be connected to these networks.
Note: The number of source networks must match the number of target networks.
Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **TargetProxy**
Specifies the target proxy that you want to assign to the CDP policy.
Default: Automatic selection.
Accepts the VBRCDPProxy[] object. To get this object, run the Get-VBRCDPProxy cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.IViItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCDPPolicy [-CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme}] [-Datastore <VBRViDatastoreBase>] [-Description <String>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] -Entity 
```
```PowerShell
<IViItem[]> [-Exclusions <IViItem[]>] [-Folder <CViFolderItem>] [-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-OriginalVM 
```
```PowerShell
<CViVmItem[]>] [-ReIpRule <VBRViReplicaReIpRule[]>] [-ReplicaVM <CViVmItem[]>] [-RepositorySeed <CBackupRepository>] [-ResourcePool <CViResourcePoolItem>] [-RetentionOptions <VBRCDPPolicyRetentionOptions>] 
```
```PowerShell
[-SourceNetwork <VBRViNetworkInfo[]>] [-SourceProxy <VBRCDPProxy[]>] [-StoragePolicy <VBRViStoragePolicy>] [-Suffix <String>] -TargetCluster <CViClusterItem> [-TargetNetwork <VBRViNetworkInfo[]>] [-TargetProxy 
```
```PowerShell
<VBRCDPProxy[]>] [<CommonParameters>]
```
```PowerShell
Add-VBRCDPPolicy [-CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme}] [-Datastore <VBRViDatastoreBase>] [-Description <String>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] -Entity 
```
```PowerShell
<IViItem[]> [-Exclusions <IViItem[]>] [-Folder <CViFolderItem>] [-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-OriginalVM 
```
```PowerShell
<CViVmItem[]>] [-ReIpRule <VBRViReplicaReIpRule[]>] [-ReplicaVM <CViVmItem[]>] [-RepositorySeed <CBackupRepository>] [-ResourcePool <CViResourcePoolItem>] [-RetentionOptions <VBRCDPPolicyRetentionOptions>] 
```
```PowerShell
[-SourceNetwork <VBRViNetworkInfo[]>] [-SourceProxy <VBRCDPProxy[]>] [-StoragePolicy <VBRViStoragePolicy>] [-Suffix <String>] -TargetHost <CEsxItem> [-TargetNetwork <VBRViNetworkInfo[]>] [-TargetProxy 
```
```PowerShell
<VBRCDPProxy[]>] [<CommonParameters>]
```
