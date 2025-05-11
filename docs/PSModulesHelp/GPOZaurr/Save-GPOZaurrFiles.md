Save-GPOZaurrFiles
------------------

### Synopsis
Exports GPO XML data to files and saves it to a given path

---

### Description

Exports GPO XML data to files and saves it to a given path

---

### Examples
> EXAMPLE 1

```PowerShell
Save-GPOZaurrFiles -GPOPath 'C:\Support\GitHub\GpoZaurr\Ignore\GPOExportEvotec' -DeleteExisting -Verbose
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
Path where to save XML files from GPOReport

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **DeleteExisting**
Delete existing files before saving new ones

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Save-GPOZaurrFiles [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-GPOPath] <String[]>] [-DeleteExisting] [<CommonParameters>]
```
