Get-VBRFilesInRestorePoint
--------------------------

### Synopsis
Returns backup files in a selected restore point.

---

### Description

This cmdlet returns backup files in a selected restore point.
With this cmdlet, you can get files in restore points created by the following types of jobs:
- Backup jobs
- Backup copy jobs
- vCloud Director backup jobs
- Veeam Agent for Microsoft Windows backup jobs (only volume level backups)
You can get the list of all files in a selected restore point or look for instances directly by name.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Select-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Select-Object)

---

### Examples
> Example 1. Getting List of Backup Files from Latest Restore Point [Using Pipeline]

$restorepoint = Get-VBRRestorePoint -Name "Webservices01" | Select-Object -Last 1
Get-VBRFilesInRestorePoint -RestorePoint $restorepoint
This example shows how to get the list of files in the last restore point of the Webservices01 backup.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Select-Object cmdlet. Specify the Last parameter value. Save the result to the $restorepoint variable.
3. Run the Get-VBRFilesInRestorePoint cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
> Example 2. Getting List of all Backup Files from Restore Point

$restorepoint = Get-VBRRestorePoint -Name "Webservices01"
Get-VBRFilesInRestorePoint -RestorePoint $restorepoint
This example shows how to get a list of files that are added to the Webservices01 restore point.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Run the Get-VBRFilesInRestorePoint cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.

---

### Parameters
#### **Name**
Specifies the array of names of backup files you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore points for which you want to get the list of backup files.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRFilesInRestorePoint [-RestorePoint] <COib> [-Name <String[]>] [<CommonParameters>]
```
