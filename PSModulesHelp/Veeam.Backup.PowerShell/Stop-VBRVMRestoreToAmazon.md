Stop-VBRVMRestoreToAmazon
-------------------------

### Synopsis
Stops running restore to Amazon EC2 sessions.

---

### Description

This cmdlet stops specified restore to Amazon EC2 sessions.

---

### Related Links
* [Get-VBRAmazonRestoreSession](Get-VBRAmazonRestoreSession)

---

### Examples
> Example 1

$session = Get-VBRAmazonRestoreSession -Session "New session"
Stop-VBRVMRestoreToAmazon -Session $session
Perform the following steps:
1. Run the Get-VBRAmazonRestoreSession cmdlet. Specify the Session parameter value. Save the result to the $session variable.
2. Run the Stop-VBRVMRestoreToAmazon cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **Session**
Specifies the active restore to Amazon EC2 session that you want to stop.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRAmazonRestoreSession]`|true    |named   |True (ByValue)|

#### **Wait**
Indicates that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonRestoreSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRVMRestoreToAmazon -Session <VBRAmazonRestoreSession> [-Wait] [<CommonParameters>]
```
