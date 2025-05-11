Remove-HubSystemPermission
--------------------------

### Synopsis

---

### Description

---

### Parameters
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

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Remove-HubSystemPermission -detailed". For technical information, type "Get-Help Remove-HubSystemPermission -full".

---

### Syntax
```PowerShell
Remove-HubSystemPermission -UserId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
Remove-HubSystemPermission -GroupId <Guid> [-HubContext <HubContext>] [<CommonParameters>]
```
