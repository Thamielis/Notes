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
#### **Refresh**
Send refresh notification to Remote Desktop Manager application.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

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
Invoke-RDMUnparentSession [-Session] <PSConnection[]> [[-Refresh]] [<CommonParameters>]
```
