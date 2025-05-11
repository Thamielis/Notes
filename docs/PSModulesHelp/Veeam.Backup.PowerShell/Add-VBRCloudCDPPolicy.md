Add-VBRCloudCDPPolicy
---------------------

### Synopsis
Creates a cloud ?DP policy.

---

### Description

This cmdlet creates a cloud ?DP policy.

NOTE:

The cmdlet will create a cloud CDP policy in the disabled state unless you enable a policy schedule. Run the Enable-VBRCDPPolicy cmdlet to enable the policy.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRCloudServer](Get-VBRCloudServer)

* [Get-VBRCloudDatastore](Get-VBRCloudDatastore)

---

### Examples
> Example - Creating Cloud CDP Policy

$vm = Find-VBRViEntity -Name "DB server"
$host = Get-VBRCloudServer
$datastore = Get-VBRCloudDatastore
Add-VBRCloudCDPPolicy -Entity $vm -Server $host[3] -Datastore $datastore[3] -Name "DB_replication"
This example shows how to create the DB_replication cloud CDP policy.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable. 2. Run the Get-VBRCloudServer cmdlet. Save the result to the $host variable.
The Get-VBRCloudServer cmdlet will return an array of hosts. Mind the ordinal number of the necessary host (in our example, it is the fourth host in the array).
3. Run the Get-VBRCloudDatastore cmdlet. Save the result to the $datastore variable.
The Get-VBRCloudDatastore cmdlet will return an array of datastores. Mind the ordinal number of the necessary datastore (in our example, it is the fourth datastore in the array).
4.	Run the Add-VBRCloudCDPPolicy cmdlet. Specify the following settings:
• Set the $vm variable as the Entity parameter value.
• Set the $host variable as the Server parameter value.
• Set the $datastore variable as the Datastore parameter value.
• Specify the Name parameter value.

---

### Parameters
#### **Datastore**
Returns datastores or disk volumes allocated under cloud resources. The cmdlet will keep cloud CDP replicas in this datastore. Accepts the VBRCloudDatastore object. To get this object, run the Get-VBRCloudDatastore cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRCloudDatastore]`|true    |named   |False        |

#### **Description**
Specifies a description of a cloud CDP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DiskType**
Specifies the format that will be used to restore replica disk files:
* Source: the restored replica disks will be the same format as source.
* Thick: the restored replica disks will be thick.
* Thin: the restored replica disks will be thick.
Default: Source.
Valid Values:

* Source
* Thick
* Thin
* ThickEagerZeroed

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[EDiskCreationMode]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs you want to add to the policy. Accepts the IViItem[] object. To create this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IViItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will create a cloud CDP policy without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GuestProcessingOptions**
Specifies guest processing settings of a cloud CDP policy. Accepts the VBRReplicaApplicationProcessingOptions object. To create this object, run the New-VBRReplicaApplicationProcessingOptions cmdlet.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRReplicaApplicationProcessingOptions]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name you want to assign to a cloud CDP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings of a cloud CDP policy.
Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping.
Specifies an array of production VMs that you want to replicate using replica mapping.
The cloud CDP policy will map this VM to the VM in the disaster recovery site.
Use the ReplicaVM parameter to specify the replicated VM on the disaster recovery site.
Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping.
Specifies an array of VMs in the disaster recovery site. The cmdlet will map the production VM to this VM.
Use the OriginalVM parameter to specify the production VM.
Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRViCloudVM[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding.
Specifies a backup repository that keeps a full backup of VMs that you want to replicate.
Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RetentionOptions**
Specifies retention settings of a cloud CDP policy.
Accepts the VBRCDPPolicyRetentionOptions object. To create this object, run the New-VBRCDPPolicyRetentionOptions cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCDPPolicyRetentionOptions]`|false   |named   |False        |

#### **Server**
Specifies a cloud host allocated by a service provider through the hardware plan. The cloud CDP replicas will be created in this host.
Accepts the VBRCloudServer object. To get this object, run the Get-VBRCloudServer cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRCloudServer]`|true    |named   |False        |

#### **SourceNetwork**
For network mapping.
Specifies an array of production networks to which the VMs added to a cloud CDP policy are connected.
Note: The number of source networks must match the number of target networks.
Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the array of VMware CDP source proxies added to the backup infrastructure. The cmdlet will use these proxies to transfer data.
Default: Automatic selection.
Accepts the VBRCDPProxy[] object. To get this object, run the Get-VBRCDPProxy cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating. This name will be used to register the replicated VM on the target server.
Note: If you omit this parameter, the replicated VMs will get the '_replica' suffix.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For network mapping.
Specifies an array of networks in the disaster recovery site. VMs that are replicated with the cloud CDP policy will be connected to these networks.
Note: The number of source networks must match the number of target networks.
Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCloudServerNetworkInfo[]]`|false   |named   |False        |

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
Add-VBRCloudCDPPolicy -Datastore <VBRCloudDatastore> [-Description <String>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] -Entity <IViItem[]> [-Force] [-GuestProcessingOptions 
```
```PowerShell
<VBRReplicaApplicationProcessingOptions>] [-HighPriority] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-OriginalVM <CViVmItem[]>] [-ReplicaVM <VBRViCloudVM[]>] [-RepositorySeed 
```
```PowerShell
<CBackupRepository>] [-RetentionOptions <VBRCDPPolicyRetentionOptions>] -Server <VBRCloudServer> [-SourceNetwork <VBRViNetworkInfo[]>] [-SourceProxy <VBRCDPProxy[]>] [-Suffix <String>] [-TargetNetwork 
```
```PowerShell
<VBRCloudServerNetworkInfo[]>] [<CommonParameters>]
```
