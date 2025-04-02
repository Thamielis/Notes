Remove-HubEntry
---------------

### Synopsis

---

### Description

---

### Parameters
#### **EntryId**
Id of the Hub entry you want to remove

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **VaultId**
Id of the Hub vault you want to remove the entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-HubEntry -detailed". For technical information, type "Get-Help Remove-HubEntry -full".

---

### Syntax
```PowerShell
Remove-HubEntry -VaultId <Guid> -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
