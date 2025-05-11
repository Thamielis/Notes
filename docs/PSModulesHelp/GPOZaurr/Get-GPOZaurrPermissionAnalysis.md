Get-GPOZaurrPermissionAnalysis
------------------------------

### Synopsis
Analyzes permissions for Group Policy Objects (GPOs) and administrative groups.

---

### Description

This function analyzes permissions for Group Policy Objects (GPOs) and identifies administrative groups with specific permissions.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrPermissionAnalysis -Forest "ContosoForest" -IncludeDomains @("Domain1", "Domain2") -ExcludeDomains @("Domain3") -Permissions $PermissionsArray
Analyzes permissions for GPOs in the "ContosoForest" forest, including "Domain1" and "Domain2" while excluding "Domain3", using the specified permissions array.
```

---

### Parameters
#### **Forest**
Specifies the name of the forest to analyze.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the analysis.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the analysis.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |3       |false        |Domain<br/>Domains|

#### **Permissions**
Specifies an array of permissions to analyze.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |4       |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrPermissionAnalysis [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-Permissions] <Array>] [<CommonParameters>]
```
