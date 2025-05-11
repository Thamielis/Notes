Get-GPOZaurrNetLogon
--------------------

### Synopsis
Retrieves information about Group Policy Objects (GPO) stored in the Netlogon and SYSVOL directories.

---

### Description

The Get-GPOZaurrNetLogon function retrieves details about GPOs stored in the Netlogon and SYSVOL directories of specified domains within a forest. It provides information about file ownership, status, domain, extension, creation time, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrNetLogon -Forest "contoso.com" -IncludeDomains "domain1", "domain2"
Retrieves GPO information for the specified forest and domains.
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrNetLogon -OwnerOnly
Retrieves GPO information only for GPOs with identified owners.
```
> EXAMPLE 3

```PowerShell
Get-GPOZaurrNetLogon -SkipOwner
Retrieves GPO information while skipping the owner check.
```

---

### Parameters
#### **OwnerOnly**
Specifies whether to include only GPOs with identified owners.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipOwner**
Specifies whether to skip checking the owner of GPOs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Forest**
Specifies the forest name to retrieve GPO information from.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from GPO retrieval.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies an array of domains to include in GPO retrieval.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional forest information to include in the output.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrNetLogon [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrNetLogon [-OwnerOnly] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrNetLogon [-SkipOwner] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
