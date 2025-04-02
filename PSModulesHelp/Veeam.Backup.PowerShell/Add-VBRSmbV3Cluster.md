Add-VBRSmbV3Cluster
-------------------

### Synopsis
Adds an SMB3 cluster to the backup infrastructure.

---

### Description

This cmdlet adds an SMB3 cluster to the backup infrastructure.
Run the Add-VBRSmbV3Host cmdlet to add a standalone SMB3 server to the backup infrastructure.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding New SMB3 Cluster Using User Name and Password

```PowerShell
Add-VBRSmbV3Cluster -Name "SMBCLUSTER01" -User "Administrator" -Password "qwerty" -Description "Hyper-V SMB Share Cluster 01"
This command adds a new SMB3 cluster named SMBCLUSTER01 with the Administrator user name and the qwerty password of the account. The description is Hyper-V SMB Share Cluster 01.
```
> Example 2. Adding New SMB3 Cluster Using Credentials

$Administrator = Get-VBRCredentials
Add-VBRSmbV3Cluster -Name "SMBCLUSTER01" -Description "Hyper-V SMB Share Cluster 01" -Credentials $Administrator
This command adds a new SMB3 cluster named SMBCLUSTER01 using credentials. The description is Hyper-V SMB Share Cluster 01.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Add-VBRSmbV3Cluster cmdlet. Specify the Name parameter value. Specify the Description parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the SMB3 cluster.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the SMB3 cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the full DNS name or IP address of the SMB3 cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the SMB3 cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the SMB3 cluster.

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
Add-VBRSmbV3Cluster -Credentials <CCredentials> [-Description <String>] -Name <String> [<CommonParameters>]
```
```PowerShell
Add-VBRSmbV3Cluster [-Description <String>] -Name <String> -Password <String> -User <String> [<CommonParameters>]
```
