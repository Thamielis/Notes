Add-GPOPermission
-----------------

### Synopsis
Adds a permission to a Group Policy Object (GPO).

---

### Description

This function adds a permission to a specified Group Policy Object (GPO) based on the provided parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-GPOPermission -Type Default -IncludePermissionType Read -Principal "Domain Admins" -PrincipalType DistinguishedName -PermitType Allow
Adds a permission to the GPO with default settings allowing 'Domain Admins' to read.
```
> EXAMPLE 2

```PowerShell
Add-GPOPermission -Type Administrative -IncludePermissionType Write -Principal "Finance Group" -PrincipalType Name -PermitType Allow
Adds a permission to the GPO for the 'Finance Group' allowing write access.
```
> EXAMPLE 3

```PowerShell
Add-GPOPermission -Type AuthenticatedUsers -IncludePermissionType Modify -PermitType Deny
Adds a permission to the GPO for all authenticated users denying modification.
```
> EXAMPLE 4

```PowerShell
Add-GPOPermission -Type WellKnownAdministrative -IncludePermissionType FullControl -Principal "Enterprise Admins" -PrincipalType Sid -PermitType Allow
Adds a permission to the GPO for 'Enterprise Admins' with full control.
```

---

### Parameters
#### **Type**
Specifies the type of permission to add. Valid values are 'WellKnownAdministrative', 'Administrative', 'AuthenticatedUsers', and 'Default'.
Valid Values:

* WellKnownAdministrative
* Administrative
* AuthenticatedUsers
* Default

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **IncludePermissionType**
Specifies the permission type to include.
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
|`[GPPermissionType]`|false   |2       |false        |

#### **Principal**
Specifies the principal to which the permission is granted.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |3       |false        |Trustee|

#### **PrincipalType**
Specifies the type of the principal. Valid values are 'DistinguishedName', 'Name', and 'Sid'.
Valid Values:

* DistinguishedName
* Name
* Sid

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |4       |false        |TrusteeType|

#### **PermitType**
Specifies whether to allow or deny the permission. Valid values are 'Allow' and 'Deny'.
Valid Values:

* Allow
* Deny

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Syntax
```PowerShell
Add-GPOPermission [[-Type] <String>] [[-IncludePermissionType] {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [[-Principal] <String>] [[-PrincipalType] <String>] [[-PermitType] <String>] [<CommonParameters>]
```
