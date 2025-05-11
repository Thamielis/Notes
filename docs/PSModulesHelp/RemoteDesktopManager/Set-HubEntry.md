Set-HubEntry
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
|`[Guid]`|true    |1       |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **PSDecryptedEntry**
Hub connection

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[PSDecryptedEntry]`|true    |1       |false        |

#### **VaultId**
Id of the Hub vault you want to set the entry

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
For more information, type "Get-Help Set-HubEntry -detailed". For technical information, type "Get-Help Set-HubEntry -full".

---

### Syntax
```PowerShell
Set-HubEntry [-VaultId] <Guid> [-EntryId] <Guid> [-PSDecryptedEntry] <PSDecryptedEntry> [[-HubContext] <HubContext>] [<CommonParameters>]
```
