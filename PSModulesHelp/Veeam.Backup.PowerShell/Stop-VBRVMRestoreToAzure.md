Stop-VBRVMRestoreToAzure
------------------------

### Synopsis
Stops running VM backup restore to Microsoft Azure sessions.

---

### Description

This cmdlet stops a selected VM backup restore to Microsoft Azure session.

---

### Examples
> Example 1

$session = Get-VBRAzureRestoreSession | Sort-Object CreationTime -Descending | Select -First 1
Stop-VBRVMRestoreToAzure -Session $session
This example shows how to stop the most recent restore to Azure session.
Perform the following steps:
1. Get the most recent restore to Azure session:
- Run the Get-VBRAzureRestoreSession cmdlet.
- Pipe the cmdlet output to the Sort-Object cmdlet. Specify the CreationTime parameter.
- Pipe the cmdlet output to the Select cmdlet. Specify the First parameter.
- Save the result to the $session variable.
2. Run the Stop-VBRVMRestoreToAzure cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **Session**
Specifies the restore session you want to stop.

|Type                      |Required|Position|PipelineInput |
|--------------------------|--------|--------|--------------|
|`[VBRAzureRestoreSession]`|true    |named   |True (ByValue)|

#### **Wait**
Defines that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureRestoreSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRVMRestoreToAzure -Session <VBRAzureRestoreSession> [-Wait] [<CommonParameters>]
```
