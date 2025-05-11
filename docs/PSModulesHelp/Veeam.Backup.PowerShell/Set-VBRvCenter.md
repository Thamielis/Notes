Set-VBRvCenter
--------------

### Synopsis
Modifies VMware vCenter servers added to the backup infrastructure.

---

### Description

This cmdlet modifies a selected VMware vCenter server added to Veeam Backup & Replication. To modify settings, you need to enter the corresponding parameters with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Modifying vCenter Server Port and Credentials

$server = Get-VBRServer -Type VC -Name abc.support.main.local
$creds = Get-Credential
Set-VBRvCenter -Server $server -Credentials $creds -Port 444
This example shows how to change the credentials and Web service port settings for the vCenter Server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $creds variable.
3. Run the Set-VBRvCenter cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Set the $creds variable as the Credentials parameter value.
- Specify the Port parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the vCenter server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the vCenter server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify a vCenter Server without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Port**
Specifies the Web service port for connection to the vCenter server.
Default: 443.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies the vCenter server you want to modify.

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
Set-VBRvCenter [-Credentials <CCredentials>] [-Description <String>] [-Force] [-Port <Int32>] -Server <CHost> [<CommonParameters>]
```
