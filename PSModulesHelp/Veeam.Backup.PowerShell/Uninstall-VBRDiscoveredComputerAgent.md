Uninstall-VBRDiscoveredComputerAgent
------------------------------------

### Synopsis
Removes Veeam Agent from a specific protected computer.

---

### Description

This cmdlet removes Veeam Agent from a specific protected computer.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

---

### Examples
> Removing Veeam Agent from Protected Computers

$group = Get-VBRProtectionGroup -Name "Support_East"
$computers = Get-VBRDiscoveredComputer -ProtectionGroup $group
Uninstall-VBRDiscoveredComputerAgent -DiscoveredComputer $computers
This example shows how to remove Veeam Agent from protected computers that are added to the Support_East protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Save the result to the $computers variable.
3. Run the Uninstall-VBRDiscoveredComputerAgent cmdlet. Set the $computers variable as the DiscoveredComputer parameter value.

---

### Parameters
#### **DiscoveredComputer**
Specifies an array of computers. The cmdlet will remove Veeam Agent from these computers.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputer[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

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
Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputer[]

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Uninstall-VBRDiscoveredComputerAgent -DiscoveredComputer <VBRDiscoveredComputer[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
