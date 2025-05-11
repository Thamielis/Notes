Get-NcSecurityMultiAdminRule
----------------------------

### Synopsis
Retrieves multi-admin-verify rules.

---

### Description

Retrieves multi-admin-verify rules.This cmdlet is supported with Rest.

---

### Related Links
* [New-NcSecurityMultiAdminRule](New-NcSecurityMultiAdminRule)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityMultiAdminRule
Retrieves the collection of IPsec policies.Retrieves multi-admin-verify rules.

Operation         : security login password
ApprovalExpiry    :
AutoRequestCreate :
ExecutionExpiry   :
OwnerUuid         : dfe271ad-ba11-11ec-b8dc-005056aca65b
Query             :
RequiredApprovers :
ApprovalGroups    :
CreateTime        :
NcController      : 10.236.142.168
OwnerName         : C1_sti19-vsim-ucs427g_1649742516
SystemDefined     :

```

---

### Parameters
#### **Owner**
The owner of the rule. The only valid owner is currently the cluster.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|false   |1       |true (ByPropertyName)|OwnerName|

#### **Operation**
Command that requires one or more approvals.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SecurityMultiAdminRule object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityMultiAdminRule -Template" to get the initially empty SecurityMultiAdminRule object.  If not specified, all data is returned for each object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[SecurityMultiAdminRule]`|false   |named   |false        |

#### **Template**
Specify to get an empty SecurityMultiAdminRule object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SecurityMultiAdminRule object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecurityMultiAdminRule -Template" to get the initially empty SecurityMultiAdminRule object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[SecurityMultiAdminRule]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityMultiAdminRule

---

### Notes
Category: Security
API: /security/multi-admin-verify/rules
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecurityMultiAdminRule [[-Owner] <String>] [[-Operation] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminRule -Template [<CommonParameters>]
```
```PowerShell
Get-NcSecurityMultiAdminRule -Query <DataONTAP.C.Types.Security.SecurityMultiAdminRule> [-Attributes <DataONTAP.C.Types.Security.SecurityMultiAdminRule>] [<CommonParameters>]
```
