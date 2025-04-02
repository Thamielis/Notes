Get-NcSecurityAuthClusterAdProxy
--------------------------------

### Synopsis
Retrieves SVM information configured as an Active Directory domain-tunnel.

---

### Description

Retrieves SVM information configured as an Active Directory domain-tunnel. This cmdlet is supported with Rest.

---

### Related Links
* [Set-NcSecurityAuthClusterAdProxy](Set-NcSecurityAuthClusterAdProxy)

* [Remove-NcSecurityAuthClusterAdProxy](Remove-NcSecurityAuthClusterAdProxy)

* [New-NcSecurityAuthClusterAdProxy](New-NcSecurityAuthClusterAdProxy)

---

### Examples
> 

Get-NcSecurityAuthClusterAdProxy
NcController   Vserver Uuid
------------   ------- ----
10.236.142.168 vs1     cf722aca-c529-11ec-b8dc-005056aca65b

---

### Parameters
#### **Vserver**
The name of the SVM.

|Type      |Required|Position|PipelineInput         |Aliases|
|----------|--------|--------|----------------------|-------|
|`[String]`|false   |0       |false (ByPropertyName)|SvmName|

#### **Template**
Specify $a = Get-NcSecurityAuthClusterAdProxy -Template, to get an empty AuthClusterAdProxy object for use with advanced queries involving the Attributes like $b = Get-NcSecurityAuthClusterAdProxy -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcSecurityAuthClusterAdProxy -Template, to get an empty security AuthClusterAdProxy object for use with advanced queries involving the Attributes like $b = Get-NcSecurityAuthClusterAdProxy -Query $a.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[SecurityAuthClusterAdProxyOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Security.SecurityAuthClusterAdProxyOutput, to get an empty AuthClusterAdProxy object for use with advanced queries involving the Attributes like $b = Get-NcSecurityAuthClusterAdProxy -Attributes $a.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[SecurityAuthClusterAdProxyOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityAuthClusterAdProxyOutput

---

### Notes
Category: Security
Api: api/security/authentication/cluster/ad-proxy
Family: NcController

---

### Syntax
```PowerShell
Get-NcSecurityAuthClusterAdProxy [[-Vserver] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityAuthClusterAdProxy -Template <DataONTAP.C.Types.Security.SecurityAuthClusterAdProxyOutput> [<CommonParameters>]
```
```PowerShell
Get-NcSecurityAuthClusterAdProxy -Query <SecurityAuthClusterAdProxyOutput> [-Attributes <SecurityAuthClusterAdProxyOutput>] [<CommonParameters>]
```
