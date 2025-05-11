Apply-VBRManagedByAgentPolicy
-----------------------------

### Synopsis
Assigns Veeam Agent backup policies to protected computers.

---

### Description

This cmdlet assigns Veeam Agent backup policies to protected computers.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

---

### Examples
> Assigning Veeam Agent Backup Policy to Protected Computers

$job = Get-VBRComputerBackupJob -Name "WinSrv2049"
Apply-VBRManagedByAgentPolicy -Job $job
This example shows how to assign a Veeam Agent backup policy to protected computers.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Apply-VBRManagedByAgentPolicy cmdlet. Set the $job variable as the Policy parameter value.

---

### Parameters
#### **Policy**
Specifies a Veeam Agent backup policy that you want to assign to protected computers.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

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
Apply-VBRManagedByAgentPolicy [-Policy] <VBRComputerBackupJob[]> [-RunAsync] [<CommonParameters>]
```
