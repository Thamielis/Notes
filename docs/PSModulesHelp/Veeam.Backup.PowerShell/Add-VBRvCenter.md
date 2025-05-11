Add-VBRvCenter
--------------

### Synopsis
Adds vCenter Servers to the backup infrastructure.

---

### Description

This cmdlet allows you to add a vCenter Server to the backup infrastructure.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

* [Remove-VBRServer](Remove-VBRServer)

---

### Examples
> Example 1. Adding vCenter to Backup Infrastructure Using Account User Name and Password

```PowerShell
Add-VBRvCenter -Name "vc25.domain.local" -User "Domain\Administrator" -Password "qwerty" -Description "vcdev25 vCenter Server"
This command adds the vc25.domain.local vCenter Server. The user name is Domain\Administrator and the password is qwerty.
```
> Example 2. Adding vCenter to Backup Infrastructure Using Credentials Managed by Veeam Backup & Replication

$vc_administrator = Get-VBRCredentials
Add-VBRvCenter -Name "vc25.domain.local" -Description "vcdev25 vCenter Server" -Credentials $vc_administrator
This example shows how to add the vc25.domain.local vCenter Server.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $vc_administrator variable.
2. Run the Add-VBRvCenter cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Specify the Description parameter value.
- Set the $vc_administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the vCenter Server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the vCenter Server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a vCenter Server without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the full DNS name or IP address of the vCenter Server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **Password**
Specifies the password you want to use for authenticating with the vCenter Server.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[String]`|true    |2       |False        |SOAPPassword|

#### **Port**
Specifies the Web service port for connection to the vCenter Server. Default: 443

|Type     |Required|Position|PipelineInput|Aliases |
|---------|--------|--------|-------------|--------|
|`[Int32]`|false   |named   |False        |SOAPPort|

#### **User**
Specifies the user name that you want to use for authenticating with the vCenter Server.
Note: The user name must be in the DOMAIN\username format.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |1       |False        |SOAPUser|

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
Add-VBRvCenter [-Name] <String> -Credentials <CCredentials> [-Description <String>] [-Force] [-Port <Int32>] [<CommonParameters>]
```
```PowerShell
Add-VBRvCenter [-Name] <String> [-User] <String> [-Password] <String> [-Description <String>] [-Force] [-Port <Int32>] [<CommonParameters>]
```
