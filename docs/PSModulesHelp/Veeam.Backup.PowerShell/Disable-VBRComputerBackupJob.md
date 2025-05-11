Disable-VBRComputerBackupJob
----------------------------

### Synopsis
Disables Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Description

This cmdlet disables Veeam Agent backup jobs and Veeam Agent backup policies.
Run the Enable-VBRComputerBackupJob cmdlet to enable Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

---

### Examples
> Disabling Veeam Agent backup Job

$job = Get-VBRComputerBackupJob -Name "WinSrv2049"
Disable-VBRComputerBackupJob -Job $job
This example shows how to disable the WinSrv2049 Veeam Agent Backup Job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Disable-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a Veeam Agent backup job or a Veeam Agent backup policy that you want to disable.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRComputerBackupJob [-Job] <VBRComputerBackupJob[]> [-PassThru] [<CommonParameters>]
```
