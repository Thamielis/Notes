Set-VBRCDPPolicy
----------------

### Synopsis
Modifies CDP policies.

---

### Description

This cmdlet modifies CDP policies.

---

### Related Links
* [Get-VBRCDPPolicy](Get-VBRCDPPolicy)

* [Get-VBRCDPProxy](Get-VBRCDPProxy)

---

### Examples
> Example 1. Modifying CDP Policy Excluded VMs

$cdppolicy = Get-VBRCDPPolicy -Name "VM079"
$exludedvm = Find-VBRViEntity -Name "DB01, DB02, DB03"
Set-VBRCDPPolicy -Policy $cdppolicy -Exclusions $exludedvm
This example shows how to exclude the DB01, DB02, DB03 VMs from the VM079 CDP policy processing.

Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $cdppolicy variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $exludedvm variable.
3. Run the Set-VBRCDPPolicy cmdlet. Set the $cdppolicy variable as the Policy parameter value. Set the $exludedvm variable as the Exclusions parameter value.
> Example 2. Modifying CDP Policy Source and Target Proxies

$cdppolicy = Get-VBRCDPPolicy -Name "VM079"
$targetproxy = Get-VBRCDPProxy -Name "WinSrv09"
$sourceproxy = Get-VBRCDPProxy -Name "WinSrv04"
Set-VBRCDPPolicy -Policy $cdppolicy -TargetProxy $targetproxy -SourceProxy $sourceproxy
This example shows how to assign the WinSrv09 machine as the target proxy and the WinSrv04 machine as the source proxy  to the VM079 CDP policy.

Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $cdppolicy variable.
2. Run the Get-VBRCDPProxy cmdlet. Specify the Name parameter value. Save the result to the $targetproxy variable.
3. Run the Get-VBRCDPProxy cmdlet. Specify the Name parameter value. Save the result to the $sourceproxy variable.
4. Run the Set-VBRCDPPolicy cmdlet. Specify the following settings:
- Set the $cdppolicy variable as the Policy parameter value.
- Set the $targetproxy variable as the TargetProxy parameter value.
- Set the $sourceproxy variable as the SourceProxy parameter value.

---

### Parameters
#### **CompressionLevel**
Note: The parameter is not supported and will be deprecated.
Specifies the compression level of the replicated data:
� None: use this option if you do not want to enable data compression.
� Dedupe-friendly: use this option to set a dedupe-friendly compression level.
� Optimal: use this option to set an optimal compression level.
� High: use this option to set a high compression level.
� Extreme: use this option to set an extreme compression level.
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
Specifies a description for the CDP policy. The cmdlet will replace a CDP policy description with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableApplicationProcessingOptions**
Enables application processing option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableNetworkMapping**
Enables network mapping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableReplicaMapping**
Enables the replica mapping option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableReplicaSeeding**
Enables the replica seeding option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies an array of VMs that you want to add to a CDP policy.
Accepts the IViItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IViItem[]]`|false   |named   |False        |

#### **Exclusions**
Specifies an array of VMs that you want to exclude from the CDP policyv processing. Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

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
Specifies a name for the CDP policy. The cmdlet will replace a CDP policy name with this name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification options of a CDP policy. Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OriginalVM**
For replica mapping. Specifies a production VM that you want to replicate using replica mapping. The CDP policy will map this VM to the VM on the disaster recovery site. Use the ReplicaVM parameter to specify the replica VM on the disaster recovery site. Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **Policy**
Specifies a CDP policy that you want to modify.
Accepts the VBRCDPPolicyBase[] object. To get this object, run the Get-VBRCDPPolicy cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRCDPPolicy]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ReIpRule**
Specifies re-IP rules.
Accepts the VBRViReplicaReIpRule object. To get this object, run the Get-VBRViReplicaReIpRule cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRViReplicaReIpRule[]]`|false   |named   |False        |

#### **ReplicaVM**
For replica mapping. Specifies a VM on the disaster recovery site. The cmdlet will map the production VM to this VM, and the CDP policy will replicate data to this VM. Use the OriginalVM parameter to specify the production VM. Accepts the CViVmItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CViVmItem[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding. Specifies a backup repository that keeps a full backup of a VM that you want to replicate. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **ResourcePool**
Specifies a resource pool to which you want to replicate.
Accepts the CViResourcePoolItem object. To get this object, run the Find-VBRViEntity cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RetentionOptions**
Specifies pre-job and post-job script options of a CDP policy. Accepts the VBRCDPPolicyRetentionOptions object. To create this object, run the New-VBRCDPPolicyRetentionOptions cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCDPPolicyRetentionOptions]`|false   |named   |False        |

#### **SourceNetwork**
For network mapping.
Specifies an array of production networks to which the VMs in the CDP policy are connected.
Note: The number of the source and the target networks must be the same.
Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies the source proxy that you want to assign to the CDP policy.
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
Specifies a suffix that the cmdlet will add to the name of the VM the you want to replicate. This name will be used to register the replicated VM on the target server. Default: "_replica".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For network mapping.
Specifies an array of networks in the disaster recovery site. The replicated VMs will be connected to these networks.
Note: The number of the source and the target networks must be the same.
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
Veeam.Backup.PowerShell.Infos.VBRCDPPolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCDPPolicy [-CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme}] [-Datastore <VBRViDatastoreBase>] [-Description <String>] [-EnableApplicationProcessingOptions] [-EnableNetworkMapping] 
```
```PowerShell
[-EnableReplicaMapping] [-EnableReplicaSeeding] [-Entity <IViItem[]>] [-Exclusions <IViItem[]>] [-Folder <CViFolderItem>] [-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-Name <String>] 
```
```PowerShell
[-NotificationOptions <VBRNotificationOptions>] [-OriginalVM <CViVmItem[]>] -Policy <VBRCDPPolicy> [-ReIpRule <VBRViReplicaReIpRule[]>] [-ReplicaVM <CViVmItem[]>] [-RepositorySeed <CBackupRepository>] 
```
```PowerShell
[-ResourcePool <CViResourcePoolItem>] [-RetentionOptions <VBRCDPPolicyRetentionOptions>] [-SourceNetwork <VBRViNetworkInfo[]>] [-SourceProxy <VBRCDPProxy[]>] [-StoragePolicy <VBRViStoragePolicy>] [-Suffix 
```
```PowerShell
<String>] [-TargetNetwork <VBRViNetworkInfo[]>] [-TargetProxy <VBRCDPProxy[]>] [<CommonParameters>]
```
