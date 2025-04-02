New-NcSecurityMultiAdminRule
----------------------------

### Synopsis
Creates a multi-admin-verify rule.

---

### Description

Creates a multi-admin-verify rule. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityMultiAdminRule](Get-NcSecurityMultiAdminRule)

* [Set-NcSecurityMultiAdminRule](Set-NcSecurityMultiAdminRule)

* [Remove-NcSecurityMultiAdminRule](Remove-NcSecurityMultiAdminRule)

---

### Examples
> Example 1

```PowerShell
New-NcSecurityMultiAdminRule -Operation "volume delete" -ApprovalExpiry PT15M -AutoRequestCreate $false -ExecutionExpiry PT15M -RequiredApprovers 1
NcController : 10.237.144.166
Operation         : volume delete
ApprovalExpiry    : PT15M
AutoRequestCreate : False
ExecutionExpiry   : PT15M
RequiredApprovers : 1
ApprovalGroups    :
CreateTime        : 2022-07-06T07:31:48-04:00
OwnerUuid         : b1535e11-f2c1-11ec-8262-005056a785f3
OwnerName         : C1_sti16-vsim-ucs579e_cluster
Query             :
SystemDefined     : False

```

---

### Parameters
#### **Operation**
Command that requires one or more approvals.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **ApprovalExpiry**
Time for requests to be approved, in ISO-8601 duration format. If not set, the global setting is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |true         |

#### **ApprovalGroups**
List of approval groups that are allowed to approve requests for rules that don't have approval groups.

|Type                                           |Required|Position|PipelineInput|
|-----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.ApprovalGroups[]]`|false   |named   |true         |

#### **AutoRequestCreate**
When true, ONTAP automatically creates a request for any failed operation where there is no matching pending request.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |true         |

#### **ExecutionExpiry**
Time for requests to be executed once approved, in ISO-8601 duration format. If not set, the global setting is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |true         |

#### **OwnerUuid**
The unique identifier of the SVM.

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[String]`|false   |named   |true         |SvmUuid<br/>VserverUuid|

#### **RequiredApprovers**
The number of required approvers, excluding the user that made the request.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[false]`|false   |named   |true         |

---

### Inputs
DataONTAP.C.Types.Security.SecurityMultiAdminRule

---

### Outputs
* DataONTAP.C.Types.Security.SecurityMultiAdminRule

---

### Notes
Category: Security
API: /api/security/multi-admin-verify/rules/
Family: Cluster

---

### Syntax
```PowerShell
New-NcSecurityMultiAdminRule [-Operation] <String> [-ApprovalExpiry <String>] [-ApprovalGroups <DataONTAP.C.Types.Security.ApprovalGroups[]>] [-AutoRequestCreate <Boolean>] [-ExecutionExpiry 
```
```PowerShell
<string>] [-OwnerUuid <string>] [-RequiredApprovers <long>] [<CommonParameters>]
```
