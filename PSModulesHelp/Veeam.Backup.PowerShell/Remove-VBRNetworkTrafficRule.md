Remove-VBRNetworkTrafficRule
----------------------------

### Synopsis
Removes network traffic rules.

---

### Description

This cmdlet removes network traffic rules from the backup infrastructure.

---

### Related Links
* [Get-VBRNetworkTrafficRule](Get-VBRNetworkTrafficRule)

---

### Examples
> Removing Network Traffic Rule

$rule = Get-VBRNetworkTrafficRule -Name "Rule #5"
Remove-VBRNetworkTrafficRule -Rule $rule
This example shows how to remove a network traffic rule from the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRNetworkTrafficRule cmdlet. Specify the Name parameter value. Save the result to the $rule variable.
2. Run the Remove-VBRNetworkTrafficRule cmdlet. Set the $rule variable as the Rule parameter value.

---

### Parameters
#### **Rule**
Specifies an array of network traffic rules that you want to remove.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRNetworkTrafficRule[]]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRNetworkTrafficRule[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRNetworkTrafficRule -Rule <VBRNetworkTrafficRule[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
