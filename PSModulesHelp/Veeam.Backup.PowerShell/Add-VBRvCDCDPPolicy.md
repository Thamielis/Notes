Add-VBRvCDCDPPolicy
-------------------

### Synopsis
Creates a Cloud Director CDP policy.

---

### Description

This cmdlet creates a Cloud Director CDP policy.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Example 1

$server = Get-VBRServer -Name "Cloud Server"
$vapp = Find-VBRvCloudEntity -Server $server -VApp
$organization = Find-VBRvCloudEntity -Server $server -OrganizationVdc
$policy = Find-VBRvCloudEntity -Server $server -StorageProfile -Name "Default Storage policy" | Where OrgVcdRef -eq $organization.VcdRef
Add-VBRvCDCDPPolicy -SourceObject $vapp -OrganizationVdc $organization -GeneralStoragePolicy $policy
This example shows how to create a Cloud Director CDP policy.

Perform the following steps: 1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRvCloudEntity cmdlet. Specify the Server and VApp parameters values. Save the result to the $vapp variable.
3. Run the Find-VBRvCloudEntity cmdlet. Specify the Server and OrganizationVdc parameters values. Save the result to the $organization variable.
4. Run the Find-VBRvCloudEntity cmdlet. Specify the Server and StorageProfile parameters values. Save the result to the $policy variable.
5. Run the Add-VBRvCDCDPPolicy cmdlet. Set the $vapp variable as the SourceObject parameter value. Set the $organization[2] variable as the OrganizationVdc parameter value. Set the $policy variable as the GeneralStoragePolicy parameter value.

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
Specifies a description for the CDP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ExcludedObject**
Specifies an array of VM containers that you want to exclude from the CDP policy. You can exclude the following types of containers:
* Organization
* Organization VDC
* vApp

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[IVcdItem[]]`|false   |named   |False        |

#### **GeneralStoragePolicy**
Specifies the storage policy according to which the cmdlet will create replicas.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdOrgVdcStorageProfile]`|true    |named   |False        |

#### **GuestProcessingOptions**
Specifies guest processing options.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[VBRReplicaApplicationProcessingOptions]`|false   |named   |False        |

#### **Name**
Specifies a name for the CDP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification options of the CDP policy.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OrganizationVdc**
Specifies the organization VDC where replicas will be stored.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CVcdOrganizationVdcItem]`|true    |named   |False        |

#### **OriginalVApp**
For the replica mapping functionality.
Specifies an array of production vApps for which you plan to use replica mapping.
The CDP policy will map these vApps to the vApps in the disaster recovery site.
Use the ReplicaVApp parameter to specify the vApps in the disaster recovery site.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CVcdVappItem[]]`|false   |named   |False        |

#### **ReplicaVApp**
For the replica mapping functionality.
Specifies an array of vApps in the disaster recovery site. The cmdlet will map the production vApps to these vApps and will use these vApps as replicas.
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
Specifies an array of vApps that you want to replicate.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[IVcdItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SourceProxy**
Specifies an array of the VMware CDP proxy in the production site that you want to assign to the CDP policy.

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

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.IVcdItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRvCDCDPPolicy [-CompressionLevel {None | DedupeFriendly | Optimal | High | Extreme}] [-Description <String>] [-ExcludedObject <IVcdItem[]>] -GeneralStoragePolicy <CVcdOrgVdcStorageProfile> 
```
```PowerShell
[-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] -OrganizationVdc <CVcdOrganizationVdcItem> [-OriginalVApp <CVcdVappItem[]>] 
```
```PowerShell
[-ReplicaVApp <CVcdVappItem[]>] [-RepositorySeed <CBackupRepository>] [-RetentionOptions <VBRCDPPolicyRetentionOptions>] [-SourceNetwork <VBRvCDOrgVdcNetworkInfo[]>] -SourceObject <IVcdItem[]> [-SourceProxy 
```
```PowerShell
<VBRCDPProxy[]>] [-Suffix <String>] [-TargetNetwork <VBRvCDOrgVdcNetworkInfo[]>] [-TargetProxy <VBRCDPProxy[]>] [<CommonParameters>]
```
