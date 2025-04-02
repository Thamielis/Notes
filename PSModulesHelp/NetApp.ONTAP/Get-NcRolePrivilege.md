Get-NcRolePrivilege
-------------------

### Synopsis
Retrieves privilege details of the specified role.

---

### Description

Retrieves privilege details of the specified role. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcRolePrivilege](New-NcRolePrivilege)

---

### Examples
> Example 1

```PowerShell
Get-NcRolePrivilege -Name vsadmin -OwnerName vs0
NcController : 10.236.70.49
Path         : /api/application/applications
Access       : all
Name         : vsadmin
Query        :
OwnerUuid    : 6d0b41e9-d1d1-11ec-85d5-005056ac8592

```

---

### Parameters
#### **Name**
Name of the Role.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **OwnerName**
Name of the Owner or Svm.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |SvmName|

#### **Path**
Either of REST URI/endpoint OR command/command directory path.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |named   |false        |CommandDirectory|

#### **Template**
Specify $a = Get-NcRolePrivilege -Template, to get an empty Role object for use with advanced queries involving the Attributes like $b = Get-NcRolePrivilege -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcRolePrivilege -Template, to get an empty Role object for use with advanced queries involving the Attributes like $b = Get-NcRolePrivilege -Query $a.

|Type                                                        |Required|Position|PipelineInput|
|------------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutput, to get an empty Role object for use with advanced queries involving the Attributes like $b = Get-NcRolePrivilege -Attributes $a.

|Type                                                        |Required|Position|PipelineInput|
|------------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutput

---

### Notes
Category: Security
Api: api/security/roles/{owner.uuid}/{name}/privileges
Family: Controller, Vserver

---

### Syntax
```PowerShell
Get-NcRolePrivilege [-Name] <String> -OwnerName <String> [-Path <String>] [<CommonParameters>]
```
```PowerShell
Get-NcRolePrivilege -Template <DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutput> [<CommonParameters>]
```
```PowerShell
Get-NcRolePrivilege -Query <DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutput> [-Attributes <DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutput>] [<CommonParameters>]
```
