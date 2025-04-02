Start-VBRArchiveTierSync
------------------------

### Synopsis
Starts the archiving job.

---

### Description

This cmdlet starts the archiving job that moves data from the capacity tier to the archive tier.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Starting Archiving Job

$repository = Get-VBRBackupRepository -ScaleOut
Start-VBRCapacityTierSync -Repository $repository
This example shows how to start an archiving job.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter. Save the result to the $repository variable.
2. Run the Start-VBRArchiveTierSync cmdlet. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Repository**
Specifies a scale-out backup repository. The cmdlet will return the performance extents added to this repository.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRArchiveTierSync -Repository <VBRScaleOutBackupRepository> [-RunAsync] [<CommonParameters>]
```
