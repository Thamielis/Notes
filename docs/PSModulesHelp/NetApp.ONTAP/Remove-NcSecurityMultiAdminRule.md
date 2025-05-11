Remove-NcSecurityMultiAdminRule
-------------------------------

### Synopsis
Deletes a multi-admin-verify rule.

---

### Description

Deletes a multi-admin-verify rule. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcSecurityMultiAdminRule](Get-NcSecurityMultiAdminRule)

* [Set-NcSecurityMultiAdminRule](Set-NcSecurityMultiAdminRule)

* [New-NcSecurityMultiAdminRule](New-NcSecurityMultiAdminRule)

---

### Examples
> Example 1

```PowerShell
Remove-NcSecurityMultiAdminRule -Operation "volume delete" -OwnerUuid "Uuid" -OwnerName "OwnerName"
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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: Security
API: /api/security/multi-admin-verify/rules/
Family: Cluster

---

### Syntax
```PowerShell
Remove-NcSecurityMultiAdminRule -Operation <String> -OwnerUuid <string> -OwnerName <string> [<CommonParameters>]
```
