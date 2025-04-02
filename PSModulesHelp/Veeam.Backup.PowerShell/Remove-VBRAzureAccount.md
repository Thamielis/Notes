Remove-VBRAzureAccount
----------------------

### Synopsis
Removes Microsoft Azure accounts from Veeam Backup & Replication.

---

### Description

This cmdlet removes Microsoft Azure accounts added to Veeam Backup & Replication.
When you remove an account, it is not deleted from your subscription. You stop managing it with Veeam Backup & Replication.
IMPORTANT! This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Related Links
* [Get-VBRAzureAccount](Get-VBRAzureAccount)

---

### Examples
> Removing Microsoft Azure Account

$account = Get-VBRAzureAccount -Name "RestoreToAzure@Veeam.com"
Remove-VBRAzureAccount -Account $account
This example shows how to remove an account named RestoreToAzure@Veeam.com.
Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Remove-VBRAzureAccount cmdlet. Set the $account variable as the Account parameter value.

---

### Parameters
#### **Account**
Specifies the array of accounts you want to remove.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRAzureAccount[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRAzureAccount[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRAzureAccount -Account <VBRAzureAccount[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
