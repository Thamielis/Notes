Get-GPOZaurrPermission
----------------------

### Synopsis
Retrieves permissions for a Group Policy Object (GPO) based on specified criteria.

---

### Description

This function retrieves permissions for a specified GPO based on various criteria such as GPO name, GUID, principal, permission type, etc.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrPermission -GPOName "TestGPO" -Principal "Domain Admins" -PermitType "Allow"
Retrieves permissions for the GPO named "TestGPO" for the principal "Domain Admins" with permission type "Allow".
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrPermission -GPOGuid "12345678-1234-1234-1234-1234567890AB" -Type "Administrative" -PermitType "Deny"
Retrieves administrative permissions for the GPO with GUID "12345678-1234-1234-1234-1234567890AB" with permission type "Deny".
```

---

### Parameters
#### **GPOName**
Specifies the name of the GPO to retrieve permissions for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GPOGuid**
Specifies the GUID of the GPO to retrieve permissions for.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |GUID<br/>GPOID|

#### **Principal**
Specifies the principal for which permissions are to be retrieved.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PrincipalType**
Specifies the type of principal to be used for permission retrieval. Valid values are 'DistinguishedName', 'Name', 'NetbiosName', 'Sid'.
Valid Values:

* DistinguishedName
* Name
* NetbiosName
* Sid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Type**
Specifies the type of permissions to include. Valid values are 'AuthenticatedUsers', 'DomainComputers', 'Unknown', 'WellKnownAdministrative', 'NotWellKnown', 'NotWellKnownAdministrative', 'NotAdministrative', 'Administrative', 'All'.
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
|`[String[]]`|false   |named   |false        |

#### **SkipWellKnown**
Skips well-known permissions when retrieving permissions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipAdministrative**
Skips administrative permissions when retrieving permissions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeOwner**
Includes the owner of the GPO in the permission retrieval.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludePermissionType**
Specifies the permission types to include in the retrieval.
Valid Values:

* None
* GpoApply
* GpoRead
* GpoEdit
* GpoEditDeleteModifySecurity
* GpoCustom
* WmiFilterEdit
* WmiFilterFullControl
* WmiFilterCustom
* StarterGpoRead
* StarterGpoEdit
* StarterGpoFullControl
* StarterGpoCustom
* SomCreateWmiFilter
* SomWmiFilterFullControl
* SomCreateGpo
* SomCreateStarterGpo
* SomLogging
* SomPlanning
* SomLink

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[GPPermissionType[]]`|false   |named   |false        |

#### **ExcludePermissionType**
Specifies the permission types to exclude from the retrieval.
Valid Values:

* None
* GpoApply
* GpoRead
* GpoEdit
* GpoEditDeleteModifySecurity
* GpoCustom
* WmiFilterEdit
* WmiFilterFullControl
* WmiFilterCustom
* StarterGpoRead
* StarterGpoEdit
* StarterGpoFullControl
* StarterGpoCustom
* SomCreateWmiFilter
* SomWmiFilterFullControl
* SomCreateGpo
* SomCreateStarterGpo
* SomLogging
* SomPlanning
* SomLink

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[GPPermissionType[]]`|false   |named   |false        |

#### **PermitType**
Specifies the type of permissions to permit. Valid values are 'Allow', 'Deny', 'All'.
Valid Values:

* Allow
* Deny
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ExcludePrincipal**
Specifies principals to exclude from the permission retrieval.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ExcludePrincipalType**
Specifies the type of principal to exclude. Valid values are 'DistinguishedName', 'Name', 'Sid'.
Valid Values:

* DistinguishedName
* Name
* Sid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IncludeGPOObject**
Includes the GPO object in the permission retrieval.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Forest**
Specifies the forest to retrieve permissions from.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies domains to exclude from permission retrieval.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies domains to include in permission retrieval.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional forest information to include in the retrieval.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **ADAdministrativeGroups**
Specifies the administrative groups to include in the retrieval.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **ReturnSecurityWhenNoData**
If no data is found, returns all data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ReturnSingleObject**
Forces the return of a single object per GPO for processing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrPermission [-Principal <String[]>] [-PrincipalType <String>] [-Type <String[]>] [-SkipWellKnown] [-SkipAdministrative] [-IncludeOwner] [-IncludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-ExcludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-PermitType <String>] [-ExcludePrincipal <String[]>] [-ExcludePrincipalType <String>] [-IncludeGPOObject] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ReturnSecurityWhenNoData] [-ReturnSingleObject] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrPermission [-GPOName <String>] [-Principal <String[]>] [-PrincipalType <String>] [-Type <String[]>] [-SkipWellKnown] [-SkipAdministrative] [-IncludeOwner] [-IncludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-ExcludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-PermitType <String>] [-ExcludePrincipal <String[]>] [-ExcludePrincipalType <String>] [-IncludeGPOObject] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ReturnSecurityWhenNoData] [-ReturnSingleObject] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrPermission [-GPOGuid <String>] [-Principal <String[]>] [-PrincipalType <String>] [-Type <String[]>] [-SkipWellKnown] [-SkipAdministrative] [-IncludeOwner] [-IncludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-ExcludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-PermitType <String>] [-ExcludePrincipal <String[]>] [-ExcludePrincipalType <String>] [-IncludeGPOObject] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-ReturnSecurityWhenNoData] [-ReturnSingleObject] [<CommonParameters>]
```
