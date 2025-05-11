Get-GPOZaurrPermissionIssue
---------------------------

### Synopsis
Detects Group Policy missing Authenticated Users permission while not having higher permissions.

---

### Description

Detects Group Policy missing Authenticated Users permission while not having higher permissions.

---

### Examples
> EXAMPLE 1

```PowerShell
$Issues = Get-GPOZaurrPermissionIssue
$Issues | Format-Table
```

---

### Parameters
#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |3       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |4       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GPOZaurrPermissionIssue [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
