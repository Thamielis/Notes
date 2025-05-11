Invoke-RDMLoadFromInventorySession
----------------------------------

### Synopsis
Invoke a Load from inventory action.

---

### Description

---

### Related Links
* [Invoke-RDMUnparentSession](Invoke-RDMUnparentSession)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $list = Get-RDMSession; Invoke-RDMLoadFromInventorySession -Session $list[0]; Set-RDMSession -Session $list[0] -Refresh
Invoke a Load from inventory on the first session in the list.
```

---

### Parameters
#### **Credential**
PSCredential object.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSCredential]`|false   |2       |true (ByValue)|

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
PSConnection object, must be retrieved from Get-RDMSession or created via New-RDMSession.

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
For more information, type "Get-Help Invoke-RDMLoadFromInventorySession -detailed". For technical information, type "Get-Help Invoke-RDMLoadFromInventorySession -full".

---

### Syntax
```PowerShell
Invoke-RDMLoadFromInventorySession [[-Credential] <PSCredential>] [-Session] <PSConnection[]> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
