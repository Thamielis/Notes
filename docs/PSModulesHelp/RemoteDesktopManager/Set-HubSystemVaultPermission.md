Set-HubSystemVaultPermission
----------------------------

### Synopsis

---

### Description

---

### Parameters
#### **GroupId**
Id of the Hub Group

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **Role**
Set predefined permissions based on Hub Vault Roles

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[VaultRole]`|true    |1       |false        |

#### **SystemVaultPermission**
Set custom system vault permission

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VaultPermission]`|true    |1       |false        |

#### **UserId**
Id of the Hub User

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
For more information, type "Get-Help Set-HubSystemVaultPermission -detailed". For technical information, type "Get-Help Set-HubSystemVaultPermission -full".

---

### Syntax
```PowerShell
Set-HubSystemVaultPermission [-UserId] <Guid> [-Role] <Readers | Operators | Contributors | Managers> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Set-HubSystemVaultPermission [-UserId] <Guid> [-SystemVaultPermission] <VaultPermission> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Set-HubSystemVaultPermission [-GroupId] <Guid> [-Role] <Readers | Operators | Contributors | Managers> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Set-HubSystemVaultPermission [-GroupId] <Guid> [-SystemVaultPermission] <VaultPermission> [[-HubContext] <HubContext>] [<CommonParameters>]
```
