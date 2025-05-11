Remove-VBRComputerRecoveryToken
-------------------------------

### Synopsis
Removes tokens for bare-metal recovery.

---

### Description

This cmdlet removes tokens for bare-metal recovery.

---

### Related Links
* [Get-VBRComputerRecoveryToken](Get-VBRComputerRecoveryToken)

---

### Examples
> Removing Tokens for Bare-Metal Recovery

$token = Get-VBRComputerRecoveryToken
Remove-VBRComputerRecoveryToken -RecoveryToken $token
This example shows how to remove all tokens created for bare-metal recovery.
Perform the following steps:
1. Run the Get-VBRComputerRecoveryToken cmdlet. Save the result to the $token variable.
2. Run the Remove-VBRComputerRecoveryToken cmdlet. Set the $token variable as the RecoveryToken parameter value.

---

### Parameters
#### **RecoveryToken**
Specifies an array of tokens. The cmdlet will remove these tokens.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRComputerRecoveryToken[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRComputerRecoveryToken[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRComputerRecoveryToken -RecoveryToken <VBRComputerRecoveryToken[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
