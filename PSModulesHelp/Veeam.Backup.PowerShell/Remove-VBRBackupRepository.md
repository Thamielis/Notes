Remove-VBRBackupRepository
--------------------------

### Synopsis
Removes a backup repository from the backup infrastructure.
Note: If the four-eyes authorization is enabled, you cannot run this cmdlet. For more information, see the Four-Eyes Authorization section in the User Guide for VMware vSphere.

---

### Description

This cmdlet allows you to remove a backup repository from the backup infrastructure.
When you remove a backup repository, Veeam Backup & Replication unassigns the repository role from the server, so it is no longer used as a backup destination. The actual server remains added to the backup infrastructure.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Removing Backup Repository [Using Pipeline]

Get-VBRBackupRepository -Name "Local Repository 01" | Remove-VBRBackupRepository
This example shows how to remove the backup repository named Local Repository 01.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRBackupRepository cmdlet.
> Example 2. Removing Backup Repository [Using Variable]

$repository = Get-VBRBackupRepository -Name "Local Repository 01"
Remove-VBRBackupRepository -Repository $repository
This example shows how to remove the backup repository named Local Repository 01.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Remove-VBRBackupRepository cmdlet. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies an array of backup repositories you want to remove.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[CBackupRepository[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.CBackupRepository[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRBackupRepository -Repository <CBackupRepository[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
