Get-NcSecurityAuthClusterNis
----------------------------

### Synopsis
Retrieves the NIS configuration of the cluster.

---

### Description

Retrieves the NIS configuration of the cluster. Both NIS domain and servers are displayed by default. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcSecurityAuthClusterNis](New-NcSecurityAuthClusterNis)

---

### Examples
> Example 1

Get-NcSecurityAuthClusterNis
Retrieves the NIS configuration of the cluster

NcController   : 172.21.91.165
BindingDetails :
BoundServers   : {}
Domain         : domainA.example.com
Servers        : {10.10.10.10, example.com}

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide an SecurityAuthClusterNis object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityAuthClusterNis -Template" to get the initially empty SecurityAuthClusterNis object.  If not specified, all data is returned for each object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[SecurityAuthClusterNis]`|false   |named   |false        |

#### **Template**
Specify to get an empty SecurityAuthClusterNis object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

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
Get-NcSecurityAuthClusterNis -Template [-Attributes <SecurityAuthClusterNis>] [<CommonParameters>]
```
