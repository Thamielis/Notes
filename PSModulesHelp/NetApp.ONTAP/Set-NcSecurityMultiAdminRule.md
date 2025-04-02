Set-NcSecurityMultiAdminRule
----------------------------

### Synopsis
Updates a multi-admin-verify rule.

---

### Description

Updates a multi-admin-verify rule. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcSecurityMultiAdminRule](Get-NcSecurityMultiAdminRule)

* [Remove-NcSecurityMultiAdminRule](Remove-NcSecurityMultiAdminRule)

* [New-NcSecurityMultiAdminRule](New-NcSecurityMultiAdminRule)

---

### Examples
> Example 1

```PowerShell
Set-NcSecurityMultiAdminRule -Operation "volume delete" -OwnerUuid "f845b393-f2ed-11ec-a216-00a09856d281" -OwnerName "sti8080-3571655984513" -ApprovalExpiry PT15M -AutoRequestCreate $false -ExecutionExpiry PT15M -RequiredApprovers 1
NcController : 10.237.144.166
Operation         : volume delete
ApprovalExpiry    : PT15M
ApprovalGroups    :
AutoRequestCreate : False
CreateTime        : 2022-07-05T03:18:58-04:00
ExecutionExpiry   : PT15M
OwnerUuid         : f845b393-f2ed-11ec-a216-00a09856d281
OwnerName         : sti8080-3571655984513
Query             :
RequiredApprovers : 1
SystemDefined     : False

```

---

### Parameters
#### **Operation**
Command that requires one or more approvals.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |true         |

#### **OwnerUuid**
The unique identifier of the SVM.

|Type      |Required|Position|PipelineInput|Aliases                |
|----------|--------|--------|-------------|-----------------------|
|`[string]`|true    |named   |false        |SvmUuid<br/>VserverUuid|

#### **OwnerName**
The name of the SVM.

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[string]`|true    |named   |false        |SvmName<br/>Vserver|

#### **ApprovalExpiry**
Time for requests to be approved, in ISO-8601 duration format. If not set, the global setting is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **AutoRequestCreate**
Existing SVM in which to create the bucket configuration

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ApprovalGroups**
List of approval groups that are allowed to approve requests for rules that don't have approval groups.

|Type                                           |Required|Position|PipelineInput|
|-----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.ApprovalGroups[]]`|false   |named   |false        |

#### **ExecutionExpiry**
Time for requests to be executed once approved, in ISO-8601 duration format. If not set, the global setting is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **RequiredApprovers**
The number of required approvers, excluding the user that made the request.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

---

### Inputs

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
Set-NcSecurityMultiAdminRule -Operation <String> -OwnerUuid <string> -OwnerName <string> [-ApprovalExpiry <string>] [-AutoRequestCreate <Boolean>] [-ExecutionExpiry <String>] 
```
```PowerShell
[-RequiredApprovers <Int64>] [-ApprovalGroups <DataONTAP.C.Types.Security.ApprovalGroups[]>] [<CommonParameters>]
```
