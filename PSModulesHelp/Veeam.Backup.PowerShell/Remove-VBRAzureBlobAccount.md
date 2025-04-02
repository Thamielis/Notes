Remove-VBRAzureBlobAccount
--------------------------

### Synopsis
Removes Microsoft Azure Blob credentials records.

---

### Description

This cmdlet removes Azure Blob credentials records from Veeam Backup & Replication. You will not be able to connect to Azure Blob object storage after removing credentials records.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

---

### Examples
> Removing Microsoft Azure Blob Credentials Record

$account = Get-VBRAzureBlobAccount -AccessKey "Azure Blob"
Remove-VBRAzureBlobAccount -Account $account
This example shows how to remove an Microsoft Azure Blob credentials record.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Remove-VBRAzureBlobAccount cmdlet. Set the $account variable as the Account parameter value.

---

### Parameters
#### **Account**
Specifies Microsoft Azure Blob credentials records that you want to remove.

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[VBRAzureBlobAccount]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRAzureBlobAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRAzureBlobAccount -Account <VBRAzureBlobAccount> [-Confirm] [-WhatIf] [<CommonParameters>]
```
