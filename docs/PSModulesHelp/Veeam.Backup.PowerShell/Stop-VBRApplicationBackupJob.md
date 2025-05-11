Stop-VBRApplicationBackupJob
----------------------------

### Synopsis
Stops application backup policies.

---

### Description

This cmdlet stops application backup policies.

---

### Related Links
* [Get-VBRApplicationBackupJob](Get-VBRApplicationBackupJob)

---

### Examples
> Example - Stopping Application Backup Policies

$job = Get-VBRApplicationBackupJob -Name "DbsSrv2049"
Stop-VBRApplicationBackupJob -Job $job
This example shows how to stop the application backup policy.
Perform the following steps:
1. Run the Get-VBRApplicationBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Stop-VBRApplicationBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an application backup policy that you want to stop. Accepts the VBRApplicationBackupJob[] object. To get this object, run the Get-VBRApplicationBackupJob cmdlet.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRApplicationBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRApplicationBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRApplicationBackupJob [-Job] <VBRApplicationBackupJob[]> [-RunAsync] [<CommonParameters>]
```
