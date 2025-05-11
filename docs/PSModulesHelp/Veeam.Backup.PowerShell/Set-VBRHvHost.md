Set-VBRHvHost
-------------

### Synopsis
Modifies settings of Hyper-V hosts.

---

### Description

This cmdlet modifies settings of Hyper-V hosts.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Modifying User Name and Password of Hyper-V Host

$server = Get-VBRServer
Set-VBRHvHost Server $server" -Password "XXXXXXXXXX"
This example shows how to modify the password of the account used to add the Hyper-V Exchange host Hyper-V ?luster to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
2. Run the Set-VBRHvHost cmdlet. Set the $server variable as the Server parameter value. Specify the Password parameter value.
> Example 2. Modifying Credentials of Hyper-V Host

$Administrator = Get-VBRCredentials
$server = Get-VBRServer
Set-VBRHvHost -Server $server -Credentials $Administrator
This example shows how to modify credentials of the HyperVExchange Hyper-V ?luster.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
3. Run the Set-VBRHvHost cmdlet. Set the $server variable as the Server parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the Hyper-V host.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the Hyper-V host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the Hyper-V host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies a Hyper-V  which settings you want to modify.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **User**
Specifies the user name you want to use for authenticating with the Hyper-V host.

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
Set-VBRHvHost [-Credentials <CCredentials>] [-Description <String>] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Set-VBRHvHost [-Description <String>] [-Password <String>] -Server <CHost> [-User <String>] [<CommonParameters>]
```
