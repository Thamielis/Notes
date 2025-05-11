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
Invoke-RDMLoadFromInventorySession [[-Credential] <PSCredential>] [-Session] <PSConnection[]> [<CommonParameters>]
```
