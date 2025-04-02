New-HubSystemPermission
-----------------------

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

#### **SystemPermission**
Set system permission

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[SystemPermission]`|true    |named   |false        |

#### **UserId**
Id of the Hub User

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
For more information, type "Get-Help New-HubSystemPermission -detailed". For technical information, type "Get-Help New-HubSystemPermission -full".

---

### Syntax
```PowerShell
New-HubSystemPermission -UserId <Guid> -SystemPermission <SystemPermission> [-HubContext <HubContext>] [<CommonParameters>]
```
```PowerShell
New-HubSystemPermission -GroupId <Guid> -SystemPermission <SystemPermission> [-HubContext <HubContext>] [<CommonParameters>]
```
