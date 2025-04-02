Export-VBRJobObjectMasks
------------------------

### Synopsis
Exports masks of objects for file backup jobs and object storage backup jobs.

---

### Description

This cmdlet exports masks of objects for file backup jobs and object storage backup jobs.

---

### Related Links
* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

* [New-VBRObjectStorageBackupJobObject](New-VBRObjectStorageBackupJobObject)

* [New-VBRNASBackupJobObject](New-VBRNASBackupJobObject)

* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

---

### Examples
> Exporting Exclusion Masks for Object Storage Backup Job

$Job = Get-VBRUnstructuredBackupJob -Name 'filemasks'
$BackupObjects = $Job.BackupObject
Export-VBRJobObjectMasks -BackupObject $BackupObjects[0] -Path "C:\export.xml"
This example shows how to exports exclusion masks for the Azure backup object storage backup jobs.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $Job variable.
2. Specify the BackupObject property of the $Job variable value. Save result to the $Job variable.
3. Run the Export-VBRJobObjectMasks cmdlet. Set the $BackupObjects[0] variable as the BackupObject parameter value. Specify the Path parameter value.

---

### Parameters
#### **BackupObject**
Specifies a scope of objects. The cmdlet will export a mask that contains these objects. Accepts the VBRUnstructuredBackupJobObject object. To create this object, run the following cmdlets:
* [For a file backup job] New-VBRNASBackupJobObject
* [For object storage backup job] New-VBRObjectStorageBackupJobObject

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupJobObject]`|true    |named   |False        |

#### **Force**
Defines that the cmdlet will export masks without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies an array of of file backups job and object storage backup job. The cmdlet will return masks added to these jobs. Accepts the CBackupJob object.  To get this object, run the Get-VBRUnstructuredBackupJob cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CBackupJob]`|true    |named   |False        |

#### **Path**
Specifies a path to a folder. The cmdlet will export a mask to this folder.

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
Export-VBRJobObjectMasks -BackupObject <VBRUnstructuredBackupJobObject> [-Force] -Job <CBackupJob> -Path <String> [<CommonParameters>]
```
