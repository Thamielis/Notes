Set-NcSecurityMultiAdminVerify
------------------------------

### Synopsis
Modifies the multi-admin-verify configuration.This cmdlet is supported with Rest Only.

---

### Description

Modifies the multi-admin-verify configuration.

---

### Related Links
* [Get-NcSecurityMultiAdminVerify](Get-NcSecurityMultiAdminVerify)

* 

---

### Examples
> Example 1

```PowerShell
Set-NcSecurityMultiAdminVerify -ApprovalExpiry 1h -ExecutionExpiry 2h -RequiredApprovers 1 -Enabled $true -ApprovalGroups Group
ApprovalExpiry    : PT1H
ExecutionExpiry   : PT2H
RequiredApprovers : 1
ApprovalGroups    : {Group}
Enabled           : True
NcController      : 10.236.50.117

```

---

### Parameters
#### **ApprovalExpiry**
Default time for requests to be approved, in ISO-8601 duration format

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |0       |true (ByPropertyName)|

#### **ApprovalGroups**
List of approval groups that are allowed to approve requests for rules that don't have approval groups.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Enabled**
Enable the multi admin verify.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |0       |true (ByPropertyName)|

#### **ExecutionExpiry**
Default time for requests to be executed once approved, in ISO-8601 duration format

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[string]`|false   |0       |true (ByPropertyName)|

#### **RequiredApprovers**
The number of required approvers, excluding the user that made the request.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[long?]`|false   |0       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityMultiAdminVerify

---

### Notes
Category: Security
Api: /security/multi-admin-verify
Family: NcClusterCmdlet

---

### Syntax
```PowerShell
Set-NcSecurityMultiAdminVerify [[-ApprovalExpiry] <string>] [[-ApprovalGroups] <string>] [[-Enabled] <bool?>] [[-ExecutionExpiry] <string>] [[-RequiredApprovers] <long?>] [<CommonParameters>]
```
