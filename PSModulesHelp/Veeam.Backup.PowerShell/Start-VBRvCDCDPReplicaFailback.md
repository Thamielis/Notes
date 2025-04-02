Start-VBRvCDCDPReplicaFailback
------------------------------

### Synopsis
Starts to perform failback from a Cloud Director CDP replica to the production vApp.

---

### Description

This cmdlet starts to perform failback from a Cloud Director CDP replica to the production vApp. The replica must be in the Failover state. After you start to commit failback, the cmdlet switches the state of the replica from Failover to Ready to switch.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Example 1. Performing Failback from Cloud Director CDP Replica to Original vApp

$replica = Get-VBRCDPReplica -Name "Win07"
Start-VBRvCDCDPReplicaFailback -Replica $replica
This example shows how to start to perform failback from a Cloud Director CDP replica to the original vApp.

Perform the following steps:
1.	Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2.	Run the Start-VBRvCDCDPReplicaFailback cmdlet. Set the $replica variable as the Replica parameter value.
> Example 2. Performing Failback from Cloud Director CDP Replica to Original vApp in New Location

$replica = Get-VBRCDPReplica -Name "Win07"
$server = Get-VBRServer -Name "Cloud Server"
$vapp = Find-VBRvCloudEntity -Server $server -VApp
Start-VBRvCDCDPReplicaFailback -Replica $replica -DestinationvApp $vapp
This example shows how to start to perform failback from a Cloud Director CDP replica to the original vApp that is already recovered to a new location.

Perform the following steps: 1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Find-VBRvCloudEntity cmdlet. Specify the Server and VApp parameters values. Save the result to the $vapp variable.
4. Run the Start-VBRvCDCDPReplicaFailback cmdlet. Set the $replica variable as the Replica parameter value. Set the $vapp variable as the DestinationvApp parameter value.
> Example 3. Performing Failback from Cloud Director CDP Replica to Different Location

$replica = Get-VBRCDPReplica -Name "Win07"
$server = Get-VBRServer -Name "Cloud Server"
$organization = Find-VBRvCloudEntity -Server $server -OrganizationVdc
Start-VBRvCDCDPReplicaFailback -Replica $replica -OrganizationvDC $organization
This example shows how to start to perform failback from a Cloud Director CDP replica to a different location.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Find-VBRvCloudEntity cmdlet. Specify the Server and OrganizationVdc parameters values. Save the result to the $organization variable.
4. Run the Start-VBRvCDCDPReplicaFailback cmdlet. Set the $replica variable as the Replica parameter value. Set the $organization variable as the OrganizationvDC parameter value.

---

### Parameters
#### **Complete**
Defines that the cmdlet will commit failback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DestinationvApp**
For performing failback to an already recovered vApp in a different location.
Specifies the original vApp that is restored in a different location. The cmdlet will perform failback from the replica to this vApp.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CVcdVappItem]`|true    |named   |False        |

#### **DestinationVAppName**
For performing failback to a different location or with different settings.
Specifies a name for the vApp that will be restored from the specified replica. The cmdlet will create a vApp with this name and will perform failback to this vApp.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DRNetwork**
For performing failback to a different location or with different settings.
Specifies an array of networks in the disaster recovery site to which replica is connected. The cmdlet will map these networks to the networks in the production site.
Note: If you specify this parameter, you must also specify the ProductionNetwork parameter.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDOrgVdcNetworkInfo[]]`|false   |named   |False        |

#### **DRProxy**
Specifies an array of VMware CDP proxies that are configured in the disaster recovery site and that will be used for failback.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will fail back without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OrganizationvDC**
For performing failback to a different location or with different settings.
Specifies the organization VDC where you want to restore the vApp from the specified replica.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CVcdOrganizationVdcItem]`|true    |named   |False        |

#### **PowerOn**
Defines that the cmdlet will power on the production vApp after failback. If you do not provide this parameter, you will need to power on VMs in the vApp manually.
Default: False.
Note: If you provide this parameter with the Complete parameter, this parameter will not work. The VMs in the vApp will remain in the state it had before committing failback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ProductionNetwork**
For performing failback to a different location or with different settings.
Specifies an array of networks in the production site. The cmdlet will restore the vApp from the specified replica and will map the replica networks to these networks.
Note: If you specify this parameter, you must also specify the DRNetwork parameter.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDOrgVdcNetworkInfo[]]`|false   |named   |False        |

#### **ProductionProxy**
Specifies an array of VMware CDP proxies that are configured in the production site and that will be used for failback.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPProxy[]]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing failback.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Replica**
Specifies the replica from which you want to fail back.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRvCDCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Retry**
Defines that if failback does not complete successfully, the cmdlet will start to perform failback to a replica again.
If you do not specify this parameter, the cmdlet will not start to perform failback if any vApps are in the incomplete state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.
Note: This parameter can be used if you set the failback switch schedule by running the New-VBRFailbackSwitchingSchedule cmdlet to the Manual type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StoragePolicy**
For performing failback to a different location or with different settings.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdOrgVdcStorageProfile]`|false   |named   |False        |

#### **SwitchingSchedule**
Specifies a switching schedule. The cmdlet will switch the replica to the production vApp according to this schedule.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRFailbackSwitchingSchedule]`|false   |named   |False        |

#### **SwitchToProduction**
Defines that the cmdlet will switch the replica from the Ready to switch state to the Failback state.

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
Veeam.Backup.PowerShell.Infos.VBRvCDCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRvCDCDPReplicaFailback [-Complete] -DestinationvApp <CVcdVappItem> [-DRProxy <VBRCDPProxy[]>] [-Force] [-PowerOn] [-ProductionProxy <VBRCDPProxy[]>] [-Reason <String>] -Replica <VBRvCDCDPReplica> 
```
```PowerShell
[-Retry] [-RunAsync] [-SwitchingSchedule <VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRvCDCDPReplicaFailback [-Complete] [-DestinationVAppName <String>] [-DRNetwork <VBRvCDOrgVdcNetworkInfo[]>] [-DRProxy <VBRCDPProxy[]>] [-Force] -OrganizationvDC <CVcdOrganizationVdcItem> [-PowerOn] 
```
```PowerShell
[-ProductionNetwork <VBRvCDOrgVdcNetworkInfo[]>] [-ProductionProxy <VBRCDPProxy[]>] [-Reason <String>] -Replica <VBRvCDCDPReplica> [-Retry] [-RunAsync] [-StoragePolicy <CVcdOrgVdcStorageProfile>] 
```
```PowerShell
[-SwitchingSchedule <VBRFailbackSwitchingSchedule>] [-SwitchToProduction] [-Confirm] [-WhatIf] [<CommonParameters>]
```
