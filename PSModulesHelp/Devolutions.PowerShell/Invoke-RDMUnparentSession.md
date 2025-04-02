Invoke-RDMUnparentSession
-------------------------

### Synopsis
Invoke a refactoring action to move out a connection under a parent connection.

---

### Description

Move out a session under a parent session.

---

### Related Links
* [Invoke-RDMUnparentSession](Invoke-RDMUnparentSession)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $list = Get-RDMSession; $parent = $list[0]; Invoke-RDMUnparentSession -Session $parent.SubConnections -Refresh
The subconnections in the session in the variable $parent are unparented.
```

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

#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Session**
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession that you want to unparented.

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
For more information, type "Get-Help Invoke-RDMUnparentSession -detailed". For technical information, type "Get-Help Invoke-RDMUnparentSession -full".

---

### Syntax
```PowerShell
Invoke-RDMUnparentSession [-Refresh] [-Session] <PSConnection[]> [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
