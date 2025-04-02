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
|`[Guid]`|true    |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **UserId**
Id of the Hub User

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **VaultId**
Id of the Hub Vault

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **VaultPermission**
Set custom vault permission

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VaultPermissionRole]`|true    |named   |false        |

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
For more information, type "Get-Help New-HubVaultPermission -detailed". For technical information, type "Get-Help New-HubVaultPermission -full".

---

### Syntax
```PowerShell
New-HubVaultPermission -UserId <Guid> -VaultRoleId <Guid> -VaultId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubVaultPermission -UserId <Guid> -VaultPermission <VaultPermissionRole> -VaultId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubVaultPermission -GroupId <Guid> -VaultRoleId <Guid> -VaultId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubVaultPermission -GroupId <Guid> -VaultPermission <VaultPermissionRole> -VaultId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
