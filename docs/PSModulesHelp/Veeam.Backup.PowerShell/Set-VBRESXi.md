Set-VBRESXi
-----------

### Synopsis
Modifies VMware ESXi hosts added to the backup infrastructure.

---

### Description

This cmdlet modifies an VMware ESXi host added to the backup infrastructure.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Modifying Credentials and Port Setting of VMware ESXi Host

$host = Get-VBRServer -Type ESXi -Name support.north.local
$creds = Get-VBRCredentials
Set-VBRESXi -Server $host -Credentials $creds -Port 442
This example shows how to change the credentials and Web service port settings of the ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $host variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $creds variable.
3. Run the Set-VBRESXi cmdlet. Set the $host variable as the Server parameter value. Set the $creds variable as the Credentials parameter value. Specify the Port parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the ESXi server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the ESXi server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify settings of VMware ESXi hosts without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Port**
Specifies the Web service port for connection to the ESXi host.
Default: 443.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies the ESXi host you want to modify.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

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
Set-VBRESXi [-Credentials <CCredentials>] [-Description <String>] [-Force] [-Port <Int32>] -Server <CHost> [<CommonParameters>]
```
