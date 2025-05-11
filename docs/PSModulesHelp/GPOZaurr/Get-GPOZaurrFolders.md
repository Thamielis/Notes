Get-GPOZaurrFolders
-------------------

### Synopsis
Retrieves information about GPO folders within specified domains.

---

### Description

This function retrieves information about various GPO folders within specified domains, such as PolicyDefinitions, Policies, Scripts, GPO Starters, NETLOGON Scripts, DfsrPrivate, and SYSVOL Root.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrFolders -Type All -FolderType All -Forest 'example.com' -IncludeDomains 'domain1', 'domain2' -ExcludeDomains 'domain3' -ExtendedForestInformation $info -AsHashTable
Retrieves information about all types of GPO folders within the specified domains in the forest 'example.com', excluding 'domain3', and including 'domain1' and 'domain2', with extended forest information.
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrFolders -Type Sysvol -FolderType NTFRS -Forest 'example.com' -IncludeDomains 'domain1' -AsHashTable
Retrieves information about Sysvol folders using NTFRS type within the specified domain 'domain1' in the forest 'example.com' and returns the output as a hashtable.
```

---

### Parameters
#### **Type**
Specifies the type of folders to retrieve. Valid values are 'All', 'Netlogon', 'Sysvol'.
Valid Values:

* All
* Netlogon
* Sysvol

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **FolderType**
Specifies the type of folders to retrieve. Valid values are 'All', 'NTFRS', 'Empty'.
Valid Values:

* All
* NTFRS
* Empty

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Forest**
Specifies the forest name to retrieve information for.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |3       |false        |ForestName|

#### **ExcludeDomains**
Specifies domains to exclude from the retrieval.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **IncludeDomains**
Specifies domains to include in the retrieval.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |5       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

#### **AsHashTable**
Indicates whether to return the output as a hashtable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrFolders [[-Type] <String[]>] [[-FolderType] <String>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [-AsHashTable] [<CommonParameters>]
```
