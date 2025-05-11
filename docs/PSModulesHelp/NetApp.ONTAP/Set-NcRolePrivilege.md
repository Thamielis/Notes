Set-NcRolePrivilege
-------------------

### Synopsis
Updates the access level for a REST API path or command/command directory path. Optionally updates the query, if 'path' refers to a command/command directory path. The REST API path can be a resource-qualified endpoint.

---

### Description

Updates the access level for a REST API path or command/command directory path. Optionally updates the query, if 'path' refers to a command/command directory path. The REST API path can be a resource-qualified endpoint. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcRolePrivilege](Get-NcRolePrivilege)

* [New-NcRolePrivilege](New-NcRolePrivilege)

* [Remove-NcRolePrivilege](Remove-NcRolePrivilege)

---

### Examples
> Example 1

```PowerShell
Set-NcRolePrivilege -OwnerName vs0 -Name NewRole -Path "/api/application/applications" -Access readonly
Modifying access of role privilege of REST uri.

Name         : NewRole
Path         : /api/application/applications
Access       : readonly
NcController : 10.236.69.71
Query        :
OwnerUuid    : 9502b886-e64f-11ec-96f5-005056acef54

```

---

### Parameters
#### **OwnerName**
The name of the SVM.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |SvmName|

#### **Name**
Role name

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |2       |false        |RoleName|

#### **Path**
Either of REST URI/endpoint OR command/command directory path.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|true    |3       |false        |CommandDirectory|

#### **Access**
Access level for the REST endpoint or command/command directory path. If it denotes the access level for a command/command directory path, the only supported enum values are 'none','readonly' and 'all'.
Valid Values:

* none
* readonly
* read_create
* read_modify
* read_create_modify
* all

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Query**
Optional attribute that can be specified only if the 'path' attribute refers to a command / command directory path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutput

---

### Notes
Category: security
API: /api/security/roles/{owner.uuid}/{name}/privileges/{path}
Family: cluster

---

### Syntax
```PowerShell
Set-NcRolePrivilege [-OwnerName] <String> [-Name] <String> [-Path] <String> -Access <String> [-Query <String>] [<CommonParameters>]
```
