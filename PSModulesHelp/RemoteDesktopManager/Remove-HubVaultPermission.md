Remove-HubVaultPermission
-------------------------

### Synopsis

---

### Description

---

### Parameters
#### **GroupId**
Id of user you want to remove all permissions from

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **UserId**
Id of user you want to remove all permissions from

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **VaultId**
Id of the Hub vault you want to remove all user permissions from

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
For more information, type "Get-Help Remove-HubVaultPermission -detailed". For technical information, type "Get-Help Remove-HubVaultPermission -full".

---

### Syntax
```PowerShell
Remove-HubVaultPermission [-UserId] <Guid> [-VaultId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Remove-HubVaultPermission [-GroupId] <Guid> [-VaultId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
