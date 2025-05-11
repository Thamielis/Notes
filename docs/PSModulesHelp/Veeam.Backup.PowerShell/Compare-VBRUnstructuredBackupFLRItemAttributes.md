Compare-VBRUnstructuredBackupFLRItemAttributes
----------------------------------------------

### Synopsis
Compares attributes of backed-up objects with objects on production file share or object storage.

---

### Description

This cmdlet compares attributes of backed-up objects with objects on production file share or object storage. The cmdlet compares only backup files recovered to a certain restore point. You can not compare all versions of backup files. To recover files to a certain restore point, run the Start-VBRUnstructuredBackupFLRSession cmdlet and provide the RestorePoint parameter.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Start-VBRUnstructuredBackupFLRSession](Start-VBRUnstructuredBackupFLRSession)

* [Get-VBRUnstructuredBackupFLRItem](Get-VBRUnstructuredBackupFLRItem)

---

### Examples
> Comparing Attributes of Backed-Up Objects with Attributes of Objects on Production Object Storage

$restorepoint = Get-VBRUnstructuredBackupRestorePoint -ID "51e4eced-3fce-465b-b516-f24cb5a068a4"
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint[3]
$item = Get-VBRUnstructuredBackupFLRItem -Session $session
Compare-VBRUnstructuredBackupFLRItemAttributes -Item $item[0,1,4,5] -Session $session
This example shows how to compare attributes of backed-up objects with attributes of objects on production object storage.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Specify the ID parameter value. Save the result to the $restorepoint variable.
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Specify the RestorePoint parameter value. Save the result to the $session variable.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Specify the Session parameter values. Save the result to the $item variable.
4. Run the Compare-VBRUnstructuredBackupFLRItemAttributes cmdlet. Set the Monthly option for the Type parameter value. Set the $monthly variable as the DailyOptions parameter value.

---

### Parameters
#### **Item**
Specifies an array of backed-up objects which attributes you want to compare with objects on production file share or object storage. Accepts the VBRUnstructuredBackupFLRItem[] object.  To get this object, run the Get-VBRUnstructuredBackupFLRItem cmdlet.

|Type                              |Required|Position|PipelineInput                 |
|----------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupFLRItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Session**
Specifies restore sessions started to recover objects backed-up by file backup jobs and object storage backup jobs. The cmdlet will compare attributes of the objects restored within this session with objects on production file share or object storage. Accepts the VBRUnstructuredBackupFLRSession object.  To create this object, run the Get-VBRUnstructuredBackupFLRSession cmdlet.

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
Compare-VBRUnstructuredBackupFLRItemAttributes -Item <VBRUnstructuredBackupFLRItem[]> -Session <VBRUnstructuredBackupFLRSession> [<CommonParameters>]
```
