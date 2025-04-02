Get-HubVaultPermission
----------------------

### Synopsis

---

### Description

---

### Parameters
#### **GroupId**
Group Id

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **UserId**
User Id

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **VaultId**
Id of the Hub vault

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-HubVaultPermission -detailed". For technical information, type "Get-Help Get-HubVaultPermission -full".

---

### Syntax
```PowerShell
Get-HubVaultPermission [-UserId] <Guid> [[-VaultId] <Guid>] [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Get-HubVaultPermission [-GroupId] <Guid> [[-VaultId] <Guid>] [[-HubContext] <HubContext>] [<CommonParameters>]
```
