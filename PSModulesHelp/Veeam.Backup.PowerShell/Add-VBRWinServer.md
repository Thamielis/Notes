Add-VBRWinServer
----------------

### Synopsis
Adds Windows server to the backup infrastructure.

---

### Description

This cmdlet adds a Windows server to the backup infrastructure.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding New Windows Server Using User Name and Password

```PowerShell
Add-VBRWinServer -Name "WinServer" -User "Administrator" -Password "qwerty" -Description "Windows File Server"
This command adds a new Windows server named WinServer with the Administrator user name and the qwerty password of the account. The description is Windows File Server.
```
> Example 2. Adding New Windows Server Using Credentials

$Administrator = Get-VBRCredentials
Add-VBRWinServer -Name "WinServer" -Credentials $Administrator -Description "Windows File Server"
This command adds a new Windows server named WinServer using credentials. The description is Windows File Server.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable. 2. Run the Add-VBRWinServer cmdlet. Specify the Name parameter value. Set the $Administrator variable as the Credentials parameter value. Specify the Description parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the Windows server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the Windows server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the DNS name of the Windows server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the Windows server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the Windows server.

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
Add-VBRWinServer -Credentials <CCredentials> [-Description <String>] -Name <String> [<CommonParameters>]
```
```PowerShell
Add-VBRWinServer [-Description <String>] -Name <String> -Password <String> -User <String> [<CommonParameters>]
```
