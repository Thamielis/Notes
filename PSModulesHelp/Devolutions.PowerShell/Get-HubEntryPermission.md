Get-HubEntryPermission
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

#### **GroupId**
Group Id

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **UserId**
User Id

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **VaultId**
Id of the Hub vault

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Get-HubEntryPermission -detailed". For technical information, type "Get-Help Get-HubEntryPermission -full".

---

### Syntax
```PowerShell
Get-HubEntryPermission -UserId <Guid> [-VaultId <Guid>] -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
Get-HubEntryPermission -GroupId <Guid> [-VaultId <Guid>] -EntryId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
