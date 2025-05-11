Disable-VBRComputerBackupCopyJob
--------------------------------

### Synopsis
Disables Veeam Agent backup copy jobs.

---

### Description

This cmdlet disables Veeam Agent backup copy jobs.
Run the Enable-VBRComputerBackupCopyJob cmdlet to enable Veeam Agent backup copy jobs.

---

### Related Links
* [Get-VBRComputerBackupCopyJob](Get-VBRComputerBackupCopyJob)

---

### Examples
> Disabling Veeam Agent Backup Copy Jobs

$jobs = Get-VBRComputerBackupCopyJob
Disable-VBRComputerBackupCopyJob -Job $jobs
This example shows how to disable Veeam Agent Backup copy jobs.

Perform the following steps:
1. Run the Get-VBRComputerBackupCopyJob cmdlet. Save the result to the $jobs variable.
2. Run the Disable-VBRComputerBackupCopyJob cmdlet. Set the $jobs variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of Veeam Agent backup copy jobs that you want to disable.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupCopyJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerBackupCopyJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRComputerBackupCopyJob [-Job] <VBRComputerBackupCopyJob[]> [-PassThru] [<CommonParameters>]
```
