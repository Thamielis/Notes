Remove-RDMUserSpecificSettings
------------------------------

### Synopsis
Remove the session user specific settings

---

### Description

Remove the session user specific settings

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

#### **Session**
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[PSConnection[]]`|true    |1       |true (ByValue)|

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-RDMUserSpecificSettings -detailed". For technical information, type "Get-Help Remove-RDMUserSpecificSettings -full".

---

### Syntax
```PowerShell
Remove-RDMUserSpecificSettings [-Session] <PSConnection[]> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
