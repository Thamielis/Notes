Get-VBRNASBackupRestorePoint
----------------------------

### Synopsis
Returns restore points of backups created by file share backup jobs.

---

### Description

This cmdlet returns restore points created by file share backup jobs.

---

### Related Links
* [Get-VBRNASBackup](Get-VBRNASBackup)

* [Get-VBRNASServer](Get-VBRNASServer)

* [Select-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Select-Object)

---

### Examples
> Example 1. Getting All Restore Points

```PowerShell
Get-VBRNASBackupRestorePoint
This command returns all restore points that are created by file backup jobs.
```
> Example 2. Getting Restore Point by ID

```PowerShell
Get-VBRNASBackupRestorePoint -ID "51e4eced-3fce-465b-b516-f24cb5a068a4"
This command returns the 51e4eced-3fce-465b-b516-f24cb5a068a4 restore point.
```
> Example 3. Getting Restore Point From Specific File Share

$backupfile = Get-VBRNASBackup -Name "NFS Backup"
$server = Get-VBRNASServer -Name "\\WinSRV2049\Documents"
Get-VBRNASBackupRestorePoint -NASServer $server -NASBackup $backupfile
This example shows how to get restore points of the "NFS Backup" backup file. The restore points are located on the \\WinSRV2049\Documents file share.

Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Get-VBRNASServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Get-VBRNASBackupRestorePoint cmdlet. Set the $server variable as the NASServer parameter value. Set the $backupfile variable as the NASBackup parameter value.
> Example 4. Getting Latest Restore Point

$restorepoint = Get-VBRNASBackupRestorePoint | Select-Object -Last 1
This command gets the latest restore point from an array of restore points.

Perform the following steps:
1. Run the Get-VBRNASBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Select-Object cmdlet. Set the 1 value for the Last parameter.

---

### Parameters
#### **Id**
Specifies an array of IDs of backed-up file shares.  The cmdlet will return restore points of these file shares.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **NASBackup**
Specifies an array of backup files created by the file backup job.  The cmdlet will return restore points that are available for these backup files. Accepts the VBRNASBackup[] object.  To get this object, run the Get-VBRNASBackup cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRNASBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **NASServer**
Specifies an array of file shares.  The cmdlet will return backup files that are located on these file shares. Accepts the VBRNASServer[] object.  To get this object, run the Get-VBRNASServer cmdlet.

|Type              |Required|Position|PipelineInput        |
|------------------|--------|--------|---------------------|
|`[VBRNASServer[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackup[]

Veeam.Backup.PowerShell.Infos.VBRNASServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNASBackupRestorePoint -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackupRestorePoint -NASBackup <VBRNASBackup[]> [-NASServer <VBRNASServer[]>] [<CommonParameters>]
```
