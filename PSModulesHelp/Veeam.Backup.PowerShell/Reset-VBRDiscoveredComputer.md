Reset-VBRDiscoveredComputer
---------------------------

### Synopsis
Reboots discovered computers.

---

### Description

This cmdlet reboots selected discovered computers.

---

### Related Links
* [Get-VBRProtectionGroupe](Get-VBRProtectionGroupe)

* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

---

### Examples
> Rebooting Discovered Computers of Protection Group

$group = Get-VBRProtectionGroup -Name "East Support"
$discovered = Get-VBRDiscoveredComputer -ProtectionGroup $group
Reset-VBRDiscoveredComputer -DiscoveredComputer $discovered
This example shows how to reboot discovered computers of a protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Save the result to the $discovered variable.
3. Run the Reset-VBRDiscoveredComputer cmdlet. Set the $discovered variable as the DiscoveredComputer parameter value.

---

### Parameters
#### **DiscoveredComputer**
Specifies the array of discovered computers. The cmdlet will reboot these computers.

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
Reset-VBRDiscoveredComputer -DiscoveredComputer <VBRDiscoveredComputer[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
