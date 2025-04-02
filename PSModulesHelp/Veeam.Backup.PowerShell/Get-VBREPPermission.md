Get-VBREPPermission
-------------------

### Synopsis
Returns user access permissions for backup repositories for Veeam Agent operating in a standalone mode.

---

### Description

This cmdlet returns user access permissions for a backup repository that is used as a target by Veeam Agent operating in a standalone mode.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Getting Repository Permissions [Using Variable]

$repository = Get-VBRBackupRepository -Name "WinLocal"
Get-VBREPPermission -Repository $repository
This example shows how to get the repository permissions using a variable.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save it to the $repository variable.
2. Run the Get-VBREPPermission cmdlet. Set the $repository variable as the Repository parameter value.
> Example 2. Getting Repository Permissions [Using Pipeline]

Get-VBRBackupRepository -Name "WinLocal" | Get-VBREPPermission
This example shows how to get the repository permissions using a pipeline.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBREPPermission cmdlet.

---

### Parameters
#### **Repository**
Specifies the backup repository. The cmdlet will return the permissions for these repositories.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBREPPermission -Repository <CBackupRepository> [<CommonParameters>]
```
