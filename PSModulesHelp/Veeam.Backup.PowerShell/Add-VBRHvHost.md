Add-VBRHvHost
-------------

### Synopsis
Adds Hyper-V hosts to the backup infrastructure.

---

### Description

This cmdlet adds Hyper-V host to the backup infrastructure.
If a Hyper-V host is part of a cluster, add the Hyper-V cluster instead of standalone Hyper-V host.
Run the Add-VBRHvCluster cmdlet to add a Hyper-V cluster.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding New Hyper-V Host Using User Name and Password

```PowerShell
Add-VBRHvHost -Name "HyperVExchange" -User "Administrator" -Password "qwerty" -Description "Hyper-V Exchange host"
This command adds a new Hyper-V host named HyperVExchange with the Administrator user name and the qwerty password of the account. The description is Hyper-V Exchange host.
```
> Example 2. Adding New Hyper-V Host Using Credentials

$Administrator = Get-VBRCredentials
Add-VBRHvHost -Name "HyperVExchange" -Credentials $Administrator -Description "Hyper-V Exchange host"
This command adds a new Hyper-V host named HyperVExchange using credentials. The description is Hyper-V Exchange host.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Add-VBRHvHost cmdlet. Specify the Name parameter value. Set the $Administrator variable as the Credentials parameter value. Specify the Description parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the Hyper-V host.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the Hyper-V host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the DNS name of the Hyper-V host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the Hyper-V host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the Hyper-V host.

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
Add-VBRHvHost -Credentials <CCredentials> [-Description <String>] -Name <String> [<CommonParameters>]
```
```PowerShell
Add-VBRHvHost [-Description <String>] -Name <String> -Password <String> -User <String> [<CommonParameters>]
```
