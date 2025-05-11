Get-HubSystemPermission
-----------------------

### Synopsis

---

### Description

---

### Parameters
#### **GroupId**
Group Id

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |1       |false        |

#### **UserId**
User Id

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
For more information, type "Get-Help Get-HubSystemPermission -detailed". For technical information, type "Get-Help Get-HubSystemPermission -full".

---

### Syntax
```PowerShell
Get-HubSystemPermission [-UserId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
```PowerShell
Get-HubSystemPermission [-GroupId] <Guid> [[-HubContext] <HubContext>] [<CommonParameters>]
```
