Set-VBRHvCluster
----------------

### Synopsis
Modifies settings of a Hyper-V cluster.

---

### Description

Modifies settings of a Hyper-V cluster.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Modifying Password of Hyper-V ?luster

$Administrator = Get-VBRCredentials
$server = Get-VBRServer
Set-VBRHvCluster -Password "XXXXXXX" -Server $server
This example shows how to change the password of the account used to add the HYPCLUSTER01 Hyper-V ?luster to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
3. Run the Set-VBRHvCluster cmdlet. Specify the Password parameter value. Set the $server variable as the Server parameter value.
> Example 2. Modifying Credentials of Hyper-V ?luster

$Administrator = Get-VBRCredentials
$server = Get-VBRServer
Set-VBRHvCluster -Server $server -Credentials $Administrator
This example shows how  modify credentials of the HYPCLUSTER01 Hyper-V ?luster.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
3. Run the Set-VBRHvCluster cmdlet. Set the $server variable as the Server parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the Hyper-V cluster.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the Hyper-V cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the Hyper-V cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Server**
Specifies a Hyper-V cluster which settings you want to modify.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **User**
Specifies the user name you want to use for authenticating with the Hyper-V cluster.

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
Set-VBRHvCluster [-Credentials <CCredentials>] [-Description <String>] -Server <CHost> [<CommonParameters>]
```
```PowerShell
Set-VBRHvCluster [-Description <String>] [-Password <String>] -Server <CHost> [-User <String>] [<CommonParameters>]
```
