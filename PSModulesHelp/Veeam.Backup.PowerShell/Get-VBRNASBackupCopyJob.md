Get-VBRNASBackupCopyJob
-----------------------

### Synopsis
Returns file backup copy jobs.

---

### Description

This cmdlet returns file backup copy jobs.

---

### Related Links
* [Get-VBRNASBackupJob](Get-VBRNASBackupJob)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Getting All File Backup Copy Jobs

```PowerShell
Get-VBRNASBackupCopyJob
This command returns all file backup copy jobs that are available on the secondary backup repositories for file backup jobs.
```
> Example 2. Getting File Backup Copy Job by Primary Job

$filebackupjob = Get-VBRNASBackupJob -Name "SMB Backup"
$repository Get-VBRBackupRepository -Name "Repository07
Get-VBRNASBackupCopyJob -ParentJob $filebackupjob -BackupRepository $repository
This example shows how to create a file backup copy job that was created to process backup files of the "SMB Backup" file backup job. The file backup copy jobs are stored on the "Repository07" secondary repository.

Perform the following steps:
1. Run the Get-VBRNASBackupJob cmdlet. Specify the Name parameter value. Save the result to the $filebackupjob variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3.  Run the Get-VBRNASBackupJob cmdlet. Set the $filebackupjob variable as the ParentJob parameter value. Set the $repository variable as the BackupRepository parameter value.
> Example 3. Getting File Backup Copy Jobs by Name

```PowerShell
Get-VBRNASBackupCopyJob -Name [C-T]*
This command returns all file backup copy jobs with the names that begin with the letters C through T.
```
> Example 4. Getting File Backup Copy Jobs by ID

```PowerShell
Get-VBRNASBackupCopyJob -Id fdae7148-81e6-4cb0-8ea8-34512001fd4c
This command returns the fdae7148-81e6-4cb0-8ea8-34512001fd4c file backup copy job.
```

---

### Parameters
#### **BackupRepository**
Specifies an array of secondary repositories.  The cmdlet will get file backup copy jobs that keep their backup files on these repositories. Accepts the CBackupRepository[] object.  To create this object, run the Get-VBRBackupRepository cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CBackupRepository[]]`|false   |named   |False        |

#### **Id**
Specifies an ID of a file backup copy job.  The cmdlet will return an array of jobs with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies a name of a file backup copy job.  The cmdlet will return an array of jobs with the specified name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **ParentJob**
Specifies a primary file backup job.  The cmdlet will get a file backup copy job that was created to process backup files of this backup job. Accepts the VBRNASBackupJob object.  To create this object, run the Get-VBRNASBackupJob cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNASBackupJob]`|true    |named   |False        |

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
Get-VBRNASBackupCopyJob [-BackupRepository <CBackupRepository[]>] -ParentJob <VBRNASBackupJob> [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackupCopyJob -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackupCopyJob -Name <String[]> [<CommonParameters>]
```
