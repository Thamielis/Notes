Copy-RDMSession
---------------

### Synopsis
Copy a session.

---

### Description

Copy a session.

---

### Parameters
#### **DontChangeID**
Copy the session without changing the ID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **IncludePasswordHistory**
Include password history in the session copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeSubConnections**
Include sub connections in the session copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PSConnection**
Session to copy

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PSConnection[]]`|true    |1       |false        |

#### **ResolveVariables**
Resolve variables in the session copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

Session to copy

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Copy-RDMSession -detailed". For technical information, type "Get-Help Copy-RDMSession -full".

---

### Syntax
```PowerShell
Copy-RDMSession [-DontChangeID] [-IncludePasswordHistory] [-IncludeSubConnections] [-PSConnection] <PSConnection[]> [-ResolveVariables] [-ForcePromptAnswer <Cancel | No | Yes>] [<CommonParameters>]
```
