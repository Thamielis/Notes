Set-HubVault
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

#### **PSVault**
Hub vault

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[PSVault]`|false   |1       |false        |

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
For more information, type "Get-Help Set-HubVault -detailed". For technical information, type "Get-Help Set-HubVault -full".

---

### Syntax
```PowerShell
Set-HubVault [-VaultId] <Guid> [[-PSVault] <PSVault>] [[-HubContext] <HubContext>] [<CommonParameters>]
```
