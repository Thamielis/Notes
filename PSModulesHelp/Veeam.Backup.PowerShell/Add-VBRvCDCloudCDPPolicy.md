Add-VBRvCDCloudCDPPolicy
------------------------

### Synopsis
Creates a VDC ?DP policy.

---

### Description

This cmdlet creates a VDC ?DP policy.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRCloudServer](Get-VBRCloudServer)

* [Get-VBRCloudDatastore](Get-VBRCloudDatastore)

* [Get-VBRvCDCloudStoragePolicy](Get-VBRvCDCloudStoragePolicy)

---

### Examples
> Example - Creating Cloud VDC CDP Policy

$vm = Find-VBRViEntity -Name "DB server"
$organization =  Get-VBRvCDCloudOrganizationvDC
$vApp = Get-VBRvCDCloudvApp
$storagepolicy = Get-VBRvCDCloudStoragePolicy
Add-VBRvCDCloudCDPPolicy -Entity $vm -OrganizationvDC $organization -vApp $vApp -StoragePolicy $storagepolicy -Name "DHCP_replicant" -Description "DHCP replica"
This example shows how to create the DHCP_replicant cloud VDC CDP policy.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRvCDCloudOrganizationvDC cmdlet. Save the result to the $host variable. The Get-VBRCloudServer cmdlet will return an array of hosts. Mind the ordinal number of the necessary host (in our example, it is the fourth host in the array).
3. Run the Get-VBRvCDCloudvApp cmdlet. Save the result to the $datastore variable. The Get-VBRCloudDatastore cmdlet will return an array of datastores. Mind the ordinal number of the necessary datastore (in our example, it is the fourth datastore in the array).
4. Run the Get-VBRvCDCloudStoragePolicy cmdlet. Save the result to the $storagepolicy variable. The Get-VBRvCDCloudStoragePolicy cmdlet will return an array of storage policies. Mind the ordinal number of the necessary storage policy (in our example, it is the storage policy in the array).
5. Run the Add-VBRCloudCDPPolicy cmdlet. Specify the following settings:
• Set the $vm variable as the Entity parameter value.
• Set the $organization variable as the OrganizationvDC parameter value.
• Set the $vApp variable as the vApp parameter value.
• Set the $storagepolicy variable as the StoragePolicy parameter value.
• Specify the Name parameter value.
• Specify the Description parameter value.

---

### Parameters
#### **Description**
Specifies a description of a VDC ?DP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs you want to add to a VDC ?DP policy.
Accepts the IViItem[] object. To create this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput |
|-------------|--------|--------|--------------|
|`[IViItem[]]`|true    |named   |True (ByValue)|

#### **Force**
Defines that the cmdlet will create a VCD CDP policy without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GuestProcessingOptions**
Specifies guest processing settings of a CDP policy.
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
Specifies a name you want to assign to a VDC ?DP policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings of a CDP policy.
Accepts the VBRNotificationOptions object. To create this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OrganizationvDC**
Specifies the cloud organization VDC. The VDC ?DP policy will store replicas in the selected organization VDC.
Accepts the VBRvCDCloudOrganizationvDC object. To get this object, run the Get-VBRvCDCloudOrganizationvDC cmdlet.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRvCDCloudOrganizationvDC]`|true    |named   |False        |

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
Specifies an array VM in the disaster recovery site. The cmdlet will map the production VM to this VM.
Use the OriginalVM parameter to specify the production VM.
Accepts the VBRvCDCloudVM[] object. To get this object, run the Get-VBRvCDCloudVM cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRvCDCloudVM[]]`|false   |named   |False        |

#### **RepositorySeed**
For replica seeding.
Specifies a backup repository that keeps a full backup of VMs that you want to replicate.
Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RetentionOptions**
Specifies retention settings of a CDP policy.
Accepts the VBRCDPPolicyRetentionOptions object. To create this object, run the New-VBRCDPPolicyRetentionOptions cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCDPPolicyRetentionOptions]`|false   |named   |False        |

#### **SourceNetwork**
For network mapping.
Specifies an array of production networks to which the VMs added to a VCD CDP policy are connected.
Note: The number of source networks must match the number of target networks.
Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **SourceProxy**
Used for building a replica from backup files.
Specifies the backup repository that will be used to read the VM data from the already existing backup chain.
Note: You cannot specify a cloud repository.
Accepts the VBRCDPProxy[] object. To get this object, run the Get-VBRCDPProxy cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the vCD cloud storage policy. The VDC ?DP policy will create replicas according to this storage policy settings.
Accepts the VBRvCDCloudStoragePolicy object. To get this object, run the Get-VBRvCDCloudStoragePolicy cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRvCDCloudStoragePolicy]`|false   |named   |False        |

#### **Suffix**
Specifies the suffix that will be appended to the name of the VM you are replicating. This name will be used to register the replicated VM on the target server.
Note: If you omit this parameter, the replicated VMs will get the '_replica' suffix.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetNetwork**
For network mapping.
Specifies an array of networks in the disaster recovery site. VMs that are replicated with the VCD CDP policy will be connected to these networks.
Note: The number of source networks must match the number of target networks.
Accepts the VBRvCDCloudNetworkInfo[] object. To get this object, run the Get-VBRvCDCloudNetworkInfo cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRvCDCloudNetworkInfo[]]`|false   |named   |False        |

#### **vApp**
pecifies the vApp container. The VDC ?DP policy will store the replicas in the selected container.
Note: If you do not specify the vApp container, the job will store the replicas in the default vApp.
Accepts the VBRvCDCloudvApp object. To get this object, run the Get-VBRvCDCloudvApp cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRvCDCloudvApp]`|false   |named   |False        |

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
Add-VBRvCDCloudCDPPolicy [-Description <String>] -Entity <IViItem[]> [-Force] [-GuestProcessingOptions <VBRReplicaApplicationProcessingOptions>] [-HighPriority] [-Name <String>] [-NotificationOptions 
```
```PowerShell
<VBRNotificationOptions>] -OrganizationvDC <VBRvCDCloudOrganizationvDC> [-OriginalVM <CViVmItem[]>] [-ReplicaVM <VBRvCDCloudVM[]>] [-RepositorySeed <CBackupRepository>] [-RetentionOptions 
```
```PowerShell
<VBRCDPPolicyRetentionOptions>] [-SourceNetwork <VBRViNetworkInfo[]>] [-SourceProxy <VBRCDPProxy[]>] [-StoragePolicy <VBRvCDCloudStoragePolicy>] [-Suffix <String>] [-TargetNetwork <VBRvCDCloudNetworkInfo[]>] 
```
```PowerShell
[-vApp <VBRvCDCloudvApp>] [<CommonParameters>]
```
