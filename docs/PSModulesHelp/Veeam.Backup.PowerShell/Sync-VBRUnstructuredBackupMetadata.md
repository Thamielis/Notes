Sync-VBRUnstructuredBackupMetadata
----------------------------------

### Synopsis
Downloads metadata of backup files from the long-term backup repository.

---

### Description

This cmdlet downloads metadata of backup files from the long-term backup repository to the short-term repository. You can use this cmdlet to restore backup files that are located on the long-term repository but are no longer available on the short-term repository.
IMPORTANT: Before downloading metadata from the long-term repository, you must run the Sync-VBRBackupRepository cmdlet to rescan this repository.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example - Downloading Metadata to Short-term Repository

$backup = Get-VBRUnstructuredBackup     
$repository = Get-VBRBackupRepository       
Sync-VBRUnstructuredBackupMetadata -SourceBackup $backup -TargetRepository $repository
This example shows how to download data from the long-term repository to the short-term repository.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Save the result to the $backup variable.
2. Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
3. Run the Sync-VBRUnstructuredBackupMetadata cmdlet. Set the $backup variable as the SourceBackup parameter value. Set the $repository as the TargetRepository parameter value.

---

### Parameters
#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SourceBackup**
Specifies a backup file. The cmdlet will download metadata of this backup file from the long-term repository. Accepts the VBRUnstructuredBackup object.  To get this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **TargetRepository**
Specifies the short-term backup repository. The cmdlet will download metadata of backup files to the specified short-term backup repository. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRUnstructuredBackupMetadata [-RunAsync] -SourceBackup <VBRUnstructuredBackup> -TargetRepository <CBackupRepository> [<CommonParameters>]
```
