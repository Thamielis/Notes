Remove-GPOZaurrPermission
-------------------------

### Synopsis
Removes permissions from a Group Policy Object (GPO) for specified principals.

---

### Description

The Remove-GPOZaurrPermission function removes permissions from a specified GPO for the specified principals. It allows for fine-grained control over the removal of permissions based on various parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GPOZaurrPermission -GPOName "TestGPO" -Principal "User1" -PrincipalType "Name" -Type "Default" -Forest "Contoso" -IncludeDomains "Domain1", "Domain2"
Removes default permissions for "User1" from the GPO named "TestGPO" in the "Contoso" forest for domains "Domain1" and "Domain2".
```
> EXAMPLE 2

```PowerShell
Remove-GPOZaurrPermission -GPOGuid "12345678-1234-1234-1234-1234567890AB" -Principal "Group1" -PrincipalType "Sid" -Type "Unknown" -Forest "Fabrikam" -ExcludeDomains "Domain3"
Removes unknown permissions for "Group1" from the GPO with GUID "12345678-1234-1234-1234-1234567890AB" in the "Fabrikam" forest excluding "Domain3".
```

---

### Parameters
#### **GPOName**
Specifies the name of the GPO from which permissions will be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **GPOGuid**
Specifies the GUID of the GPO from which permissions will be removed.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|true    |named   |false        |GUID<br/>GPOID|

#### **Principal**
Specifies the principal(s) for which permissions will be removed.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **PrincipalType**
Specifies the type of principal(s) provided. Valid values are 'DistinguishedName', 'Name', 'NetbiosName', or 'Sid'.
Valid Values:

* DistinguishedName
* Name
* NetbiosName
* Sid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Type**
Specifies the type of permissions to remove. Valid values are 'Unknown', 'NotAdministrative', or 'Default'.
Valid Values:

* Unknown
* NotAdministrative
* Default

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludePermissionType**
Specifies the permission types to include in the removal process.
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

|Type                  |Required|Position|PipelineInput|Aliases       |
|----------------------|--------|--------|-------------|--------------|
|`[GPPermissionType[]]`|false   |named   |false        |PermissionType|

#### **ExcludePermissionType**
Specifies the permission types to exclude from the removal process.
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

#### **SkipWellKnown**
Skips well-known permissions during the removal process.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipAdministrative**
Skips administrative permissions during the removal process.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Forest**
Specifies the forest in which the GPO resides.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies the domains to exclude from the removal process.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies the domains to include in the removal process.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **LimitProcessing**
Specifies the maximum number of permissions to process.

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
Remove-GPOZaurrPermission [-Principal <String[]>] [-PrincipalType <String>] [-Type <String[]>] [-IncludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-ExcludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-SkipWellKnown] [-SkipAdministrative] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GPOZaurrPermission -GPOName <String> [-Principal <String[]>] [-PrincipalType <String>] [-Type <String[]>] [-IncludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-ExcludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-SkipWellKnown] [-SkipAdministrative] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-GPOZaurrPermission -GPOGuid <String> [-Principal <String[]>] [-PrincipalType <String>] [-Type <String[]>] [-IncludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-ExcludePermissionType {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [-SkipWellKnown] [-SkipAdministrative] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-LimitProcessing <Int32>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
