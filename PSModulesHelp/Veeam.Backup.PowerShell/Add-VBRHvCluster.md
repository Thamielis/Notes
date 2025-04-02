Add-VBRHvCluster
----------------

### Synopsis
Adds a Hyper-V cluster to the backup infrastructure.

---

### Description

This cmdlet adds Hyper-V clusters to the backup infrastructure.
Run the Add-VBRHvHost cmdlet to add a standalone Hyper-V host to the backup infrastructure.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding Hyper-V ?luster Using Account User Name and Password

```PowerShell
Add-VBRHvCluster -Name "HYPCLUSTER01" -User "Administrator" -Password "qwerty" -Description "Hyper-V Cluster 01"
This command adds the HYPCLUSTER01 Hyper-V ?luster server with the Administrator user name and the qwerty password of the account.
```
> Example 2. Adding Hyper-V ?luster Using Credentials Managed by Veeam Backup & Replication

$Administrator = Get-VBRCredentials
Add-VBRHvCluster -Name "HYPCLUSTER01" -Description "Hyper-V Cluster 01" -Credentials $Administrator
This example shows how to add the HYPCLUSTER01 Hyper-V server using the credentials managed by Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Add-VBRHvCluster cmdlet. Specify the Name parameter value. Specify the Description parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the Hyper-V cluster.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the Hyper-V cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the DNS name of the added Hyper-V cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the Hyper-V cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the Hyper-V cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRHvCluster -Credentials <CCredentials> [-Description <String>] -Name <String> [<CommonParameters>]
```
```PowerShell
Add-VBRHvCluster [-Description <String>] -Name <String> -Password <String> -User <String> [<CommonParameters>]
```
