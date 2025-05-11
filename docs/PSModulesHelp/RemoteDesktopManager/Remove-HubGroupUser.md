Remove-HubGroupUser
-------------------

### Synopsis

---

### Description

---

### Parameters
#### **GroupId**
Id of the Hub group

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **UserIds**
Id or List of ids of Hub user

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-HubGroupUser -detailed". For technical information, type "Get-Help Remove-HubGroupUser -full".

---

### Syntax
```PowerShell
Remove-HubGroupUser [-GroupId] <Guid> [-UserIds] <Guid[]> [[-HubContext] <HubContext>] [<CommonParameters>]
```
