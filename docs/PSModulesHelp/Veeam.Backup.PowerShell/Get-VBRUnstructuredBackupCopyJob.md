Get-VBRUnstructuredBackupCopyJob
--------------------------------

### Synopsis
Returns file backup copy jobs and object storage backup jobs.

---

### Description

This cmdlet returns file backup copy jobs and object storage backup jobs.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

---

### Examples
> Example 1. Getting File Backup Copy Job by Primary Job

$filebackupjob = Get-VBRUnstructuredBackupJob -Name "SMB Backup"
$repository = Get-VBRBackupRepository -Name "Repository07"
Get-VBRUnstructuredBackupCopyJob -ParentJob $filebackupjob -BackupRepository $repository
This example shows how to get a file backup copy job that was created to process backup files of the SMB Backup file backup job. The file backup copy jobs are stored on the Repository07 secondary repository.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $filebackupjob variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Get-VBRUnstructuredBackupCopyJob cmdlet. Set the $filebackupjob variable as the ParentJob parameter value. Set the $repository variable as the BackupRepository parameter value.
> Example 2. Getting Object Storage Backup Copy Jobs by Name

```PowerShell
Get-VBRUnstructuredBackupCopyJob -Name [C-T]*
This command returns all object storage backup copy jobs with the names that begin with the letters C through T.
```
> Example 3. Getting File Backup Copy Jobs by ID

```PowerShell
Get-VBRUnstructuredBackupCopyJob -Id fdae7148-81e6-4cb0-8ea8-34512001fd4c
This command returns the fdae7148-81e6-4cb0-8ea8-34512001fd4c file backup copy job.
```

---

### Parameters
#### **BackupRepository**
Specifies an array of secondary repositories. The cmdlet will get a file backup copy job or an object storage backup copy job that keep their backup files on these repositories.
Accepts the CBackupRepository[] object.  To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **Id**
Specifies an ID of a file backup copy job or an object storage backup copy job. The cmdlet will return an array of jobs with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies a name of a file backup copy job or an object storage backup copy job. The cmdlet will return an array of jobs with the specified name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **ParentJob**
Specifies a primary file backup job or an object storage backup job. The cmdlet will return a file backup copy job or an object storage backup copy job that processes backup files of this backup job.
Accepts the VBRUnstructuredBackupJob object.  To get this object, run the Get-VBRUnstructuredBackupJob cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupJob]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRUnstructuredBackupCopyJob [-BackupRepository <CBackupRepository[]>] -ParentJob <VBRUnstructuredBackupJob> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredBackupCopyJob -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRUnstructuredBackupCopyJob -Name <String[]> [<CommonParameters>]
```
