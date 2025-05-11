Add-GPOZaurrPermission
----------------------

### Synopsis
Adds permissions to a Group Policy Object (GPO) in Active Directory.

---

### Description

This function allows you to add permissions to a specified GPO in Active Directory. You can specify the GPO by name, GUID, or apply permissions to all GPOs. Various parameters allow you to customize the permission settings.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-GPOZaurrPermission -GPOName "TestGPO" -Principal "User1" -PermissionType Read -PermitType Allow
Adds read permission to "User1" for the GPO named "TestGPO".
```
> EXAMPLE 2

```PowerShell
Add-GPOZaurrPermission -GPOGuid "12345678-1234-1234-1234-1234567890AB" -Principal "Group1" -PermissionType Write -PermitType Deny
Denies write permission to "Group1" for the GPO with the specified GUID.
```

---

### Parameters
#### **GPOName**
Specifies the name of the GPO to which permissions will be added.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **GPOGuid**
Specifies the GUID of the GPO to which permissions will be added.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|true    |named   |false        |GUID<br/>GPOID|

#### **All**
Indicates that permissions should be added to all GPOs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ADObject**
Specifies the Active Directory object to which permissions will be applied.

|Type          |Required|Position|PipelineInput|Aliases                                 |
|--------------|--------|--------|-------------|----------------------------------------|
|`[ADObject[]]`|true    |named   |false        |OrganizationalUnit<br/>DistinguishedName|

#### **Type**
Specifies the type of permissions to be added. Valid values are 'WellKnownAdministrative', 'Administrative', 'AuthenticatedUsers', and 'Default'.
Valid Values:

* WellKnownAdministrative
* Administrative
* AuthenticatedUsers
* Default

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Principal**
Specifies the trustee to which permissions will be granted.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Trustee|

#### **PrincipalType**
Specifies the type of the trustee. Valid values are 'DistinguishedName', 'Name', and 'Sid'.
Valid Values:

* DistinguishedName
* Name
* Sid

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |named   |false        |TrusteeType|

#### **PermissionType**
Specifies the type of permission to be added.
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

|Type                |Required|Position|PipelineInput|Aliases              |
|--------------------|--------|--------|-------------|---------------------|
|`[GPPermissionType]`|true    |named   |false        |IncludePermissionType|

#### **Inheritable**
Indicates whether permissions should be inheritable.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PermitType**
Specifies the type of permission to be granted. Valid values are 'Allow', 'Deny', and 'All'.
Valid Values:

* Allow
* Deny
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Forest**
Specifies the forest in which the GPO resides.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies the domains to exclude when applying permissions.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies the domains to include when applying permissions.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **ADAdministrativeGroups**
Specifies the administrative groups in Active Directory.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **LimitProcessing**
Specifies the maximum number of processing steps.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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
Add-GPOZaurrPermission -GPOName <String> [-Type <String>] [-Principal <String>] [-PrincipalType <String>] -PermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink} [-Inheritable] [-PermitType <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Add-GPOZaurrPermission -GPOGuid <String> [-Type <String>] [-Principal <String>] [-PrincipalType <String>] -PermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink} [-Inheritable] [-PermitType <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Add-GPOZaurrPermission -All [-Type <String>] [-Principal <String>] [-PrincipalType <String>] -PermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink} [-Inheritable] [-PermitType <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Add-GPOZaurrPermission -ADObject <ADObject[]> [-Type <String>] [-Principal <String>] [-PrincipalType <String>] -PermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink} [-Inheritable] [-PermitType <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-ADAdministrativeGroups <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
