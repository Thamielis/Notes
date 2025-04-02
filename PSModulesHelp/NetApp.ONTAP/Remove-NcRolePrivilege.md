Remove-NcRolePrivilege
----------------------

### Synopsis
Deletes a privilege tuple (of REST URI or command/command directory path, its access level and an optional query) from the role.

---

### Description

Deletes a privilege tuple (of REST URI or command/command directory path, its access level and an optional query) from the role. The REST URI can be a resource-qualified endpoint. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcRolePrivilege](Get-NcRolePrivilege)

* [New-NcRolePrivilege](New-NcRolePrivilege)

* [Set-NcRolePrivilege](Set-NcRolePrivilege)

---

### Examples
> Example 1

```PowerShell
Remove-NcRolePrivilege vs0 NewRole "/api/application/applications"
Deletes role privilege 'NewRole'.
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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: security
API: /api/security/roles/{owner.uuid}/{name}/privileges/{path}
Family: cluster

---

### Syntax
```PowerShell
Remove-NcRolePrivilege [-OwnerName] <String> [-Name] <String> [-Path] <String> [<CommonParameters>]
```
