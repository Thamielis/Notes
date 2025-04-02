Set-VBRvCDCDPPolicy
-------------------

### Synopsis
Modifies a Cloud Director CDP policy.

---

### Description

This cmdlet modifies a Cloud Director CDP policy.

---

### Related Links
* [Get-VBRCDPPolicy](Get-VBRCDPPolicy)

---

### Examples
> Example 1

$policy = Get-VBRCDPPolicy 
Set-VBRvCDCDPPolicy -Policy $policy -CompressionLevel DedupeFriendly
This example shows how to modify the compression level for the replicated data. The cmdlet will set the compression level to dedupe-friendly compression level.

Perform the following steps:
1. Run the Get-VBRCDPPolicy cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Set-VBRvCDCDPPolicy cmdlet. Set the $policy variable as the Policy parameter value. Specify the CompressionLevel parameter value.

---

### Parameters
#### **CompressionLevel**
Specifies the compression level for the replicated data:
* None: use this option if you do not want to enable data compression.
* Dedupe-friendly: use this option to set a dedupe-friendly compression level.
* Optimal: use this option to set an optimal compression level.
* High: use this option to set a high compression level.
* Extreme: use this option to set an extreme compression level.
Valid Values:

* None
* DedupeFriendly
* Optimal
* High
* Extreme

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRCompressionLevel]`|false   |named   |False        |

#### **Description**
Specifies a description for the CDP policy. The cmdlet will replace the CDP policy description with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableApplicationProcessing**
Enables guest processing settings for the CDP policy.
Use the GuestProcessingOptions parameter to specify the guest processing settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableInitialSeeding**
Enables replica seeding.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableNetworkMapping**
Enables network mapping.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableReplicaMapping**
Enables the replica mapping functionality.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludedObject**
Specifies an array of VM containers that you want to exclude from the CDP policy. You can exclude the following types of Cloud Director source objects:
* Organization
* Organization VDC
* vApp

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[IVcdItem[]]`|false   |named   |False        |

#### **GuestProcessingOptions**
Specifies guest processing options.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRReplicaApplicationProcessingOptions]`|false   |named   |False        |

#### **Name**
Specifies a name for the CDP policy. The cmdlet will replace the CDP policy name with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification options of the CDP policy.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OriginalVApp**
For the replica mapping functionality.
Specifies an array of productions vApp for which you plan to use replica mapping.
The CDP policy will map these vApps to the vApps in the disaster recovery site.
Use the ReplicaVApp parameter to specify the vApps in the disaster recovery site.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CVcdVappItem[]]`|false   |named   |False        |

#### **Policy**
Specifies the Cloud Director CDP policy that you want to modify.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[VBRvCDCDPPolicy]`|true    |named   |True (ByValue)|

#### **ReplicaVApp**
For the replica mapping functionality.
Specifies an array of vApps in the disaster recovery site. The cmdlet will map the production vApps to these vApps and will use these vApps as CDP replicas.
Use the OriginalVApp parameter to specify the vApps in the production site.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CVcdVappItem[]]`|false   |named   |False        |

#### **RepositorySeed**
For the replica seeding functionality.
Specifies the backup repository that keeps the full backups of vApps that you want to replicate.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RetentionOptions**
Specifies retention settings.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCDPPolicyRetentionOptions]`|false   |named   |False        |

#### **SourceNetwork**
For the network mapping functionality.
Specifies an array of the production networks to which the vApps are connected.
Note: The number of the source and the target networks must be the same.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDOrgVdcNetworkInfo[]]`|false   |named   |False        |

#### **SourceObject**
Specifies an array of the vApps that you want to protect.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[IVcdItem[]]`|false   |named   |False        |

#### **SourceProxy**
Specifies an array of the VMware CDP proxy in the production site that you want to assign to the CDP policy.
Default: Automatic selection.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that the cmdlet will add to the name of vApps replicated with CDP policies.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For the network mapping functionality.
Specifies an array of the networks in the Disaster Recovery site. The replicated vApps will be connected to these networks.
Note: The number of the source and the target networks must be the same.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDOrgVdcNetworkInfo[]]`|false   |named   |False        |

#### **TargetProxy**
Specifies an array of the target VMware CDP proxies that you want to assign to the CDP policy.
Default: Automatic selection.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRvCDCDPPolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRvCDCDPPolicy [-CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme}] [-Description <String>] [-EnableApplicationProcessing] [-EnableInitialSeeding] [-EnableNetworkMapping] 
```
```PowerShell
[-EnableReplicaMapping] [-ExcludedObject <IVcdItem[]>] [-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-OriginalVApp 
```
```PowerShell
<CVcdVappItem[]>] -Policy <VBRvCDCDPPolicy> [-ReplicaVApp <CVcdVappItem[]>] [-RepositorySeed <CBackupRepository>] [-RetentionOptions <VBRCDPPolicyRetentionOptions>] [-SourceNetwork <VBRvCDOrgVdcNetworkInfo[]>] 
```
```PowerShell
[-SourceObject <IVcdItem[]>] [-SourceProxy <VBRCDPProxy[]>] [-Suffix <String>] [-TargetNetwork <VBRvCDOrgVdcNetworkInfo[]>] [-TargetProxy <VBRCDPProxy[]>] [<CommonParameters>]
```
