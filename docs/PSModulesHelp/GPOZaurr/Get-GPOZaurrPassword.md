Get-GPOZaurrPassword
--------------------

### Synopsis
Tries to find CPassword in Group Policies or given path and translate it to readable value

---

### Description

Tries to find CPassword in Group Policies or given path and translate it to readable value

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrPassword -GPOPath 'C:\Users\przemyslaw.klys\Desktop\GPOExport_2020.10.12'
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrPassword
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

#### **GPOPath**
Path where Group Policy content is located or where backup is located

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GPOZaurrPassword [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-GPOPath] <String[]>] [<CommonParameters>]
```
