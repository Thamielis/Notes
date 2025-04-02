Remove-HubEntryPermission
-------------------------

### Synopsis

---

### Description

---

### Parameters
#### **EntryId**
Id of the Hub entry you want to remove all user permissions from

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **GroupId**
Id of user you want to remove all permissions from

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **UserId**
Id of user you want to remove all permissions from

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **VaultId**
Id of the Hub vault

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
For more information, type "Get-Help Remove-HubEntryPermission -detailed". For technical information, type "Get-Help Remove-HubEntryPermission -full".

---

### Syntax
```PowerShell
Remove-HubEntryPermission -UserId <Guid> -VaultId <Guid> -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
Remove-HubEntryPermission -GroupId <Guid> -VaultId <Guid> -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
