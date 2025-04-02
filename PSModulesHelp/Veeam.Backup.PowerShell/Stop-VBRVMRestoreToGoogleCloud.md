Stop-VBRVMRestoreToGoogleCloud
------------------------------

### Synopsis
Stops running restore to Google Cloud Engine sessions.

---

### Description

This cmdlet stops specified restore to Google Cloud Engine sessions.

---

### Related Links
* [Get-VBRGoogleCloudRestoreSession](Get-VBRGoogleCloudRestoreSession)

---

### Examples
> Stopping Session of Machine Restore to Google Cloud Engine

$session = Get-VBRGoogleCloudRestoreSession -Session "New session"
Stop-VBRVMRestoreToGoogleCloud -Session $session
This example shows how to stop the New session restore session.

Perform the following steps:

1. Run the Get-VBRGoogleCloudRestoreSession cmdlet. Specify the Session parameter value. Save the result to the $session variable.
2. Run the Stop-VBRVMRestoreToGoogleCloud cmdlet. Set the $session variable as the Session parameter value.

---

### Parameters
#### **Session**
Specifies the restore to Google Cloud Engine session.
Accepts the VBRGoogleCloudRestoreSession object.
To get this object, run the Get-VBRGoogleCloudRestoreSession cmdlet.

|Type                            |Required|Position|PipelineInput |
|--------------------------------|--------|--------|--------------|
|`[VBRGoogleCloudRestoreSession]`|true    |named   |True (ByValue)|

#### **Wait**
Defines that the command will wait for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRGoogleCloudRestoreSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRVMRestoreToGoogleCloud -Session <VBRGoogleCloudRestoreSession> [-Wait] [<CommonParameters>]
```
