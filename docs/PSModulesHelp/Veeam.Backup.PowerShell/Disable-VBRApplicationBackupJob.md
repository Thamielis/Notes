Disable-VBRApplicationBackupJob
-------------------------------

### Synopsis
Disables application backup policies.

---

### Description

This cmdlet disables application backup policies. Run the Enable-VBRApplicationBackupJob cmdlet to enable application backup policies.

---

### Related Links
* [Get-VBRApplicationBackupJob](Get-VBRApplicationBackupJob)

---

### Examples
> Disabling Application Backup Policy

$job = Get-VBRApplicationBackupJob -Name "DbsSrv2049"
Disable-VBRApplicationBackupJob -Job $job
This example shows how to disable the DbsSrv2049 application backup policy.

Perform the following steps:
1. Run the Get-VBRApplicationBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Disable-VBRApplicationBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an application backup policy that you want to disable. Accepts the VBRApplicationBackupJob[] object.  To get this object, run the Get-VBRApplicationBackupJob cmdlet.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRApplicationBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console

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
Disable-VBRApplicationBackupJob [-Job] <VBRApplicationBackupJob[]> [-PassThru] [<CommonParameters>]
```
