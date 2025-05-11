New-NcRolePrivilege
-------------------

### Synopsis
Creates an S3 audit configuration.

---

### Description

Auditing for NAS events is a security measure that enables you to track and log certain S3 events on SVMs. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcRolePrivilege](Get-NcRolePrivilege)

---

### Examples
> Example 1

```PowerShell
New-NcRolePrivilege -Name Create -Path /api/cluster/jobs -Access none -OwnerName vs0
NcController : 10.236.70.49
Path         : /api/cluster/jobs
Access       : none
Name         : Create
Query        :
OwnerUuid    : 6d0b41e9-d1d1-11ec-85d5-005056ac8592

```

---

### Parameters
#### **Name**
Role Name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **Path**
Either of REST URI/endpoint OR command/command directory path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Access**
Access level for the REST endpoint or command/command directory path. If it denotes the access level for a command/command directory path, the only supported enum values are 'none','readonly' and 'all'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **OwnerName**
Name of Svm.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |SvmName|

#### **Query**
Optional attribute that can be specified only if the 'path' attribute refers to a command / command directory path.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityRolesPrivilegesOutpu

---

### Notes
Category: Security
Api: api/security/roles/{owner.uuid}/{name}/privileges
Family: Controller, Vserver

---

### Syntax
```PowerShell
New-NcRolePrivilege [-Name] <String> [-Path] <String> [-Access <String>] -OwnerName <String> [-Query <String>] [<CommonParameters>]
```
