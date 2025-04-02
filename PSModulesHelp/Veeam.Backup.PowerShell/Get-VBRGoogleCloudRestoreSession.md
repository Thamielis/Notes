Get-VBRGoogleCloudRestoreSession
--------------------------------

### Synopsis
Returns restore to Google Cloud sessions.

---

### Description

This cmdlet returns restore to Google Cloud sessions.

---

### Examples
> Getting Session of Machine Restore to Google Compute Engine

```PowerShell
Get-VBRGoogleCloudRestoreSession -Session "New session"
This command gets the New session restore session.
```

---

### Parameters
#### **Id**
Specifies restore session ID.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |False        |

#### **Session**
Specifies restore session name.
Accepts the VBRGoogleCloudRestoreSession object.
To create this object, run the Start-VBRVMRestoreToGoogleCloud cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudRestoreSession]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRGoogleCloudRestoreSession [-Id <Guid>] [-Session <VBRGoogleCloudRestoreSession>] [<CommonParameters>]
```
