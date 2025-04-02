New-NcSecurityMultiAdminApprovalGroup
-------------------------------------

### Synopsis
Creates multi-admin-verify approval groups.

---

### Description

Creates multi-admin-verify approval groups. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityMultiAdminApprovalGroup](Get-NcSecurityMultiAdminApprovalGroup)

---

### Examples
> Example 1

```PowerShell
New-NcSecurityMultiAdminApprovalGroup -Approvers admin -Name group_2 -Email verify@domain.com
Creates multi admin approval group

NcController : 172.21.91.165
Approvers    : {admin}
Email        : {verify@domain.com}
Name         : group_2
OwnerName    : C1_sti70-vsim-ucs164g_1648711242
OwnerUuid    : 3dbbf06b-b0b4-11ec-9877-005056ac46f6

```

---

### Parameters
#### **Approvers**
List of users that can approve a request.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **Name**
Name of the approval group

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Email**
Email addresses that are notified when a request is created, approved, vetoed, or executed.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityMultiAdminApprovalGroupOutput

---

### Notes
Category: security
Api: /api/security/multi-admin-verify/approval-groups
Family: cluster

---

### Syntax
```PowerShell
New-NcSecurityMultiAdminApprovalGroup [-Approvers] <String[]> [-Name] <String> [-Email <String[]>] [<CommonParameters>]
```
