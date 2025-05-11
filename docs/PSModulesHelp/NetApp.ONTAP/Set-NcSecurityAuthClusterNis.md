Set-NcSecurityAuthClusterNis
----------------------------

### Synopsis
Updates the NIS configuration of the cluster.

---

### Description

Updates the NIS configuration of the cluster. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityAuthClusterNis](Get-NcSecurityAuthClusterNis)

* [New-NcSecurityAuthClusterNis](New-NcSecurityAuthClusterNis)

---

### Examples
> Example 1

```PowerShell
Set-NcSecurityAuthClusterNis -Domain domainB.example.com -Servers "10.10.23.21","10.100.19.91","21.23.21.22","19.234.31.10"
Modifying the NIS configuration of the cluster

Domain         : domainB.example.com
Servers        : {10.10.23.21, 10.100.19.91, 21.23.21.22, 19.234.31.10}
NcController   : 172.21.91.165
BindingDetails :
BoundServers   :

```

---

### Parameters
#### **Domain**
The NIS domain to which this configuration belongs

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Servers**
A list of hostnames or IP addresses of NIS servers used by the NIS domain configuration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityAuthClusterNis

---

### Notes
Category: security
Api: /api/security/authentication/cluster/nis
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecurityAuthClusterNis [[-Domain] <String>] [-Servers] <String> [<CommonParameters>]
```
