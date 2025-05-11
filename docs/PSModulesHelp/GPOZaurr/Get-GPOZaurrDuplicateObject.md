Get-GPOZaurrDuplicateObject
---------------------------

### Synopsis
Retrieves duplicate Group Policy Objects (GPOs) within a specified forest.

---

### Description

This function retrieves duplicate Group Policy Objects (GPOs) within a specified forest by comparing GPOs based on partial distinguished name matching.

---

### Examples
> EXAMPLE 1

Get-GPOZaurrDuplicateObject -Forest "contoso.com" -IncludeDomains "child1.contoso.com", "child2.contoso.com" -ExcludeDomains "child3.contoso.com" -ExtendedForestInformation $additionalInfo
Description
-----------
Retrieves duplicate GPOs within the "contoso.com" forest, including domains "child1.contoso.com" and "child2.contoso.com" while excluding "child3.contoso.com". Additional forest information is provided for the search.

---

### Parameters
#### **Forest**
Specifies the name of the forest to search for duplicate GPOs.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domain names to exclude from the search for duplicate GPOs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **IncludeDomains**
Specifies an array of domain names to include in the search for duplicate GPOs.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |3       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest to aid in the search for duplicate GPOs.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |4       |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrDuplicateObject [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
