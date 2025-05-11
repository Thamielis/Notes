Stop-VBRUnstructuredBackupFLRItemComparison
-------------------------------------------

### Synopsis
Stops sessions that are running to compare backed-up objects with objects on production file share or object storage.

---

### Description

This cmdlet stops sessions that are running to compare backed-up objects with objects on production file share or object storage.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [Start-VBRUnstructuredBackupFLRSession](Start-VBRUnstructuredBackupFLRSession)

* [Get-VBRUnstructuredBackupFLRItem](Get-VBRUnstructuredBackupFLRItem)

---

### Examples
> Stopping Session that Compare Backed-Up Objects with Objects on Production Object Storage

$restorepoint = Get-VBRUnstructuredBackupRestorePoint -ID "51e4eced-3fce-465b-b516-f24cb5a068a4"
$session = Start-VBRUnstructuredBackupFLRSession -RestorePoint $restorepoint[3]
$item = Get-VBRUnstructuredBackupFLRItem -Session $session
Compare-VBRUnstructuredBackupFLRItemAttributes -Item $item[0,1,4,5] -Session $session
This example shows how to compare attributes of backed-up objects with of objects on production object storage.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Specify the ID parameter value. Save the result to the $restorepoint variable. The Get-VBRUnstructuredBackupRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
2. Run the Start-VBRUnstructuredBackupFLRSession cmdlet. Specify the RestorePoint parameter value. Save the result to the $session variable.
3. Run the Get-VBRUnstructuredBackupFLRItem cmdlet. Specify the Session parameter values. Save the result to the $item variable.
4. Run the Stop-VBRUnstructuredBackupFLRItemComparison cmdlet. Set the $item[0,1,4,5] variable as the Item parameter value. Set the $session variable as the Session parameter value.

---

### Parameters
#### **Item**
Specifies an array of backed-up objects. The cmdlet will stop compare session for these objects. Accepts the VBRUnstructuredBackupFLRItem[] object.  To get this object, run the Get-VBRUnstructuredBackupFLRItem cmdlet.

|Type                              |Required|Position|PipelineInput                 |
|----------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupFLRItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Session**
Specifies restore sessions started to recover objects backed-up by file backup jobs and object storage backup jobs. The cmdlet will stop the compare session for these objects. Accepts the VBRUnstructuredBackupFLRSession object.  To create this object, run the Get-VBRUnstructuredBackupFLRSession cmdlet.

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
Stop-VBRUnstructuredBackupFLRItemComparison -Item <VBRUnstructuredBackupFLRItem[]> -Session <VBRUnstructuredBackupFLRSession> [<CommonParameters>]
```
