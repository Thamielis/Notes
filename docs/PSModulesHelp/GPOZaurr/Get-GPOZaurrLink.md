Get-GPOZaurrLink
----------------

### Synopsis
Retrieves Group Policy Object (GPO) links based on specified criteria.

---

### Description

This function retrieves GPO links based on various parameters such as ADObject, Filter, Linked, Site, etc. It provides flexibility in searching for GPO links within Active Directory.

---

### Examples
> EXAMPLE 1

Get-GPOZaurrLink -ADObject $ADObject -Linked 'All'
Description
-----------
Retrieves all linked GPOZaurr links for the specified Active Directory object(s).
> EXAMPLE 2

Get-GPOZaurrLink -Filter "(objectClass -eq 'organizationalUnit')" -SearchBase 'CN=Configuration,DC=ad,DC=evotec,DC=xyz'
Description
-----------
Retrieves GPOZaurr links based on the specified filter and search base.

---

### Parameters
#### **ADObject**
Specifies the Active Directory object(s) to search for GPO links.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[ADObject[]]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Filter**
Specifies the filter criteria to search for GPO links.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SearchBase**
Specifies the search base for filtering GPO links.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SearchScope**
Specifies the search scope for filtering GPO links.
Valid Values:

* Base
* OneLevel
* Subtree

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ADSearchScope]`|false   |named   |false        |

#### **Linked**
Specifies the type of linked GPOs to retrieve. Valid values are 'All', 'Root', 'DomainControllers', 'Site', and 'OrganizationalUnit'.
Valid Values:

* All
* Root
* DomainControllers
* Site
* OrganizationalUnit

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Site**
Specifies the site(s) to search for GPO links.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Limited**
Indicates whether to limit the search results.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipDuplicates**
Indicates whether to skip duplicate search results.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GPOCache**
Specifies a cache for storing GPO information.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **Forest**
Specifies the forest name for filtering GPO links.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies the domains to exclude from the search.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies the domains to include in the search.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **AsHashTable**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Summary**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrLink [-Linked <String[]>] [-Limited] [-SkipDuplicates] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-AsHashTable] [-Summary] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrLink -ADObject <ADObject[]> [-Limited] [-SkipDuplicates] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-AsHashTable] [-Summary] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrLink [-Filter <String>] [-SearchBase <String>] [-SearchScope {Base | OneLevel | Subtree}] [-Limited] [-SkipDuplicates] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-AsHashTable] [-Summary] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrLink [-Site <String[]>] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-AsHashTable] [-Summary] [<CommonParameters>]
```
