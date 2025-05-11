Get-GPOZaurrPermissionConsistency
---------------------------------

### Synopsis
Retrieves information about Group Policy Objects (GPOs) and checks permission consistency across domains.

---

### Description

The Get-GPOZaurrPermissionConsistency function retrieves information about GPOs and checks permission consistency across domains. It can filter by GPO name, GPO GUID, or type of consistency. It also provides options to include/exclude specific domains and verify inheritance.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrPermissionConsistency -GPOName "TestGPO" -Forest "Contoso" -IncludeDomains @("DomainA", "DomainB") -Type "Consistent"
Retrieves permission consistency information for the GPO named "TestGPO" in the forest "Contoso" for domains "DomainA" and "DomainB" with consistent permissions.
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrPermissionConsistency -GPOGuid "12345678-1234-1234-1234-1234567890AB" -Forest "Fabrikam" -Type "Inconsistent" -VerifyInheritance
Retrieves permission consistency information for the GPO with GUID "12345678-1234-1234-1234-1234567890AB" in the forest "Fabrikam" for all domains with inconsistent permissions and verifies inheritance.
```

---

### Parameters
#### **GPOName**
Specifies the name of the GPO to retrieve.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GPOGuid**
Specifies the GUID of the GPO to retrieve.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |GUID<br/>GPOID|

#### **Type**
Specifies the type of consistency to check. Valid values are 'Consistent', 'Inconsistent', or 'All'.
Valid Values:

* Consistent
* Inconsistent
* All

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Forest**
Specifies the forest name to retrieve GPO information from.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the search.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the search.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **IncludeGPOObject**
Indicates whether to include the GPO object in the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VerifyInheritance**
Indicates whether to verify inheritance of permissions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrPermissionConsistency [-Type <String[]>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-IncludeGPOObject] [-VerifyInheritance] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrPermissionConsistency [-GPOName <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-IncludeGPOObject] [-VerifyInheritance] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrPermissionConsistency [-GPOGuid <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-IncludeGPOObject] [-VerifyInheritance] [<CommonParameters>]
```
