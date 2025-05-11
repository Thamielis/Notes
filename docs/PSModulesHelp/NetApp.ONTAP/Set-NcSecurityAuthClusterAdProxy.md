Set-NcSecurityAuthClusterAdProxy
--------------------------------

### Synopsis
Updates the data SVM configured as a tunnel for Active Directory based authentication for cluster user accounts.

---

### Description

Updates the data SVM configured as a tunnel for Active Directory based authentication for cluster user accounts. This cmdlet is supported with Rest.

---

### Related Links
* [Remove-NcSecurityAuthClusterAdProxy](Remove-NcSecurityAuthClusterAdProxy)

* [New-NcSecurityAuthClusterAdProxy](New-NcSecurityAuthClusterAdProxy)

* [Get-NcSecurityAuthClusterAdProxy](Get-NcSecurityAuthClusterAdProxy)

---

### Examples
> Example 1

```PowerShell
Set-NcSecurityAuthClusterAdProxy -Vserver vs1
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
Set-NcSecurityAuthClusterAdProxy [-Vserver] <String> [<CommonParameters>]
```
