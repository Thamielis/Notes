Set-NcSecurityMultiAdminApprovalGroup
-------------------------------------

### Synopsis
Updates a multi-admin-verify approval group.

---

### Description

Updates a multi-admin-verify approval group. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityMultiAdminApprovalGroup](Get-NcSecurityMultiAdminApprovalGroup)

* [New-NcSecurityMultiAdminApprovalGroup](New-NcSecurityMultiAdminApprovalGroup)

---

### Examples
> Example 1

Set-NcSecurityMultiAdminApprovalGroup -OwnerName C1_sti70-vsim-ucs164g_1648711242 -Name group_2 -Email "verify@example.com","test@domain.com"
Modifying multi admin approval group

NcController : 172.21.91.165
Approvers    : {admin}
Email        : {verify@example.com, test@domain.com}
Name         : group_2
OwnerName    : C1_sti70-vsim-ucs164g_1648711242
OwnerUuid    : 3dbbf06b-b0b4-11ec-9877-005056ac46f6

---

### Parameters
#### **OwnerName**
The name of the SVM

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |SvmName|

#### **Approvers**
List of users that can approve a request.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Name**
Name of the approval group

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Email**
Email addresses that are notified when a request is created, approved, vetoed, or executed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityMultiAdminApprovalGroupOutput

---

### Notes
Category: security
Api: /api/security/multi-admin-verify/approval-groups/{owner.uuid}/{name}
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecurityMultiAdminApprovalGroup [-OwnerName] <String> [-Approvers <String[]>] [[-Name] <String>] [-Email <String[]>] [<CommonParameters>]
```
