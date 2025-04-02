New-NcSecurityAuthClusterAdProxy
--------------------------------

### Synopsis
Configures a data SVM as a proxy for Active Directory based authentication for cluster user accounts.

---

### Description

Configures a data SVM as a proxy for Active Directory based authentication for cluster user accounts. This cmdlet is supported with Rest.

---

### Related Links
* [Remove-NcSecurityAuthClusterAdProxy](Remove-NcSecurityAuthClusterAdProxy)

* [Set-NcSecurityAuthClusterAdProxy](Set-NcSecurityAuthClusterAdProxy)

* [Get-NcSecurityAuthClusterAdProxy](Get-NcSecurityAuthClusterAdProxy)

---

### Examples
> Example 1

```PowerShell
New-NcSecurityAuthClusterAdProxy -Vserver vs0
NcController : 10.237.144.166
Vserver      : vs0
Uuid         : bf377c6f-f2c2-11ec-8262-005056a785f3

```

---

### Parameters
#### **Vserver**
Name of SVM.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |0       |true         |SvmName|

---

### Inputs
DataONTAP.C.Types.Security.SecurityAuthClusterAdProxyOutput

---

### Outputs
* DataONTAP.C.Types.Security.SecurityAuthClusterAdProxyOutput

---

### Notes
Category: Security
API: /api/security/authentication/cluster/ad-proxy
Family: Cluster

---

### Syntax
```PowerShell
New-NcSecurityAuthClusterAdProxy [-Vserver] <String> [<CommonParameters>]
```
