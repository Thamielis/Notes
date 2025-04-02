Get-ComputerRoles
-----------------

### Synopsis
Get Computer/Server Roles

---

### Description

Get Computer/Server Roles

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerRoles -ComputerName AD1 -EnabledOnly -FeatureType Role | Format-Table
```

---

### Parameters
#### **ComputerName**
Parameter description

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **FeatureType**
Display all or limited types. Choices are Role, Role Service and Feature.
Valid Values:

* Role
* Role Service
* Feature

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **EnabledOnly**
Display only enabled/installed features or roles

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-ComputerRoles [[-ComputerName] <String[]>] [[-FeatureType] <Object>] [-EnabledOnly] [<CommonParameters>]
```
