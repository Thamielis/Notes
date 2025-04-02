Remove-HubSystemVaultPermission
-------------------------------

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

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-HubSystemVaultPermission -detailed". For technical information, type "Get-Help Remove-HubSystemVaultPermission -full".

---

### Syntax
```PowerShell
Remove-HubSystemVaultPermission [-UserId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Remove-HubSystemVaultPermission [-GroupId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
