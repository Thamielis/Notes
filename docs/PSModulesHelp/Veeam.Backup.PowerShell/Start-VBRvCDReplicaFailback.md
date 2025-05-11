Start-VBRvCDReplicaFailback
---------------------------

### Synopsis
Starts to perform failback from Cloud Director replica to the production VM.

---

### Description

This cmdlet performs failback from a Cloud Director replica to the production vApp.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Example 1. Performing Failback from vCD Replica to Original Location

$restorepoint = Get-VBRRestorePoint -Name "VirginiaVMs"
Start-VBRvCDReplicaFailback -RestorePoint $restorepoint -Retry
This example shows how to perform a failback of the VirginiaVMs vCD replica to the original VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCDReplicaFailback cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Provide the Retry parameter value.
> Example 2. Performing Failback from vCD Replica to Different vApp

$restorepoint = Get-VBRRestorePoint -Name "VirginiaVMs"
$vapp = Find-VBRvCloudEntity -VApp -Name "Atlanta"
Start-VBRvCDReplicaFailback -RestorePoint $restorepoint -DestinationvApp $vapp
This example shows how to perform a failback of the VirginiaVMs vCD replica to the Atlanta vApp.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Find-VBRvCloudEntity cmdlet. Provide the VApp and Name parameter values. Save the result to the $vapp variable.
3. Run the Start-VBRvCDReplicaFailback cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $vapp variable as the DestinationvApp parameter value.
> Example 3. Performing Failback from vCD Replica to Different Organization vDC

$restorepoint = Get-VBRRestorePoint -Name "VirginiaVMs"
$organization = Find-VBRvCloudEntity -Name "Virginia" -OrganizationVdc
Start-VBRvCDReplicaFailback -RestorePoint $restorepoint -OrganizationvDC $organization
This example shows how to perform a failback of the VirginiaVMs vCD replica to the Virginia Organization vDC.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Find-VBRvCloudEntity cmdlet. Provide the OrganizationVdc and Name parameters. Save the result to the $organization variable.
3. Run the Start-VBRvCDReplicaFailback cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $organization variable as the OrganizationvDC parameter.

---

### Parameters
#### **Complete**
Defines that the cmdlet will switch the VDC replica from the failback state to the permanent failback state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DestinationNetwork**
Specifies an array of the target VDC replica networks for Cloud Director replica mapping.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[IVBRServerNetworkInfo[]]`|false   |named   |False        |

#### **DestinationvApp**
Specifies the vApp to which you want to perform a fail back.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CVcdVappItem]`|true    |named   |False        |

#### **DestinationVAppName**
Specifies a name of a new vApp.
The cmdlet will create a vApp with this name and will perform failback to this vApp.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DRSiteProxy**
For failback to a different location.
Specifies an array of disaster recovery site networks. The cmdlet will map the replica to these networks.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform failover without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OrganizationvDC**
Specifies the organization VDC to which you want to perform a fail back.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CVcdOrganizationVdcItem]`|true    |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on the production VM after performing failback.
If you do not provide this parameter, you will need to power the VM on manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ProdSiteProxy**
For failback to a different location.
Specifies an array of production site networks. The cmdlet will map the replica to these networks.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing failback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ReplicaNetwork**
Specifies an array of the VDC replica networks for Cloud Director replica mapping.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[IVBRServerNetworkInfo[]]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point of a Cloud Director replica to which you want to perform a fail back.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Retry**
Defines that if failback does not complete successfully, Veeam Backup & Replication will start to perform failback to a VDC replica again.
If you do not specify this parameter, the cmdlet will not start to perform failover to a VDC replica if some VMs are in the incomplete state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.
Note: This parameter cannot be used if you set the failback switch  schedule by running the New-VBRFailbackSwitchingSchedule cmdlet to the Auto or Scheduled types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StoragePolicy**
Specify the storage policy that you want to apply to the production VMs after performing failback.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdOrgVdcStorageProfile]`|false   |named   |False        |

#### **SwitchingSchedule**
Specifies a switching schedule for VDC replica.
The cmdlet will switch the replica to the production VM according to this schedule.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRFailbackSwitchingSchedule]`|false   |named   |False        |

#### **SwitchToProduction**
Defines that the cmdlet will switch the VDC replica from the ready to switch state to the failback state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRvCDReplicaFailback [-Complete] [-DestinationNetwork <IVBRServerNetworkInfo[]>] [-DestinationVAppName <String>] [-DRSiteProxy <CViProxy[]>] [-Force] -OrganizationvDC <CVcdOrganizationVdcItem> [-PowerOn] 
```
```PowerShell
[-ProdSiteProxy <CViProxy[]>] [-Reason <String>] [-ReplicaNetwork <IVBRServerNetworkInfo[]>] -RestorePoint <COib> [-Retry] [-RunAsync] [-StoragePolicy <CVcdOrgVdcStorageProfile>] [-SwitchingSchedule 
```
```PowerShell
<VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRvCDReplicaFailback [-Complete] -DestinationvApp <CVcdVappItem> [-DRSiteProxy <CViProxy[]>] [-Force] [-PowerOn] [-ProdSiteProxy <CViProxy[]>] [-Reason <String>] -RestorePoint <COib> [-Retry] [-RunAsync] 
```
```PowerShell
[-SwitchingSchedule <VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-Confirm] [-WhatIf] [<CommonParameters>]
```
