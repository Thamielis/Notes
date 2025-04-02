New-NcSecurityAuthClusterNis
----------------------------

### Synopsis
Creates the NIS configuration of the cluster

---

### Description

Creates the NIS configuration of the cluster. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcSecurityAuthClusterNis](Get-NcSecurityAuthClusterNis)

---

### Examples
> Example 1

```PowerShell
New-NcSecurityAuthClusterNis -Domain domainA.example.com -Servers "10.10.10.10","12.12.12.13"
Creates the NIS configuration of the cluster

Domain         : domainA.example.com
Servers        : {10.10.10.10, 12.12.12.13}
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
|`[String]`|true    |1       |false        |

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
New-NcSecurityAuthClusterNis [-Domain] <String> [-Servers] <String> [<CommonParameters>]
```
