Remove-VBRDiscoveredComputerConfigurationPolicy
-----------------------------------------------

### Synopsis
Removes policies that contain configuration options for Veeam Agent settings.
IMPORTANT! Make sure to test this cmdlet in the lab before you run it in the production environment.

---

### Description

This cmdlet removes policies that contain configuration options for Veeam Agent settings.
IMPORTANT!
The cmdlet does not update settings on discovered computers to which the policy has been applied. If you want to change the settings, you must create a new policy and assign it to discovered computers. To create a new policy, run the Add-VBRDiscoveredComputerConfigurationPolicy cmdlet.

---

### Related Links
* [New-VBRDiscoveredComputerConfigurationOption](New-VBRDiscoveredComputerConfigurationOption)

* [Add-VBRDiscoveredComputerConfigurationPolicy](Add-VBRDiscoveredComputerConfigurationPolicy)

* [Get-VBRDiscoveredComputerConfigurationPolicy](Get-VBRDiscoveredComputerConfigurationPolicy)

---

### Examples
> Removing Policy

$PolicyToRemove = Get-VBRDiscoveredComputerConfigurationPolicy -Id a78eceb5-d5b8-4fe0-9a8c-cc788a123c4a
Remove-VBRDiscoveredComputerConfigurationPolicy -Policy $PolicyToRemove
This example shows how to remove a policy using the policy ID.
Perform the following steps:
1. Run the Get-VBRDiscoveredComputerConfigurationPolicy cmdlet. Specify the Id parameter value. Save the result to the $PolicyToRemove variable.
2. Run the Remove-VBRDiscoveredComputerConfigurationPolicy cmdlet. Set the $PolicyToRemove variable as the Policy parameter value.

---

### Parameters
#### **Policy**
Specifies the policy that you want to remove.

|Type                                          |Required|Position|PipelineInput                 |
|----------------------------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputerConfigurationPolicy[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputerConfigurationPolicy[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRDiscoveredComputerConfigurationPolicy -Policy <VBRDiscoveredComputerConfigurationPolicy[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
