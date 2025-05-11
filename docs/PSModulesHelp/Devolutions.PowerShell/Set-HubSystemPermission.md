Set-HubSystemPermission
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
|`[Guid]`|true    |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

#### **SystemPermission**
Set system permission

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[SystemPermission]`|true    |named   |false        |

#### **UserId**
User Id

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
For more information, type "Get-Help Set-HubSystemPermission -detailed". For technical information, type "Get-Help Set-HubSystemPermission -full".

---

### Syntax
```PowerShell
Set-HubSystemPermission -UserId <Guid> -SystemPermission <SystemPermission> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
Set-HubSystemPermission -GroupId <Guid> -SystemPermission <SystemPermission> [-HubContext <HubContext>] [<CommonParameters>]
```
