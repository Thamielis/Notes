Get-RDMPrivateSessionDocumentStoredInDatabase
---------------------------------------------

### Synopsis
Get documents stored in database

---

### Description

Get documents stored in database

---

### Parameters
#### **ForcePromptAnswer**
Switch to use with caution. It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions. In case of multiple prompts, multiple values can be passed to this parameter. Here are the accepted values:
* Yes: Accept the prompt. Cover the OK and Automatic value.
* No: Refuse the yes/no/cancel prompt. Cancel is the fallback option if there is not an option No.
* Cancel: Cancel the yes/no/cancel prompt. No is the fallback option if there is not an option Cancel.
Valid Values:

* Cancel
* No
* Yes

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[DialogResult[]]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionDocument

---

### Notes
For more information, type "Get-Help Get-RDMPrivateSessionDocumentStoredInDatabase -detailed". For technical information, type "Get-Help Get-RDMPrivateSessionDocumentStoredInDatabase -full".

---

### Syntax
```PowerShell
Get-RDMPrivateSessionDocumentStoredInDatabase [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
