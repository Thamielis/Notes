Set-HubEntryPermission
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
|`[Guid]`|true    |1       |false        |

#### **EntryPermission**
Set custom entry permission

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[EntryPermission]`|true    |1       |false        |

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
Set predefined permissions based on Hub Entry Roles

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[EntryRole]`|true    |1       |false        |

#### **UserId**
Id of the Hub User

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

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
For more information, type "Get-Help Set-HubEntryPermission -detailed". For technical information, type "Get-Help Set-HubEntryPermission -full".

---

### Syntax
```PowerShell
Set-HubEntryPermission [-UserId] <Guid> [-Role] <Readers | Operators | Contributors | Managers> [-VaultId] <Guid> [-EntryId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Set-HubEntryPermission [-UserId] <Guid> [-EntryPermission] <EntryPermission> [-VaultId] <Guid> [-EntryId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Set-HubEntryPermission [-GroupId] <Guid> [-Role] <Readers | Operators | Contributors | Managers> [-VaultId] <Guid> [-EntryId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Set-HubEntryPermission [-GroupId] <Guid> [-EntryPermission] <EntryPermission> [-VaultId] <Guid> [-EntryId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
