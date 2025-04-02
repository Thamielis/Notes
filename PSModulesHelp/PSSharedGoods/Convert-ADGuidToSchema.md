Convert-ADGuidToSchema
----------------------

### Synopsis
Converts Guid to schema properties

---

### Description

Converts Guid to schema properties

---

### Examples
> EXAMPLE 1

```PowerShell
$T2 = '570b9266-bbb3-4fad-a712-d2e3fedc34dd'
$T = [guid] '570b9266-bbb3-4fad-a712-d2e3fedc34dd'
Convert-ADGuidToSchema -Guid $T
Convert-ADGuidToSchema -Guid $T2
```

---

### Parameters
#### **Guid**
Guid to Convert to Schema Name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Domain**
Domain to query. By default the current domain is used

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RootDSE**
RootDSE to query. By default RootDSE is queried from the domain

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[ADEntity]`|false   |3       |false        |

#### **DisplayName**
Return the schema name by display name. By default it returns as Name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-ADGuidToSchema [[-Guid] <String>] [[-Domain] <String>] [[-RootDSE] <ADEntity>] [-DisplayName] [<CommonParameters>]
```
