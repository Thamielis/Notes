Get-GPOZaurrFilesPolicyDefinition
---------------------------------

### Synopsis
Retrieves policy definitions for Group Policy Objects (GPOs) within specified domains.

---

### Description

This function retrieves policy definitions for GPOs within specified domains. It collects information about policy files, including their attributes and digital signatures.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrFilesPolicyDefinition -Forest "contoso.com" -IncludeDomains "domain1", "domain2" -ExcludeDomains "domain3" -Signature
Retrieves policy definitions for GPOs within the "contoso.com" forest, including domains "domain1" and "domain2" while excluding "domain3". Digital signature information is also retrieved.
```

---

### Parameters
#### **Forest**
Specifies the forest name to retrieve GPO policy definitions from.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the search.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the search.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |3       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional forest information to include in the output.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |4       |false        |

#### **Signature**
Indicates whether to retrieve digital signature information for policy files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrFilesPolicyDefinition [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [-Signature] [<CommonParameters>]
```
