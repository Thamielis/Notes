Get-WinADDSAGuid
----------------

### Synopsis
Get DSA GUIDs from a forest for all domain controllers

---

### Description

This function retrieves DSA GUIDs from a forest for all domain controllers

---

### Examples
> EXAMPLE 1

```PowerShell
Get-WinADDSAGuid | Format-Table
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

#### **ExcludeDomainControllers**
Exclude specific domain controllers, by default there are no exclusions, as long as VerifyDomainControllers switch is enabled. Otherwise this parameter is ignored.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **IncludeDomainControllers**
Include only specific domain controllers, by default all domain controllers are included, as long as VerifyDomainControllers switch is enabled. Otherwise this parameter is ignored.

|Type        |Required|Position|PipelineInput|Aliases                           |
|------------|--------|--------|-------------|----------------------------------|
|`[String[]]`|false   |5       |false        |DomainControllers<br/>ComputerName|

#### **SkipRODC**
Skip Read-Only Domain Controllers. By default all domain controllers are included.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-WinADDSAGuid [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-ExcludeDomainControllers] <String[]>] [[-IncludeDomains] <String[]>] [[-IncludeDomainControllers] <String[]>] [-SkipRODC] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
