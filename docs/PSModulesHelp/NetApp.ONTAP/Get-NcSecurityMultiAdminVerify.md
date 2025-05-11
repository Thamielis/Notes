Get-NcSecurityMultiAdminVerify
------------------------------

### Synopsis
Retrieves the multi-admin-verify configuration. This cmdlet is supported with Rest Only.

---

### Description

Retrieves the multi-admin-verify configuration.

---

### Related Links
* [Set-NcSecurityMultiAdminVerify](Set-NcSecurityMultiAdminVerify)

* 

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityMultiAdminVerify
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
Default time for requests to be approved, in ISO-8601 duration format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |0       |true         |

#### **Enabled**
Enable the multi admin verify"

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[bool?]`|false   |1       |true         |

#### **ExecutionExpiry**
Default time for requests to be executed once approved, in ISO-8601 duration format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |2       |true         |

#### **RequiredApprovers**
The number of required approvers, excluding the user that made the request.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[long?]`|false   |3       |true         |

#### **Template**
Specify $a = Get-NcSecurityMultiAdminVerify -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcSecurityMultiAdminVerify -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcSecurityMultiAdminVerify -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcSecurityMultiAdminVerify -Query $a.

|Type                                                   |Required|Position|PipelineInput|
|-------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.SecurityMultiAdminVerify]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Security.SecurityMultiAdminVerify, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcSecurityMultiAdminVerify -Attributes $a.

|Type                                                   |Required|Position|PipelineInput|
|-------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Security.SecurityMultiAdminVerify]`|false   |named   |false        |

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
Get-NcSecurityMultiAdminVerify [[-ApprovalExpiry] <string>] [[-Enabled] <bool?>] [[-ExecutionExpiry] <string>] [[-RequiredApprovers] <long?>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminVerify -Template <DataONTAP.C.Types.Security.SecurityMultiAdminVerify> [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminVerify -Query <DataONTAP.C.Types.Security.SecurityMultiAdminVerify> [-Attributes <DataONTAP.C.Types.Security.SecurityMultiAdminVerify>] [<CommonParameters>]
```
