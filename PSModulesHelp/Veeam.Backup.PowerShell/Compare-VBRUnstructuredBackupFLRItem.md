Compare-VBRUnstructuredBackupFLRItem
------------------------------------

### Synopsis
Compares backed-up objects with objects on production file share or object storage.

---

### Description

This cmdlet compares backed-up objects with objects on production file share or object storage.

Important The cmdlet compares only backup files recovered to a certain restore point. You can not compare all versions of backup files. To recover files to a certain restore point, run the Start-VBRUnstructuredBackupFLRSession cmdlet and provide the RestorePoint parameter.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Start-VBRUnstructuredBackupFLRSession](Start-VBRUnstructuredBackupFLRSession)

* [Get-VBRUnstructuredBackupFLRItem](Get-VBRUnstructuredBackupFLRItem)

---

### Examples
> Comparing Backed-Up Objects with Objects on Production Object Storage

$restorepoint = Get-VBRUnstructuredBackupRestorePoint -ID "51e4eced-3fce-465b-b516-f24cb5a068a4"
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint[3]
$item = Get-VBRUnstructuredBackupFLRItem -Session $session
Compare-VBRUnstructuredBackupFLRItem -Item $item[0,1,4,5] -Session $session
This example shows how to compare backed-up objects with objects on production object storage.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Specify the ID parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Specify the RestorePoint parameter value. Save the result to the $session variable.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Specify the Session parameter values. Save the result to the $item variable.
4. Run the Compare-VBRUnstructuredBackupFLRItem cmdlet. Set the Monthly option for the Type parameter value. Set the $monthly variable as the DailyOptions parameter value.

---

### Parameters
#### **Item**
Specifies an array of backed-up objects that you want to compare with production file share or object storage. Accepts the VBRUnstructuredBackupFLRItem[] object.  To get this object, run the Get-VBRUnstructuredBackupFLRItem cmdlet.

|Type                              |Required|Position|PipelineInput                 |
|----------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupFLRItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies restore sessions started to recover objects backed-up by file backup jobs and object storage backup jobs. The cmdlet will compare the objects restored within this session with objects on production file share or object storage. Accepts the VBRUnstructuredBackupFLRSession object.  To create this object, run the Get-VBRUnstructuredBackupFLRSession cmdlet.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupFLRSession]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupFLRSession

Veeam.Backup.PowerShell.Infos.VBRNASBackupFLRItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Compare-VBRUnstructuredBackupFLRItem -Item <VBRUnstructuredBackupFLRItem[]> [-RunAsync] -Session <VBRUnstructuredBackupFLRSession> [<CommonParameters>]
```
