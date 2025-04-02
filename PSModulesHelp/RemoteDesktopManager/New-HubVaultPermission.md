New-HubVaultPermission
----------------------

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

#### **UserId**
Id of the Hub User

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **VaultId**
Id of the Hub Vault

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **VaultPermission**
Set custom vault permission

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VaultPermission]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-HubVaultPermission -detailed". For technical information, type "Get-Help New-HubVaultPermission -full".

---

### Syntax
```PowerShell
New-HubVaultPermission [-UserId] <Guid> [-Role] <Readers | Operators | Contributors | Managers> [-VaultId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubVaultPermission [-UserId] <Guid> [-VaultPermission] <VaultPermission> [-VaultId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubVaultPermission [-GroupId] <Guid> [-Role] <Readers | Operators | Contributors | Managers> [-VaultId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubVaultPermission [-GroupId] <Guid> [-VaultPermission] <VaultPermission> [-VaultId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
