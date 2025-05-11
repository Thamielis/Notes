Get-NcSecurityMultiAdminApprovalGroup
-------------------------------------

### Synopsis
Retrieves multi-admin-verify approval groups.

---

### Description

Retrieves multi-admin-verify approval groups. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcSecurityMultiAdminApprovalGroup](New-NcSecurityMultiAdminApprovalGroup)

---

### Examples
> Example 1

Get-NcSecurityMultiAdminApprovalGroup
Get multi admin approval group.

NcController : 172.21.91.165
Approvers    : {admin}
Email        : {user_test@example.com, try@example.com}
Name         : group_1
OwnerName    : C1_sti70-vsim-ucs164g_1648711242
OwnerUuid    : 3dbbf06b-b0b4-11ec-9877-005056ac46f6

NcController : 172.21.91.165
Approvers    : {admin}
Email        : {user_test@example.com, admin_test@domain.com, try@example.com}
Name         : group_test
OwnerName    : C1_sti70-vsim-ucs164g_1648711242
OwnerUuid    : 3dbbf06b-b0b4-11ec-9877-005056ac46f6

---

### Parameters
#### **OwnerName**
The name of the SVM

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |1       |true (ByPropertyName)|SvmName|

#### **Name**
Name of the approval group

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an SecurityMultiAdminApprovalGroupOutput object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityMultiAdminApprovalGroup -Template" to get the initially empty SecurityMultiAdminApprovalGroupOutput object.  If not specified, all data is returned for each object.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[SecurityMultiAdminApprovalGroupOutput]`|false   |named   |false        |

#### **Template**
Specify to get an empty SecurityMultiAdminApprovalGroupOutput object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an SecurityMultiAdminApprovalGroupOutput object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecurityMultiAdminApprovalGroup -Template" to get the initially empty SecurityMultiAdminApprovalGroupOutput object.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[SecurityMultiAdminApprovalGroupOutput]`|true    |named   |false        |

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
Get-NcSecurityMultiAdminApprovalGroup [[-OwnerName] <String>] [[-Name] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminApprovalGroup -Template [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminApprovalGroup -Query <SecurityMultiAdminApprovalGroupOutput> [-Attributes <SecurityMultiAdminApprovalGroupOutput>] [<CommonParameters>]
```
