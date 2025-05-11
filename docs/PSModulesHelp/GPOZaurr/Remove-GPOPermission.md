Remove-GPOPermission
--------------------

### Synopsis
Removes permissions from a Group Policy Object (GPO).

---

### Description

This function removes specified permissions from a GPO based on the provided criteria.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GPOPermission -Type 'Administrative' -PermitType 'Deny' -Principal 'S-1-5-21-3623811015-3361044348-30300820-1013' -PrincipalType 'Sid'
Removes administrative permissions denied for a specific SID from the GPO.
```
> EXAMPLE 2

```PowerShell
Remove-GPOPermission -Type 'All' -PermitType 'Allow' -Principal 'CN=John Doe,OU=Users,DC=contoso,DC=com' -PrincipalType 'DistinguishedName' -ExcludePrincipal 'S-1-5-21-3623811015-3361044348-30300820-1013' -ExcludePrincipalType 'Sid'
Removes all permissions allowed for a specific distinguished name while excluding permissions for a specific SID from the GPO.
```

---

### Parameters
#### **Type**
Specifies the type of permissions to remove. Valid values are 'Unknown', 'NotWellKnown', 'NotWellKnownAdministrative', 'Administrative', 'NotAdministrative', and 'All'.
Valid Values:

* Unknown
* NotWellKnown
* NotWellKnownAdministrative
* Administrative
* NotAdministrative
* All

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

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

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[GPPermissionType[]]`|false   |2       |false        |

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
|`[GPPermissionType[]]`|false   |3       |false        |

#### **PermitType**
Specifies whether to allow or deny the specified permissions. Valid values are 'Allow', 'Deny', and 'All'.
Valid Values:

* Allow
* Deny
* All

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Principal**
Specifies the principal(s) for which permissions should be removed.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **PrincipalType**
Specifies the type of principal(s) provided. Valid values are 'DistinguishedName', 'Name', and 'Sid'.
Valid Values:

* DistinguishedName
* Name
* Sid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **ExcludePrincipal**
Specifies the principal(s) for which permissions should be excluded from removal.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |7       |false        |

#### **ExcludePrincipalType**
Specifies the type of principal(s) to exclude. Valid values are 'DistinguishedName', 'Name', and 'Sid'.
Valid Values:

* DistinguishedName
* Name
* Sid

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

---

### Syntax
```PowerShell
Remove-GPOPermission [[-Type] <String[]>] [[-IncludePermissionType] {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [[-ExcludePermissionType] {None | GpoApply | GpoRead | GpoEdit | GpoEditDeleteModifySecurity | GpoCustom | WmiFilterEdit | WmiFilterFullControl | WmiFilterCustom | StarterGpoRead | StarterGpoEdit | StarterGpoFullControl | StarterGpoCustom | SomCreateWmiFilter | SomWmiFilterFullControl | SomCreateGpo | SomCreateStarterGpo | SomLogging | SomPlanning | SomLink}] [[-PermitType] <String>] [[-Principal] <String[]>] [[-PrincipalType] <String>] [[-ExcludePrincipal] <String[]>] [[-ExcludePrincipalType] <String>] [<CommonParameters>]
```
