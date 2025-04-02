New-HubSystemVaultPermission
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
|`[Guid]`|true    |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **SystemVaultPermission**
Set custom system vault permission

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VaultPermission]`|true    |named   |false        |

#### **UserId**
Id of the Hub User

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **VaultRoleId**
Set predefined permissions based on Hub Vault Roles

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
For more information, type "Get-Help New-HubSystemVaultPermission -detailed". For technical information, type "Get-Help New-HubSystemVaultPermission -full".

---

### Syntax
```PowerShell
New-HubSystemVaultPermission -UserId <Guid> -VaultRoleId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubSystemVaultPermission -UserId <Guid> -SystemVaultPermission <VaultPermission> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubSystemVaultPermission -GroupId <Guid> -VaultRoleId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubSystemVaultPermission -GroupId <Guid> -SystemVaultPermission <VaultPermission> [-HubContext <HubContext>] [<CommonParameters>]
```
