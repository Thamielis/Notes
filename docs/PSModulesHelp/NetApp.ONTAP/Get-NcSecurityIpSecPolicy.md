Get-NcSecurityIpSecPolicy
-------------------------

### Synopsis
Retrieves the collection of IPsec policies.This cmdlet is supported with Rest Only.

---

### Description

Retrieves the collection of IPsec policies.This cmdlet is supported with Rest Only.

---

### Related Links
* [New-NcSecurityIpSecPolicy](New-NcSecurityIpSecPolicy)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityIpSecPolicy
Retrieves the collection of IPsec policies.

Name                 : string
Enabled              : True
AuthenticationMethod : none
Action               : bypass
Certificate          :
IpspaceName          :
IpspaceUuid          :
LocalEndpoint        : DataONTAP.C.Types.Security.LocalEndpoint
LocalIdentity        : string
NcController         : 10.236.142.168
Protocol             : udp
RemoteEndpoint       : DataONTAP.C.Types.Security.RemoteEndpoint
RemoteIdentity       : string
Scope                : svm
SvmName              : vs0
SvmUuid              : 5ae18066-ba27-11ec-b8dc-005056aca65b
Uuid                 : 00df2d02-c6e9-11ec-b8dc-005056aca65b

```

---

### Parameters
#### **Name**
IPsec policy name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **Scope**
Network scope. Set to \"svm\" for interfaces owned by an SVM. Otherwise, set to \"cluster\".
Valid Values:

* svm
* cluster

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vservers.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|SvmName|

#### **IpspaceName**
Ipspace Name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a SecurityIpSecPolicies object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityIpSecPolicy -Template" to get the initially empty SecurityIpSecPolicies object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SecurityIpSecPolicies]`|false   |named   |false        |

#### **Template**
Specify to get an empty SecurityIpSecPolicies object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SecurityIpSecPolicies object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecurityIpSecPolicy -Template" to get the initially empty SecurityIpSecPolicies object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[SecurityIpSecPolicies]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.ProtocolS3ServicesPoliciesOutput

---

### Notes
Category: Security
API: security/ipsec/policies
Family: cluster

---

### Syntax
```PowerShell
Get-NcSecurityIpSecPolicy [[-Name] <String>] [[-Scope] <String>] [-Vserver <String>] [-IpspaceName <String>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityIpSecPolicy -Template [<CommonParameters>]
```
```PowerShell
Get-NcSecurityIpSecPolicy -Query <SecurityIpSecPolicies> [-Attributes <SecurityIpSecPolicies>] [<CommonParameters>]
```
