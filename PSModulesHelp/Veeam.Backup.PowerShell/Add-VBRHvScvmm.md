Add-VBRHvScvmm
--------------

### Synopsis
Adds a Hyper-V SCVMM server to the backup infrastructure.

---

### Description

This cmdlet adds a Hyper-V SCVMM (Microsoft System Center Virtual Machine Manager) server to the backup infrastructure.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding SCVMM Server Using Account User Name and Password

```PowerShell
Add-VBRHvScvmm -Name "SCVMM1" -User "Administrator" -Password "qwerty" -Description "SCVMM Server"
This command adds the SCVMM1 SCVMM server with the Administrator user name and the qwerty password of the account.
```
> Example 2. Adding SCVMM Server Using Credentials Managed by Veeam Backup & Replication

$Administrator = Get-VBRCredentials
Add-VBRHvScvmm -Name "SCVMM1" -Description "SCVMM Server" -Credentials $Administrator
This example shows how to add the SCVMM1 SCVMM server using the credentials managed by Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Add-VBRHvScvmm cmdlet. Specify the Name parameter value. Specify the Description parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the SCVMM server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the SCVMM server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the DNS name of the added SCVMM server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the SCVMM server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the SCVMM server.

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
Add-VBRHvScvmm -Credentials <CCredentials> [-Description <String>] -Name <String> [<CommonParameters>]
```
```PowerShell
Add-VBRHvScvmm [-Description <String>] -Name <String> -Password <String> -User <String> [<CommonParameters>]
```
