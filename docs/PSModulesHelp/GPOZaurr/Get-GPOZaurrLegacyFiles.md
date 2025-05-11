Get-GPOZaurrLegacyFiles
-----------------------

### Synopsis
Retrieves legacy Group Policy Object (GPO) files from the SYSVOL directory of specified domains within a forest.

---

### Description

The Get-GPOZaurrLegacyFiles function retrieves legacy GPO files, such as '*.adm' and 'admfiles.ini', from the SYSVOL directory of specified domains within a forest. It provides detailed information about these files including their name, full path, creation time, last write time, attributes, associated domain name, and directory name.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrLegacyFiles -Forest "contoso.com" -IncludeDomains "domain1", "domain2" -ExcludeDomains "domain3" -ExtendedForestInformation $additionalInfo
Retrieves legacy GPO files from the "contoso.com" forest for "domain1" and "domain2" domains while excluding "domain3", using additional forest information.
```

---

### Parameters
#### **Forest**
Specifies the name of the forest from which to retrieve legacy GPO files.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |1       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domain names to exclude from the search for legacy GPO files.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **IncludeDomains**
Specifies an array of domain names to include in the search for legacy GPO files.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |3       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest to enhance the retrieval process.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |4       |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrLegacyFiles [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
