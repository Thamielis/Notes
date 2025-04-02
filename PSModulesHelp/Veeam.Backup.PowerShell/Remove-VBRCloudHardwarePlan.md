Remove-VBRCloudHardwarePlan
---------------------------

### Synopsis
Removes hardware plans.

---

### Description

This cmdlet removes a selected hardware plan.

---

### Related Links
* [Get-VBRCloudHardwarePlan](Get-VBRCloudHardwarePlan)

---

### Examples
> Example 1. Removing Hardware Plans [Using Variable]

$hardwareplans = Get-VBRCloudHardwarePlan -Name "VMware Silver", "VMware Gold"
Remove-VBRCloudHardwarePlan -HardwarePlan $hardwareplans
This example shows how to remove VMware Silver and VMware Gold hardware plans.

Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save the result to the $hardwareplans variable.
2. Run the Remove-VBRCloudHardwarePlan cmdlet. Set the $hardwareplans variable as the HardwarePlan parameter value.
> Example 2. Removing Hardware Plan [Using Pipeline]

Get-VBRCloudHardwarePlan -Name "Hyper-V Silver" | Remove-VBRCloudHardwarePlan
This example shows how to remove a hardware plan named Hyper-V Silver.

Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRCloudHardwarePlan cmdlet.
> Example 3. Removing VMware Hardware Plans [Using Pipeline]

Get-VBRCloudHardwarePlan -Platform VMware | Remove-VBRCloudHardwarePlan
This example shows how to remove all VMware hardware plans.
Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Set the VMware option for the Platform parameter.
2. Pipe the cmdlet output to the Remove-VBRCloudHardwarePlan cmdlet.

---

### Parameters
#### **Force**
Defines that the cmdlet remove the hardware plan without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HardwarePlan**
Specifies the array of hardware plans you want to remove. Accepts the VBRViCloudHardwarePlan[] or VBRHvCloudHardwarePlan[] objects. To get this object, run the Get-VBRCloudHardwarePlan cmdlet.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRCloudHardwarePlan[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCloudHardwarePlan[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCloudHardwarePlan [-Force] -HardwarePlan <VBRCloudHardwarePlan[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
