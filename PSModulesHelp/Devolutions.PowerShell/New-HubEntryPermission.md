New-HubEntryPermission
----------------------

### Synopsis

---

### Description

---

### Parameters
#### **EntryId**
Id of the Hub Entry

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **EntryPermission**
Set custom entry permission

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[EntryPermissionRole]`|true    |named   |false        |

#### **EntryRoleId**
Set predefined permissions based on Hub Entry Roles

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

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

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-HubEntryPermission -detailed". For technical information, type "Get-Help New-HubEntryPermission -full".

---

### Syntax
```PowerShell
New-HubEntryPermission -UserId <Guid> -EntryRoleId <Guid> -VaultId <Guid> -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubEntryPermission -UserId <Guid> -EntryPermission <EntryPermissionRole> -VaultId <Guid> -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubEntryPermission -GroupId <Guid> -EntryRoleId <Guid> -VaultId <Guid> -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubEntryPermission -GroupId <Guid> -EntryPermission <EntryPermissionRole> -VaultId <Guid> -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
