Import-VBRJobObjectMasks
------------------------

### Synopsis
Returns details on the masks for file backup jobs and object storage backup jobs.

---

### Description

This cmdlet returns details on inclusion and exclusion masks for file backup jobs and object storage backup jobs.

---

### Related Links
* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

---

### Examples
> Example 1. Getting Masks for Object Storage Backup Job

$OSjob = Get-VBRUnstructuredBackupJob -Name "Azure backup"
Import-VBRJobObjectMasks -Path "C:\excludes2.txt" -Job $OSjob
This example shows how to get details on inclusion and exclusion masks for the Azure backup object storage backup jobs.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $OSjob variable.
2. Run the Import-VBRJobObjectMasks cmdlet. Specify the Path parameter value. Set the $OSjob variable as the Job parameter value.
> Example 2. Setting Masks for Object Storage Backup Jobs

$Job = Get-VBRUnstructuredBackupJob -Name 'fjmasks' 
$BackupObjects = $Job.BackupObject 
$exclusionMask = (Import-VBRJobObjectMasks -Path "C:\export.xml").excludemasks 
$inclusionMask = (Import-VBRJobObjectMasks -Path "C:\export.xml").includemasks 
$FilteredObject = Set-VBRObjectStorageBackupJob -JobObject $BackupObjects[0] -ExclusionMask $exclusionMask -InclusionMask $inclusionMask 
Set-VBRObjectStorageBackupJob -Job $Job -BackupObject $FilteredObject
This example shows how to set the inclusion and exclusion masks for the Azure object storage backup jobs.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $Job variable.
2. Specify the BackupObject property of the $Job variable value. Save result to the $Job variable.
3. Get the exclude mask. Declare the $exclusionMask variable. Run the Import-VBRJobObjectMasks cmdlet. Provide the Path parameter. Get the excludemasks property of the VBRImportedUnstructuredBackupMasks object. Save result to the $exclusionMask variable.
4. Get the include mask. Declare the $inclusionMask variable. Run the Import-VBRJobObjectMasks cmdlet. Provide the Path parameter. Get the includemasks property of the VBRImportedUnstructuredBackupMasks object. Save result to the $inclusionMask variable.
5. Run the Set-VBRObjectStorageBackupJob cmdlet. Specify the JobObject, ExclusionMask, InclusionMask parameters values. Save the result to the $FilteredObject variable.
6. Run the Set-VBRObjectStorageBackupJob cmdlet. Set the $Job variable as the Job parameter value. Set the $FilteredObject variable as the BackupObject parameter value.

---

### Parameters
#### **Job**
Specifies an array of file backups job and object storage backup job. The cmdlet will return details on the a scope of objects for these jobs. Accepts the CBackupJob object.  To get this object, run the Get-VBRUnstructuredBackupJob cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|true    |named   |False        |

#### **Path**
Specifies a path to a folder where the masks are located. The cmdlet will export masks to this folder.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Import-VBRJobObjectMasks -Job <CBackupJob> -Path <String> [<CommonParameters>]
```
