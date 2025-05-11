Get-GPOZaurrFiles
-----------------

### Synopsis
Retrieves information about Group Policy Objects (GPOs) stored in SYSVOL and NETLOGON folders.

---

### Description

This function retrieves information about GPOs stored in SYSVOL and NETLOGON folders of specified domains. It can filter by type of files and hash algorithms used for verification.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrFiles -Type 'All' -HashAlgorithm 'SHA256' -Signature
Retrieves all files from SYSVOL and NETLOGON folders with SHA256 hash algorithm and includes file signatures.
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrFiles -Type 'Sysvol' -HashAlgorithm 'MD5' -AsHashTable
Retrieves only SYSVOL files with MD5 hash algorithm and returns the results as a hashtable.
```

---

### Parameters
#### **Type**
Specifies the type of files to retrieve. Valid values are 'All', 'Netlogon', and 'Sysvol'.
Valid Values:

* All
* Netlogon
* Sysvol

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **HashAlgorithm**
Specifies the hash algorithm to use for file verification. Valid values are 'None', 'MACTripleDES', 'MD5', 'RIPEMD160', 'SHA1', 'SHA256', 'SHA384', 'SHA512'.
Valid Values:

* None
* MACTripleDES
* MD5
* RIPEMD160
* SHA1
* SHA256
* SHA384
* SHA512

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Signature**
Indicates whether to include file signatures for verification.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsHashTable**
Indicates whether to return the results as a hashtable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Extended**
Indicates whether to include extended information about the forest.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExtendedMetaData**
Indicates whether to include extended metadata information.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Forest**
Specifies the forest name to retrieve GPO information from.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |3       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the search.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the search.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |5       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional forest information to include.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |6       |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrFiles [[-Type] <String[]>] [[-HashAlgorithm] <String>] [-Signature] [-AsHashTable] [-Extended] [-ExtendedMetaData] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
