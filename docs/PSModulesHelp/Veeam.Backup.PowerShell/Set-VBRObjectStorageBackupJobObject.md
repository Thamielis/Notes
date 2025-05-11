Set-VBRObjectStorageBackupJobObject
-----------------------------------

### Synopsis
Modifies settings of objects that will be added to the object storage backup job.

---

### Description

This cmdlet modifies settings of objects that will be added to the object storage backup job.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [New-VBRObjectStorageBackupJobObject](New-VBRObjectStorageBackupJobObject)

* [New-VBRObjectStorageBackupContainerPathMask](New-VBRObjectStorageBackupContainerPathMask)

---

### Examples
> Defining Objects to Exclude from Object Storage Backup Job

$serv = Get-VBRUnstructuredServer -Name "Azure OS"
$object = New-VBRObjectStorageBackupJobObject -Server $serv -Container "Monthly Backups" -Path "Reports"
$ExclusionMask = New-VBRObjectStorageBackupContainerPathMask -Container "Monthly Backups" -Path Reports/.pdf'
Set-VBRObjectStorageBackupJobObject -JobObject $object -ExclusionMask $ExclusionMask
This example shows how to exclude the Path Reports/.pdf from object storage backup job.

Perform the following steps:
1. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $serv variable.
2. Run the New-VBRObjectStorageBackupJobObject cmdlet. Specify the Server, Container and the Path parameter values. Save the result to the $object variable.
3. Run the New-VBRObjectStorageBackupContainerPathMask cmdlet. Specify the Container and the Path parameter values. Save the result to the $ExclusionMask variable.
4. Run the Set-VBRObjectStorageBackupJobObject cmdlet. Set the $object variable as the JobObject parameter value. Set the $ExclusionMask variable as the ExclusionMask parameter value.

---

### Parameters
#### **ExclusionMask**
Specifies a file mask for objects that you do not want to add to the object storage backup job. The cmdlet will not back up these objects. Accepts the VBRObjectStorageBackupMask[] object. To get this object, run the following cmdles:
* New-VBRObjectStorageBackupContainerPathMask
* New-VBRObjectStorageBackupServerPathMask
* New-VBRObjectStorageBackupTagMask (for include and exclude).

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRObjectStorageBackupMask[]]`|false   |named   |False        |

#### **InclusionMask**
Specifies a file mask for objects that you want to add to the object storage backup job. The cmdlet will back up only objects specified in this file mask. Accepts the VBRObjectStorageBackupMask[] object.  To get this object, run the New-VBRObjectStorageBackupTagMask cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRObjectStorageBackupMask[]]`|false   |named   |False        |

#### **JobObject**
Specifies the settings of objects that will be added to the object storage backup job. The cmdlet will modify these settings. Accepts the VBRObjectStorageBackupJobObject object.  To define this object, run the New-VBRObjectStorageBackupJobObject cmdlet.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRObjectStorageBackupJobObject]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageBackupJobObject

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRObjectStorageBackupJobObject [-ExclusionMask <VBRObjectStorageBackupMask[]>] [-InclusionMask <VBRObjectStorageBackupMask[]>] -JobObject <VBRObjectStorageBackupJobObject> [<CommonParameters>]
```
