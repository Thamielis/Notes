Set-VBRWinServer
----------------

### Synopsis
Modifies Windows server added to the backup infrastructure.

---

### Description

Modifies Windows server added to the backup infrastructure.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Modifying Credentials of Windows Server

$Administrator = Get-VBRCredentials
$server = Get-VBRServer
Set-VBRWinServer -Server $server -Name "WinServer07" -Credentials $Administrator -Description "Windows File Server 07
This example shows how to modify credentials of the WinServer07 Windows server.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
3. Run the Set-VBRWinServer cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.

- Specify the Name parameter value.
- Set the $Administrator variable as the Credentials parameter value.
- Specify the Description parameter value.
> Example 2. Modifying User Name and Password of Windows Server

$server = Get-VBRServer
Set-VBRWinServer -Server $server -User "Administrator02" -Password "XXXXXXXX"
This example shows how to modify user name and password of the Windows server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
2. Run the Set-VBRWinServer cmdlet. Set the $server variable as the Server parameter value. Specify the User parameter value. Specify the Password parameter value.

---

### Parameters
#### **Credentials**
Specifies credentials you want to use for authenticating with the Windows server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Description**
Specifies a description of the Windows server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the Windows server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies the Windows server which settings you want to modify.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **User**
Specifies a user name you want to use for authenticating with the Windows server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRWinServer [-Credentials <CCredentials>] [-Description <String>] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Set-VBRWinServer [-Description <String>] [-Password <String>] -Server <CHost> [-User <String>] [<CommonParameters>]
```
