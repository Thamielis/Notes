Stop-VBRSession
---------------

### Synopsis
Stops tape jobs sessions.

---

### Description

This cmdlet stops running tape jobs sessions.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRSession](Get-VBRSession)

---

### Examples
> Stopping Session for Tape Job

$job = Get-VBRJob -Name "Backup Copy Job"
$session = Get-VBRSession -Job $job
Stop-VBRSession -Session $session
This example shows how to stop the session for the specified tape job.
Perform the following steps:
1. Run the Get-VBRTapeJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRSession cmdlet. Set the $job variable as the Job parameter value. Save the result to the $session variable.
3. Run the Stop-VBRSession cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **Session**
Specifies a running tape job session. The cmdlet will stop this session.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[VBRSession]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Wait**
Defines that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRSession -Session <VBRSession> [-Wait] [<CommonParameters>]
```
