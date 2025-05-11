Get-GPOZaurrBrokenLink
----------------------

### Synopsis
Finds any GPO link that doesn't have a matching GPO (already removed GPO).

---

### Description

Finds any GPO link that doesn't have a matching GPO (already removed GPO).

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrBrokenLink -Verbose | Format-Table -AutoSize *
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrBrokenLink -Verbose -IncludeDomains ad.evotec.pl | Format-Table -AutoSize *
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
Get-GPOZaurrBrokenLink [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
