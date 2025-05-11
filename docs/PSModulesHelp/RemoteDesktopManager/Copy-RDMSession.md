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
|`[Switch]`|false   |3       |false        |

#### **IncludePasswordHistory**
Include password history in the session copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

#### **IncludeSubConnections**
Include sub connections in the session copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |4       |false        |

#### **PSConnection**
Session to copy

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PSConnection[]]`|true    |1       |false        |

#### **ResolveVariables**
Resolve variables in the session copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |5       |false        |

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
Copy-RDMSession [-PSConnection] <PSConnection[]> [[-DontChangeID]] [[-IncludePasswordHistory]] [[-IncludeSubConnections]] [[-ResolveVariables]] [<CommonParameters>]
```
