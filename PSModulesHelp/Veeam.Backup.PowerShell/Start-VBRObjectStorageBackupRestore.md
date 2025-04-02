Start-VBRObjectStorageBackupRestore
-----------------------------------

### Synopsis
Starts restore of backups created by an object storage backup job.

---

### Description

This cmdlet starts restore of backups created by an object storage backup job.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

---

### Examples
> Starting Restore of Backups Created by Object Storage Backup Jobs

$objectbackup = Get-VBRUnstructuredBackup -Name 'ObjectBackup'
$restorepoint = Get-VBRUnstructuredBackupRestorePoint -Backup $objectbackup
Start-VBRObjectStorageBackupRestore -RestorePoint $restorepoint -OverwriteBucketAttributes -OverwriteMode Overwrite
This example shows how to start restore of backups created by an object storage backup job.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $objectbackup variable.
2. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Specify the Backup parameter value. Save the result to the $restorepoint variable.
3. Run the Start-VBRObjectStorageBackupRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Provide the OverwriteBucketAttributes parmeter. Set the Overwrite option for the OverwriteMode parameter value.

---

### Parameters
#### **DestinationFolderPath**
Specifies the path to the folder on the file share. The cmdlet will restore backups to the specified folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DestinationServer**
Specifies a target object storage. The cmdlet will start restore to recover objects to this object storage. Accepts the VBRUnstructuredServer object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRUnstructuredServer]`|false   |named   |False        |

#### **NewBucketName**
Specifies a new name for the bucket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **OverwriteBucketAttributes**
Defines that the cmdlet will overwrite the bucket attributes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OverwriteMode**
Specifies restore options for objects, that you want to restore if they are already added to the target object storage. You can select one of the following restore options:
* Leave: use this option if you do not want to overwrite the existing object version with the restored object version. The cmdlet will keep the existing object version on the target object storge.
* Overwrite: use this option if you want to overwrite the existing object version with the restored object version.
* OverwriteIfOlder: use this option if the backed-up object version is newer than the existing object version on the object storage. The cmdlet will overwrite the existing object versions with the backed-up object versions.
Note: You must specify either this or the RollBack parameter.
Valid Values:

* Leave
* Overwrite
* OverwriteIfOlder

|Type                                         |Required|Position|PipelineInput|
|---------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupRestoreOverwriteMode]`|false   |named   |False        |

#### **RegionId**
Specifies the ID of the region.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point. The cmdlet will start restore to recover objects to the specified restore point. Accepts the VBRUnstructuredBackupRestorePoint object.  To get this object, run the Get-VBRUnstructuredBackupRestorePoint cmdlet.

|Type                                 |Required|Position|PipelineInput                 |
|-------------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupRestorePoint]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RollBack**
Defines that the cmdlet will roll back objects that have been modified to a previous version. Objects, that have not been modified will remain unchanged.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectStorageBackupRestorePoint

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRObjectStorageBackupRestore [-DestinationFolderPath <String>] [-DestinationServer <VBRUnstructuredServer>] [-OverwriteBucketAttributes] [-OverwriteMode {Leave | Overwrite | OverwriteIfOlder}] 
```
```PowerShell
-RestorePoint <VBRUnstructuredBackupRestorePoint> [-RollBack] [-RunAsync] [<CommonParameters>]
```
```PowerShell
Start-VBRObjectStorageBackupRestore [-DestinationServer <VBRUnstructuredServer>] [-NewBucketName <String>] [-OverwriteBucketAttributes] [-OverwriteMode {Leave | Overwrite | OverwriteIfOlder}] [-RegionId 
```
```PowerShell
<String>] -RestorePoint <VBRUnstructuredBackupRestorePoint> [-RollBack] [-RunAsync] [<CommonParameters>]
```
