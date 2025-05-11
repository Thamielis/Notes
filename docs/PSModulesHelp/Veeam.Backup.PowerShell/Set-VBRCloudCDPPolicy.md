Set-VBRCloudCDPPolicy
---------------------

### Synopsis
Modifies a cloud ?DP policy.

---

### Description

This cmdlet modifies a cloud ?DP policy.

To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters you omit will remain unchanged.

---

### Related Links
* [Get-VBRCDPPolicy](Get-VBRCDPPolicy)

* [Get-VBRCDPProxy](Get-VBRCDPProxy)

---

### Examples
> Example - Modifying Source Proxies for Cloud CDP Policy

$policy = Get-VBRCDPPolicy -Name "DB_replication"
$proxy = Get-VBRCDPProxy -Name "Proxy_05"
Set-VBRCloudCDPPolicy -Policy $policy -SourceProxy $proxy
This example shows how to change the VMware CDP source proxies for the DB_replication cloud CDP policy. The cmdlet will set the Proxy_05 to transfer the replica data.

Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRCDPProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
3. Run the Set-VBRCloudCDPPolicy cmdlet. Set the $policy variable as the Policy parameter value. Set the $proxy variable as the SourceProxy parameter value.

---

### Parameters
#### **Datastore**
Returns datastores or disk volumes allocated under cloud resources. The cmdlet will keep cloud CDP replicas in this datastore. Accepts the VBRCloudDatastore object.  To get this object, run the Get-VBRCloudDatastore cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRCloudDatastore]`|false   |named   |False        |

#### **Description**
Specifies a description of a policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableApplicationProcessingOptions**
Enables guest processing settings for a cloud CDP policy.
Use the GuestProcessingOptions parameter to specify the guest processing settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableNetworkMapping**
Enables network mapping. To set the network mapping rules, use the following parameters:
* SourceNetwork
* TargetNetwork

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableReplicaMapping**
Enables replica mapping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableReplicaSeeding**
Enables replica seeding.
To specify replica seeding repository settings, use the RepositorySeed parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs you want to add to the policy.
Accepts the IViItem[] object. To create this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IViItem[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will create a cloud CDP policy without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GuestProcessingOptions**
Specifies guest processing settings of a cloud CDP policy.
Accepts the VBRReplicaApplicationProcessingOptions object. To create this object, run the New-VBRReplicaApplicationProcessingOptions cmdlet.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRReplicaApplicationProcessingOptions]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to a policy.

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

#### **Policy**
Specifies a cloud ?DP policy that you want to modify.
Accepts the VBRCloudCDPPolicy object. To get this object, run the Get-VBRCDPPolicy cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRCloudCDPPolicy]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ReplicaVM**
For replica mapping.
Specifies an array VM in the disaster recovery site. The cmdlet will map the production VM to this VM.
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
Specifies a cloud host allocated by a service provider through the hardware plan. The cloud CDP replicas will be created in this host. Accepts the VBRCloudServer object.  To get this object, run the Get-VBRCloudServer cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRCloudServer]`|false   |named   |False        |

#### **SourceNetwork**
For network mapping.
Specifies an array of production networks to which the VMs added to a cloud CDP policy are connected.
Note: The number of source networks must match the number of target networks.
Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies an array of VMware CDP source proxies added to the backup infrastructure. The cmdlet will use these proxies to transfer data.
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
Veeam.Backup.PowerShell.Infos.VBRCloudCDPPolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudCDPPolicy [-Datastore <VBRCloudDatastore>] [-Description <String>] [-EnableApplicationProcessingOptions] [-EnableNetworkMapping] [-EnableReplicaMapping] [-EnableReplicaSeeding] [-Entity <IViItem[]>] 
```
```PowerShell
[-Force] [-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-HighPriority] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-OriginalVM <CViVmItem[]>] -Policy 
```
```PowerShell
<VBRCloudCDPPolicy> [-ReplicaVM <VBRViCloudVM[]>] [-RepositorySeed <CBackupRepository>] [-RetentionOptions <VBRCDPPolicyRetentionOptions>] [-Server <VBRCloudServer>] [-SourceNetwork <VBRViNetworkInfo[]>] 
```
```PowerShell
[-SourceProxy <VBRCDPProxy[]>] [-Suffix <String>] [-TargetNetwork <VBRCloudServerNetworkInfo[]>] [<CommonParameters>]
```
