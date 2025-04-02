Remove-VBRPreferredNetwork
--------------------------

### Synopsis
Removes preferred networks.

---

### Description

This cmdlet removes an array of preferred networks created for the backup infrastructure. The cmdlet will remove all preferred networks added to the backup infrastructure.

---

### Related Links
* [Get-VBRPreferredNetwork](Get-VBRPreferredNetwork)

---

### Examples
> Removing Preferred Network

$network = Get-VBRPreferredNetwork
Remove-VBRNetworkTrafficRule -Network $network
This example shows how to remove preferred networks added to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRPreferredNetwork cmdlet. Save the result to the $network variable.
2. Run the Remove-VBRNetworkTrafficRule cmdlet. Set the $network variable as the Network parameter value.

---

### Parameters
#### **Network**
Specifies an array of preferred networks that you want to remove.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRPreferredNetwork[]]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRPreferredNetwork[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRPreferredNetwork -Network <VBRPreferredNetwork[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
