Get-VBRUnstructuredBackupRestorePoint
-------------------------------------

### Synopsis
Returns restore points created by file backup jobs and object storage backup jobs.

---

### Description

This cmdlet returns restore points created by file backup jobs file backup jobs and object storage backup jobs.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Select-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Select-Object)

---

### Examples
> Example 1. Getting Restore Point Created by Object Storage Job by ID

```PowerShell
Get-VBRUnstructuredBackupRestorePoint -ID "51e4eced-3fce-465b-b516-f24cb5a068a4"
This command returns the 51e4eced-3fce-465b-b516-f24cb5a068a4 restore point created by object storage job.
```
> Example 2. Getting Restore Point From Specific File Share

$backupfile = Get-VBRUnstructuredBackup -Name "NFS Backup"      
$server = Get-VBRUnstructuredBackup -Name "\\WinSRV2049\Documents"      
Get-VBRUnstructuredBackupRestorePoint -Server $server -Backup $backupfile
This example shows how to get restore points of the NFS Backup backup file. The restore points are located on the \WinSRV2049\Documents file share.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Set the $server variable as the Server parameter value. Set the $backupfile variable as the Backup parameter value.
> Example 3. Getting Latest Restore Point Created by File Backup job

$restorepoint = Get-VBRUnstructuredBackupRestorePoint | Sort-Object -Property CreationTime | Select-Object -Last 1
This command gets the latest restore point from an array of restore points.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value as the Property parameter. Provide the Descending parameter.
3. Run the Select-Object cmdlet. Set the 1 value for the Last parameter.

---

### Parameters
#### **Backup**
Specifies an array of backup files created by file backup jobs and object storage backup jobs. The cmdlet will return restore points that are available for these backup files. Accepts the VBRUnstructuredBackup[] object.  To get this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies an array of IDs of restore points. The cmdlet will return restore points with this IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Server**
Specifies an array of file shares and object storage. The cmdlet will return backup files that are located on these file shares and object storage.
Accepts the VBRUnstructuredServer[] object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                       |Required|Position|PipelineInput        |
|---------------------------|--------|--------|---------------------|
|`[VBRUnstructuredServer[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUnstructuredServer[]

Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRUnstructuredBackupRestorePoint -Backup <VBRUnstructuredBackup[]> [-Server <VBRUnstructuredServer[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredBackupRestorePoint -Id <Guid[]> [<CommonParameters>]
```
