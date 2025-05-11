Invoke-GPOZaurrPermission
-------------------------

### Synopsis
Sets permissions on Group Policy Objects (GPOs) based on specified criteria.

---

### Description

The Invoke-GPOZaurrPermission function sets permissions on GPOs based on various criteria such as GPO name, GPO GUID, AD objects, linked objects, permission levels, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-GPOZaurrPermission -GPOName "TestGPO" -PermissionRules { New-GPOPermission -Group "Domain Admins" -AccessLevel FullControl }
Description:
Sets FullControl permission for the "Domain Admins" group on the GPO named "TestGPO".
```
> EXAMPLE 2

```PowerShell
Get-GPO -All | Invoke-GPOZaurrPermission -PermissionRules { New-GPOPermission -Group "Help Desk" -AccessLevel Read } -Type "NotAdministrative"
Description:
Sets Read permission for the "Help Desk" group on all GPOs except administrative ones.
```

---

### Parameters
#### **PermissionRules**
Specifies the permission rules to apply to the GPOs. This can be a script block containing the permission rules.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **GPOName**
Specifies the name of the GPO to set permissions for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GPOGuid**
Specifies the GUID of the GPO to set permissions for.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |GUID<br/>GPOID|

#### **Level**
Specifies the permission level to set. This is a mandatory parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **Limit**
Specifies the limit for the permission level. This is a mandatory parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **Linked**
Specifies the type of linked object to set permissions for. Valid values are 'Root', 'DomainControllers', 'Site', 'OrganizationalUnit'.
Valid Values:

* Root
* DomainControllers
* Site
* OrganizationalUnit

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ADObject**
Specifies the Active Directory objects to set permissions for. This parameter accepts input from the pipeline and by property name.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[ADObject[]]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Filter**
Specifies the filter to apply when selecting objects. Default filter is "(objectClass -eq 'organizationalUnit' -or objectClass -eq 'domainDNS' -or objectClass -eq 'site')".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SearchBase**
Specifies the search base for filtering objects.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SearchScope**
Specifies the search scope for filtering objects.
Valid Values:

* Base
* OneLevel
* Subtree

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ADSearchScope]`|false   |named   |false        |

#### **Type**
Specifies the type of permissions to set. Valid values are 'Unknown', 'NotWellKnown', 'NotWellKnownAdministrative', 'NotAdministrative', 'All'.
Valid Values:

* Unknown
* NotWellKnown
* NotWellKnownAdministrative
* NotAdministrative
* All

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ApprovedGroups**
Specifies the approved groups for setting permissions.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |named   |false        |

#### **Trustee**

|Type     |Required|Position|PipelineInput|Aliases  |
|---------|--------|--------|-------------|---------|
|`[Array]`|false   |named   |false        |Principal|

#### **TrusteePermissionType**

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

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[GPPermissionType]`|false   |named   |false        |

#### **TrusteeType**

Valid Values:

* DistinguishedName
* Name
* Sid

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |named   |false        |PrincipalType|

#### **GPOCache**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **Forest**

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **LimitAdministrativeGroupsToDomain**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipDuplicates**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Invoke-GPOZaurrPermission [-PermissionRules <ScriptBlock>] -Level <Int32> -Limit <Int32> [-Type <String[]>] [-ApprovedGroups <Array>] [-Trustee <Array>] [-TrusteePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-TrusteeType <String>] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitAdministrativeGroupsToDomain] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-GPOZaurrPermission [-PermissionRules <ScriptBlock>] -Linked <String> [-Type <String[]>] [-ApprovedGroups <Array>] [-Trustee <Array>] [-TrusteePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-TrusteeType <String>] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitAdministrativeGroupsToDomain] [-SkipDuplicates] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-GPOZaurrPermission [-PermissionRules <ScriptBlock>] -ADObject <ADObject[]> [-Type <String[]>] [-ApprovedGroups <Array>] [-Trustee <Array>] [-TrusteePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-TrusteeType <String>] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitAdministrativeGroupsToDomain] [-SkipDuplicates] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-GPOZaurrPermission [-PermissionRules <ScriptBlock>] [-Filter <String>] [-SearchBase <String>] [-SearchScope {Base | OneLevel | Subtree}] [-Type <String[]>] [-ApprovedGroups <Array>] [-Trustee <Array>] [-TrusteePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-TrusteeType <String>] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitAdministrativeGroupsToDomain] [-SkipDuplicates] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-GPOZaurrPermission [-PermissionRules <ScriptBlock>] [-GPOName <String>] [-Type <String[]>] [-ApprovedGroups <Array>] [-Trustee <Array>] [-TrusteePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-TrusteeType <String>] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitAdministrativeGroupsToDomain] [-SkipDuplicates] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Invoke-GPOZaurrPermission [-PermissionRules <ScriptBlock>] [-GPOGuid <String>] [-Type <String[]>] [-ApprovedGroups <Array>] [-Trustee <Array>] [-TrusteePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-TrusteeType <String>] [-GPOCache <IDictionary>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitAdministrativeGroupsToDomain] [-SkipDuplicates] [-WhatIf] [-Confirm] [<CommonParameters>]
```
