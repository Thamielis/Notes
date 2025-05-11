Enable-VBRComputerBackupJob
---------------------------

### Synopsis
Enables Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Description

This cmdlet enables Veeam Agent backup jobs and Veeam Agent backup policies.
Run the Disable-VBRComputerBackupJob cmdlet to disable Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

---

### Examples
> Enabling Veeam Agent backup Job

$job = Get-VBRComputerBackupJob -Name "WinSrv2049"
Enable-VBRComputerBackupJob -Job $job
This example shows how to enable the WinSrv2049 Veeam Agent Backup Job.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Enable-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies a Veeam Agent backup job or a Veeam Agent backup policy that you want to enable.

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
Enable-VBRComputerBackupJob [-Job] <VBRComputerBackupJob[]> [-PassThru] [<CommonParameters>]
```
