Set-VBRHvScvmm
--------------

### Synopsis
Modifies settings of a Hyper-V SCVMM server.

---

### Description

This cmdlet modifies settings of a Hyper-V SCVMM server.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Modifying Password of Hyper-V SCVMM Server

$Administrator = Get-VBRCredentials
$server = Get-VBRServer
Set-VBRHvScvmm -Password "XXXXXXX" -Server $server
This example shows how to change the password of the account used to add the Hyper-V SCVMM server to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
3. Run the Set-VBRHvScvmm cmdlet. Specify the Password parameter value. Set the $server variable as the Server parameter value.
> Example 2. Modifying Credentials of Hyper-V SCVMM Server

$Administrator = Get-VBRCredentials
$server = Get-VBRServer
Set-VBRHvScvmm -Server $server -Credentials $Administrator
This example shows how to modify credentials of the Hyper-V SCVMM server.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
3. Run the Set-VBRHvScvmm cmdlet. Set the $server variable as the Server parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the SCVMM server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the SCVMM server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the SCVMM server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies a Hyper-V SCVMM server which settings you want to modify.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **User**
Specifies the user name you want to use for authenticating with the SCVMM server.

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
Set-VBRHvScvmm [-Credentials <CCredentials>] [-Description <String>] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Set-VBRHvScvmm [-Description <String>] [-Password <String>] -Server <CHost> [-User <String>] [<CommonParameters>]
```
