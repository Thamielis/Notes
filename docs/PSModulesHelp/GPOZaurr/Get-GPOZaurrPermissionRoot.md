Get-GPOZaurrPermissionRoot
--------------------------

### Synopsis
Retrieves the root permissions of Group Policy Objects (GPOs) based on specified criteria.

---

### Description

Retrieves the root permissions of GPOs based on the specified criteria, including filtering by permission types, forest, domains, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrPermissionRoot -IncludePermissionType 'GpoRootCreate' -ExcludePermissionType 'GpoRootOwner' -Forest 'ExampleForest' -IncludeDomains 'Domain1', 'Domain2' -ExtendedForestInformation $ForestInfo -SkipNames
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrPermissionRoot -IncludePermissionType 'GpoRootOwner' -ExcludePermissionType 'GpoRootCreate' -Forest 'AnotherForest' -ExcludeDomains 'Domain3' -SkipNames
```

---

### Parameters
#### **IncludePermissionType**
Specifies the root permission types to include in the search.
Valid Values:

* GpoRootCreate
* GpoRootOwner

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **ExcludePermissionType**
Specifies the root permission types to exclude from the search.
Valid Values:

* GpoRootCreate
* GpoRootOwner

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Forest**
Specifies the target forest. By default, the current forest is used.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |3       |false        |ForestName|

#### **ExcludeDomains**
Specifies domains to exclude from the search.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **IncludeDomains**
Specifies domains to include in the search.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |5       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Provides additional forest information to speed up processing.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

#### **SkipNames**
Skips processing names during the operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GPOZaurrPermissionRoot [[-IncludePermissionType] <String[]>] [[-ExcludePermissionType] <String[]>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [-SkipNames] [<CommonParameters>]
```
