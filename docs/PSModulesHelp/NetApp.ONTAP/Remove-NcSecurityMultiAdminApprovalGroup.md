Remove-NcSecurityMultiAdminApprovalGroup
----------------------------------------

### Synopsis
Deletes a multi-admin-verify approval group.

---

### Description

Deletes a multi-admin-verify approval group. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityMultiAdminApprovalGroup](Get-NcSecurityMultiAdminApprovalGroup)

* [New-NcSecurityMultiAdminApprovalGroup](New-NcSecurityMultiAdminApprovalGroup)

---

### Examples
> Example 1

```PowerShell
Remove-NcSecurityMultiAdminApprovalGroup -OwnerName C1_sti70-vsim-ucs164g_1648711242 -Name group_1
Deletes multi admin approval group
```

---

### Parameters
#### **OwnerName**
The name of the SVM

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |SvmName|

#### **Name**
Name of the approval group

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |2       |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: security
Api: /api/security/multi-admin-verify/approval-groups/{owner.uuid}/{name}
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecurityMultiAdminApprovalGroup [-OwnerName] <String> [-Name] <String> [<CommonParameters>]
```
