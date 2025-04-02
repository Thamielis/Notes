New-HubGroup
------------

### Synopsis

---

### Description

---

### Parameters
#### **GroupName**
Name of the Hub Group

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **GroupUserIds**
List of Hub user ids to insert in group

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |false        |

#### **HubContext**
Hub context

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[HubContext]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help New-HubGroup -detailed". For technical information, type "Get-Help New-HubGroup -full".

---

### Syntax
```PowerShell
New-HubGroup -GroupName <String> [-GroupUserIds <Guid[]>] [-HubContext <HubContext>] [<CommonParameters>]
```
