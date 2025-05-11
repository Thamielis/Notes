Remove-VBRAzureADAccount
------------------------

### Synopsis
Removes Azure Entra ID-based storage accounts from Veeam Backup & Replication.

---

### Description

This cmdlet removes Azure Entra ID-based storage accounts from Veeam Backup & Replication.

---

### Related Links
* [Get-VBRAzureADAccount](Get-VBRAzureADAccount)

---

### Examples
> Removing Azure Entra ID-based storage Accounts From Veeam Backup & Replication

$account = Get-VBRAzureADAccount -Name "EntraID"
Set-VBRAzureADAccount -Account $account -SecretKey "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
This example shows how to remove Azure Entra ID-based storage accounts from Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRAzureADAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Set-VBRAzureADAccount cmdlet. Set the $account variable as the Account parameter value. Specify the SecretKey parameter value.

---

### Parameters
#### **Account**
Specifies the Azure Entra ID-based storage account which settings you want to modify.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[VBRAzureADAccount]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRAzureADAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRAzureADAccount -Account <VBRAzureADAccount> [-Confirm] [-WhatIf] [<CommonParameters>]
```
