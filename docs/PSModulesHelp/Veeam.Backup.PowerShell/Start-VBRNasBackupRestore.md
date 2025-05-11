Start-VBRNasBackupRestore
-------------------------

### Synopsis
Starts restore of backups created by the file share backup job.

---

### Description

This cmdlet starts restore of backups created by the file backup job.

---

### Related Links
* [Get-VBRNASBackupRestorePoint](Get-VBRNASBackupRestorePoint)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

---

### Examples
> Example 1. Restoring Backups to Original Location

$restorepoint = Get-VBRNASBackupRestorePoint
Start-VBRNasBackupRestore -RestorePoint $restorepoint -PreservePermissions -OverwriteMode Overwrite
Restore Type       VM Name                    State      Start Time             End Time               Description
------------       -------                    -----      ----------             --------               -----------
NasRestore         \\FileShare09\Reports      Stopped    9/5/2019 7:13:52 AM    9/5/2019 7:14:12 AM
This example shows how to restore backup files to the original location. The backups will be restored with the following settings:
- Veeam Backup & Replication will restore permissions and the hierarchy of restored files.
- Veeam Backup & Replication will overwrite the existing file versions with the restored file versions.
Perform the following steps:
1. Run the Get-VBRNASBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRNasBackupRestore cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Specify the PreservePermissions parameter.
- Specify the PreserveHierarchy parameter.
- Set the Overwrite option as the OverwriteMode parameter value.
3. The cmdlet output will contain the following details on the restore session: Restore Type, VM Name, State, Start Time, End Time, Description.
> Example 2. Restoring Backups to Different Location

$restorepoint = Get-VBRNASBackupRestorePoint
$destinationsrv = Get-VBRUnstructuredServer -Name "\\SMBSRV\Documents\"
Start-VBRNasBackupRestore -RestorePoint $restorepoint -DestinationServer $destinationsrv -DestinationFolderPath "\\SMBSRV\Documents\restored" -PreservePermissions -PreserveHierarchy -OverwriteMode Leave
This example shows how to restore backup files to the \\SMBSRV\Documents\ server. The backups will be restored with the following settings:
- Veeam Backup & Replication will restore permissions of restored files.
- Veeam Backup & Replication will restore the hierarchy of restored files.
- Veeam Backup & Replication will restore backup files to the \\SMBSRV\Documents\restored folder.
- Veeam Backup & Replication will keep the existing file version on the target file share.
Perform the following steps:
1. Run the Get-VBRNASBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $destinationsrv variable.
3. Run the Start-VBRNasBackupRestore cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $destinationsrv variable as the DestinationServer parameter value.
- Specify the DestinationFolderPath parameter value.
- Specify the PreservePermissions parameter.
- Specify the PreserveHierarchy parameter.
- Set the Leave option for the OverwriteMode parameter.
> Example 3. Restoring Corrupted Backups to Original Location

$restorepoint = Get-VBRNASBackupRestorePoint
Start-VBRNasBackupRestore -RestorePoint $restorepoint -RollBack
Restore Type       VM Name                    State      Start Time             End Time               Description
------------       -------                    -----      ----------             --------               -----------
NasRestore         \\FileShare09\Reports      Stopped    9/5/2019 7:13:52 AM    9/5/2019 7:14:12 AM    UrgentRetore
This example shows how to restore corrupted backup files to the original location.

Perform the following steps:
1. Run the Get-VBRNASBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRNasBackupRestore cmdlet. Set the $restorepoint as the RestorePoint parameter value. Specify the RollBack parameter.
> Example 4. Restoring Corrupted Backups to Different Location

$restorepoint = Get-VBRNASBackupRestorePoint
$destinationsrv = Get-VBRUnstructuredServer -Name "\\SMBSRV\Documents\"
Start-VBRNasBackupRestore -RestorePoint $restorepoint -DestinationServer $destinationsrv -DestinationFolderPath "\\SMBSRV\Documents\restored" -PreservePermissions -PreserveHierarchy -RollBack
This example shows how to restore corrupted backup files to the \\SMBSRV\Documents\ server. The backups will be restored with the following settings:
- Veeam Backup & Replication will restore permissions of restored files.
- Veeam Backup & Replication will restore hierarchy of of restored files.
- Veeam Backup & Replication will restore backup files to the \\SMBSRV\Documents\restored folder.
- Veeam Backup & Replication will will keep the existing file version on the target file share.
Perform the following steps: 1. Run the Get-VBRNASBackupRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $destinationsrv variable.
3. Run the Start-VBRNasBackupRestore cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $destinationsrv variable as the DestinationServer parameter value.
- Specify the DestinationFolderPath parameter value.
- Specify the PreservePermissions parameter.
- Specify the PreserveHierarchy parameter.
- Specify the RollBack parameter.

---

### Parameters
#### **DestinationFolderPath**
Specifies the path to the folder on the file share. The cmdlet will restore backups to the specified folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **DestinationServer**
Specifies a target file share. The cmdlet will start restore to recover backup files to this file share. Accepts the VBRUnstructuredServer object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRUnstructuredServer]`|true    |named   |False        |

#### **OverwriteMode**
Specifies restore options for files, that you want to restore if they are already added to the target file share. You can select either of the following restore options:
* Leave: use this option if you do not want to overwrite the existing file version with the restored file version.
The cmdlet will keep the existing file version on the target file share.
* Overwrite: use this option if you want to overwrite the existing file version with the restored file version.
* OverwriteIfOlder: use this option if the backed-up file version is newer than the existing file version on the file share.
The cmdlet will overwrite the existing file versions with the backed-up file versions.
Note: You must specify either this or the RollBack parameter.
Valid Values:

* Leave
* Overwrite
* OverwriteIfOlder

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRNASBackupRestoreOverwriteMode]`|false   |named   |False        |

#### **PreserveHierarchy**
Defines that the cmdlet will restore the hierarchy of recovered backups. If you provide this parameter, the cmdlet will restore hierarchy of recovered backups. Otherwise, the folder hierarchy of backups will not be recovered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PreservePermissions**
Defines that the cmdlet will restore permissions and security attributes of recovered backups. If you provide this parameter, the cmdlet will restore backup files with security attributes and permissions set by the user. Otherwise, permissions and security attributes of restored backups will not be recovered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point. The cmdlet will start restore to recover backup files to the specified restore point. Accepts the VBRNASBackupRestorePoint object. To get this object, run the Get-VBRNASBackupRestorePoint cmdlet.

|Type                        |Required|Position|PipelineInput                 |
|----------------------------|--------|--------|------------------------------|
|`[VBRNASBackupRestorePoint]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RollBack**
Defines that the cmdlet will roll back backup files that have been modified to a previous version. Files, that have not been modified will remain unchanged. If you provide this parameter, the cmdlet will roll back the modified backup files. Otherwise, the cmdlet will restore the latest version of files that have been modified. Note: You must specify either this or the OverwriteMode parameter.

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
Veeam.Backup.PowerShell.Infos.VBRNASBackupRestorePoint

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRNasBackupRestore -DestinationFolderPath <String> -DestinationServer <VBRUnstructuredServer> [-OverwriteMode {Leave | Overwrite | OverwriteIfOlder}] [-PreserveHierarchy] [-PreservePermissions] 
```
```PowerShell
-RestorePoint <VBRNASBackupRestorePoint> [-RollBack] [-RunAsync] [<CommonParameters>]
```
