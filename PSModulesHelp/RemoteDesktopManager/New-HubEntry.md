New-HubEntry
------------

### Synopsis

---

### Description

---

### Parameters
#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **PSDecryptedEntry**
Hub entry

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[PSDecryptedEntry]`|true    |1       |false        |

#### **VaultId**
Id of the Hub vault you want to create the entry

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
For more information, type "Get-Help New-HubEntry -detailed". For technical information, type "Get-Help New-HubEntry -full".

---

### Syntax
```PowerShell
New-HubEntry [-VaultId] <Guid> [-PSDecryptedEntry] <PSDecryptedEntry> [[-HubContext] <HubContext>] [<CommonParameters>]
```
