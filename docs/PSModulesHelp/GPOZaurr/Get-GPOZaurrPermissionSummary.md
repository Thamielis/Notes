Get-GPOZaurrPermissionSummary
-----------------------------

### Synopsis
Retrieves a summary of Group Policy Object (GPO) permissions based on specified criteria.

---

### Description

Retrieves a summary of GPO permissions based on the specified criteria, including filtering by permission types, permit types, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrPermissionSummary -Type 'All' -PermitType 'Allow' -IncludePermissionType 'GpoApply', 'GpoEdit' -ExcludePermissionType 'GpoOwner' -Forest 'ExampleForest' -IncludeDomains 'Domain1', 'Domain2' -ExtendedForestInformation $ForestInfo -Separator '|'
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrPermissionSummary -Type 'Administrative' -PermitType 'All' -IncludePermissionType 'GpoRead' -ExcludePermissionType 'GpoRootOwner' -Forest 'AnotherForest' -ExcludeDomains 'Domain3' -Separator ','
```

---

### Parameters
#### **Type**
Specifies the type of permissions to include. Options include 'AuthenticatedUsers', 'DomainComputers', 'Unknown', 'WellKnownAdministrative', 'NotWellKnown', 'NotWellKnownAdministrative', 'NotAdministrative', 'Administrative', and 'All'.
Valid Values:

* AuthenticatedUsers
* DomainComputers
* Unknown
* WellKnownAdministrative
* NotWellKnown
* NotWellKnownAdministrative
* NotAdministrative
* Administrative
* All

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **PermitType**
Specifies the type of permission to permit. Options include 'Allow', 'Deny', and 'All'.
Valid Values:

* Allow
* Deny
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **IncludePermissionType**
Specifies the permission types to include in the summary.
Valid Values:

* GpoApply
* GpoEdit
* GpoCustom
* GpoEditDeleteModifySecurity
* GpoRead
* GpoOwner
* GpoRootCreate
* GpoRootOwner

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **ExcludePermissionType**
Specifies the permission types to exclude from the summary.
Valid Values:

* GpoApply
* GpoEdit
* GpoCustom
* GpoEditDeleteModifySecurity
* GpoRead
* GpoOwner
* GpoRootCreate
* GpoRootOwner

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **Forest**
Specifies the target forest. By default, the current forest is used.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |5       |false        |ForestName|

#### **ExcludeDomains**
Specifies domains to exclude from the search.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **IncludeDomains**
Specifies domains to include in the search.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |7       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Provides additional forest information to speed up processing.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |8       |false        |

#### **Separator**
Specifies the separator to use in the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GPOZaurrPermissionSummary [[-Type] <String[]>] [[-PermitType] <String>] [[-IncludePermissionType] <String[]>] [[-ExcludePermissionType] <String[]>] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [[-Separator] <String>] [<CommonParameters>]
```
