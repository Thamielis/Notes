Set-VBRvCDCloudCDPPolicy
------------------------

### Synopsis
Modifies a VDC ?DP policy.

---

### Description

This cmdlet modifies a VDC ?DP policy.

---

### Related Links
* [Get-VBRCDPPolicy](Get-VBRCDPPolicy)

* [Get-VBRCDPProxy](Get-VBRCDPProxy)

---

### Examples
> Modifying Source Proxies for VCD CDP Policy

$policy = Get-VBRCDPPolicy -Name "DB_replication"
$proxy = Get-VBRCDPProxy -Name "Proxy_05"
Set-VBRvCDCloudCDPPolicy -Policy $policy -SourceProxy $proxy
This example shows how to change the VMware CDP source proxies for the DB_replication VCD CDP policy. The cmdlet will set the Proxy_05 to transfer the replica data.

Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRCDPProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
3. Run the Set-VBRvCDCloudCDPPolicy cmdlet. Set the $policy variable as the Policy parameter value. Set the $proxy variable as the SourceProxy parameter value.

---

### Parameters
#### **Description**
Specifies a description of a VDC ?DP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableApplicationProcessingOptions**
Enables guest processing options for a VDC CDP policy. Use the GuestProcessingOptions parameter to specify the guest processing settings.

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
Enables replica seeding. To specify replica seeding repository settings, use the RepositorySeed parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs you want to add to a VDC ?DP policy. Accepts the IViItem[] object. To create this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IViItem[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will create a VDC CDP policy without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GuestProcessingOptions**
Specifies guest processing options of a VDC CDP policy. Accepts the VBRReplicaApplicationProcessingOptions object. To create this object, run the New-VBRReplicaApplicationProcessingOptions cmdlet.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRReplicaApplicationProcessingOptions]`|false   |named   |False        |

#### **HighPriority**
Defines that Veeam Backup & Replication will prioritize this job higher than other similar jobs and will allocate resources to it in the first place.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name you want to assign to a VDC ?DP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings of a VDC CDP policy. Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OrganizationvDC**
Specifies the cloud organization VDC. The VDC ?DP policy will store replicas in the selected organization VDC. Accepts the VBRvCDCloudOrganizationvDC object. To get this object, run the Get-VBRvCDCloudOrganizationvDC cmdlet.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRvCDCloudOrganizationvDC]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping. Specifies an array of production VMs that you want to replicate using replica mapping. The VDC CDP policy will map this VM to the VM in the disaster recovery site. Use the ReplicaVM parameter to specify the replicated VM on the disaster recovery site. Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **Policy**
Specifies a cloud ?DP policy that you want to modify. Accepts the VBRCloudCDPPolicy object. To get this object, run the Get-VBRCDPPolicy cmdlet.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRvCDCloudCDPPolicy]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ReplicaVM**
For replica mapping. Specifies an array VM in the disaster recovery site. The cmdlet will map the production VM to this VM. Use the OriginalVM parameter to specify the production VM. Accepts the VBRvCDCloudVM[] object. To get this object, run the Get-VBRvCDCloudVM cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRvCDCloudVM[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding. Specifies a backup repository that keeps a full backup of VMs that you want to replicate. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RetentionOptions**
Specifies retention settings of a VDC CDP policy. Accepts the VBRCDPPolicyRetentionOptions object. To create this object, run the New-VBRCDPPolicyRetentionOptions cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCDPPolicyRetentionOptions]`|false   |named   |False        |

#### **SourceNetwork**
For network mapping. Specifies an array of production networks to which the VMs added to a VDC CDP policy are connected. Note: The number of source networks must match the number of target networks. Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Used for building a replica from backup files. Specifies the backup repository that will be used to read the VM data from the already existing backup chain. Note: You cannot specify a cloud repository. Accepts the VBRCDPProxy[] object. To get this object, run the Get-VBRCDPProxy cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the vCD cloud storage policy. The VDC ?DP policy will create replicas according to this storage policy settings. Accepts the VBRvCDCloudStoragePolicy object. To get this object, run the Get-VBRvCDCloudStoragePolicy cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRvCDCloudStoragePolicy]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating. This name will be used to register the replicated VM on the target server. Note: If you omit this parameter, the replicated VMs will get the '_replica' suffix.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For network mapping. Specifies an array of networks in the disaster recovery site. VMs that are replicated with the VDC CDP policy will be connected to these networks. Note: The number of source networks must match the number of target networks. Accepts the VBRvCDCloudNetworkInfo[] object. To get this object, run the Get-VBRvCDCloudNetworkInfo cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRvCDCloudNetworkInfo[]]`|false   |named   |False        |

#### **vApp**
Specifies the vApp container. The VDC ?DP policy will store the replicas in the selected container. Note: If you do not specify the vApp container, the job will store the replicas in the default vApp. Accepts the VBRvCDCloudvApp object. To get this object, run the Get-VBRvCDCloudvApp cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRvCDCloudvApp]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRvCDCloudCDPPolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRvCDCloudCDPPolicy [-Description <String>] [-EnableApplicationProcessingOptions] [-EnableNetworkMapping] [-EnableReplicaMapping] [-EnableReplicaSeeding] [-Entity <IViItem[]>] [-Force] 
```
```PowerShell
[-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-HighPriority] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-OrganizationvDC <VBRvCDCloudOrganizationvDC>] [-OriginalVM 
```
```PowerShell
<CViVmItem[]>] -Policy <VBRvCDCloudCDPPolicy> [-ReplicaVM <VBRvCDCloudVM[]>] [-RepositorySeed <CBackupRepository>] [-RetentionOptions <VBRCDPPolicyRetentionOptions>] [-SourceNetwork <VBRViNetworkInfo[]>] 
```
```PowerShell
[-SourceProxy <VBRCDPProxy[]>] [-StoragePolicy <VBRvCDCloudStoragePolicy>] [-Suffix <String>] [-TargetNetwork <VBRvCDCloudNetworkInfo[]>] [-vApp <VBRvCDCloudvApp>] [<CommonParameters>]
```
