Get-HubEntry
------------

### Synopsis

---

### Description

---

### Parameters
#### **EntryId**
Id of the Hub entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |1       |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **VaultId**
Id of the Hub vault

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-HubEntry -detailed". For technical information, type "Get-Help Get-HubEntry -full".

---

### Syntax
```PowerShell
Get-HubEntry [-VaultId] <Guid> [[-EntryId] <Guid>] [[-HubContext] <HubContext>] [<CommonParameters>]
```
