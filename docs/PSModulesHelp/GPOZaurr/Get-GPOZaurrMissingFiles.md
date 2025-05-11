Get-GPOZaurrMissingFiles
------------------------

### Synopsis
Retrieves information about missing files in Group Policy Objects (GPOs) within a specified forest.

---

### Description

This function queries Active Directory for GPOs and checks for missing files within them. It provides detailed information about any errors found.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrMissingFiles -Forest "example.com" -IncludeDomains "domain1", "domain2" -ExcludeDomains "domain3" -GPOName "GPO1"
Retrieves information about missing files in the GPO named "GPO1" within the "example.com" forest, including only domains "domain1" and "domain2" while excluding "domain3".
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrMissingFiles -Forest "example.com" -IncludeDomains "domain1", "domain2" -GPOGUID "12345678-1234-1234-1234-1234567890AB" -BrokenOnly
Retrieves information about GPOs with missing files in the "example.com" forest, including only domains "domain1" and "domain2" for the GPO with the specified GUID, displaying only GPOs with missing files.
```

---

### Parameters
#### **Forest**
Specifies the name of the forest to query for GPO information.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the query.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the query.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |3       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |4       |false        |

#### **GPOName**
Specifies the name of the GPO to retrieve information for.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |5       |false        |Name   |

#### **GPOGUID**
Specifies the GUID of the GPO to retrieve information for.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **BrokenOnly**
Indicates whether to only display GPOs with missing files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrMissingFiles [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-GPOName] <String[]>] [[-GPOGUID] <String[]>] [-BrokenOnly] [<CommonParameters>]
```
