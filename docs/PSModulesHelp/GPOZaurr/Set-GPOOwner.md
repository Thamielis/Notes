Set-GPOOwner
------------

### Synopsis
Used within Invoke-GPOZaurrPermission only. Set new group policy owner.

---

### Description

Used within Invoke-GPOZaurrPermission only. Set new group policy owner.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-GPOZaurrPermission -Verbose -SearchBase 'OU=Computers,OU=Production,DC=ad,DC=evotec,DC=xyz' {
    Set-GPOOwner -Type Administrative
    Remove-GPOPermission -Type NotAdministrative, NotWellKnownAdministrative -IncludePermissionType GpoEdit, GpoEditDeleteModifySecurity
    Add-GPOPermission -Type Administrative -IncludePermissionType GpoEditDeleteModifySecurity
    Add-GPOPermission -Type WellKnownAdministrative -IncludePermissionType GpoEditDeleteModifySecurity
} -WhatIf
```

---

### Parameters
#### **Type**
Choose Owner Type. When chosing Administrative Type, owner will be set to Domain Admins for current GPO domain. When Default is set Owner will be set to Principal given in another parameter.
Valid Values:

* Administrative
* Default

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Principal**
Choose Owner Name to set for Group Policy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Set-GPOOwner [[-Type] <String>] [[-Principal] <String>] [<CommonParameters>]
```
