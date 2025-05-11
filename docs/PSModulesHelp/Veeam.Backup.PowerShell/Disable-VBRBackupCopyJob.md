Disable-VBRBackupCopyJob
------------------------

### Synopsis
Disables backup copy jobs.

---

### Description

This cmdlet disables backup copy jobs.
Run the Enable-VBRBackupCopyJob cmdlet to enable backup copy jobs.

---

### Related Links
* [Get-VBRBackupCopyJob](Get-VBRBackupCopyJob)

---

### Examples
> Disabling Backup Copy Job

$job = Get-VBRBackupCopyJob
Disable-VBRBackupCopyJob -Job $job
This example shows how to disable a backup copy job.
Perform the following steps:
1. Run the Get-VBRBackupCopyJob cmdlet. Save the result to the $job variable.
2. Run the Disable-VBRBackupCopyJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of backup copy jobs that you want to disable.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRBackupCopyJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackupCopyJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRBackupCopyJob [-Job] <VBRBackupCopyJob[]> [-PassThru] [<CommonParameters>]
```
