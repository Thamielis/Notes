Add-VBRSmbV3Host
----------------

### Synopsis
Adds an SMB3 host to the backup infrastructure.

---

### Description

This cmdlet adds an SMB3 host to the backup infrastructure.
If an SMB3 host is part of a cluster, add the SMB3 cluster instead of standalone SMB3 host.
Run the Add-VBRSmbV3Cluster cmdlet to add an SMB3 cluster.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding New SMB3 Host Using User Name and Password

```PowerShell
Add-VBRSmbV3Host -Name "SMBShare010" -User "Administrator" -Password "Password" -Description "Hyper-V SMB Share Host 010"
This command adds a new SMB3 host named SMBShare010 with the Administrator user name and the qwerty password of the account. The description is Hyper-V SMB Share Host 01.
```
> Example 2. Adding New SMB3 Host Using Credentials

$Administrator = Get-VBRCredentials
Add-VBRSmbV3Host -Name "SMBShare010" -Description "Hyper-V SMB Share Host 010" -Credentials $Administrator
This command adds a new SMB3 host named SMBShare010 using credentials. The description is Hyper-V SMB Share Host 01.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Add-VBRSmbV3Host cmdlet. Specify the Name parameter value. Specify the Description parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the SMB3 host.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the SMB3 host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the DNS name of the SMB3 host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the SMB3 host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the SMB3 host.

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
Add-VBRSmbV3Host -Credentials <CCredentials> [-Description <String>] -Name <String> [<CommonParameters>]
```
```PowerShell
Add-VBRSmbV3Host [-Description <String>] -Name <String> -Password <String> -User <String> [<CommonParameters>]
```
