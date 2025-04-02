Set-VBRESX
----------

### Synopsis
WARNING! THIS CMDLET IS NO LONGER SUPPORTED. Modifies ESX hosts added to Veeam Backup & Replication.

---

### Description

This cmdlet modifies an ESX host added to the Veeam Backup & Replication. To modify settings, you need to enter the corresponding parameters with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1

```PowerShell
$host = Get-VBRServer -Type ESX -Name support.east.local
$creds = Get-Credential
Set-VBRESX -Server $host -Credentials $creds -Port 444
This example shows how to change the credentials and Web service port settings for the ESX host.

You will need to perform the following steps:   1.Run Get-VBRServer to get the ESX host. Save the result to the $host variable.   2.Run Get-Credential to create a credential object. Type the credentials you want to use for authenticating with the ESX host. Save the result to the $creds variable.   3.Run Set-VBRESX with the $host and $creds variables.
```

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the ESX server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description of the ESX server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify settings of ESX hosts without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Port**
Specifies the Web service port for connection to the ESX host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies the ESX host you want to modify.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **SSHCredentials**
For SSH connection. Specify credentials you want to use to authenticate with the service console.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **SSHEnable**
For SSH connection. Indicates that the ESX host is connected using service console connection.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Set-VBRESX [-Credentials <CCredentials>] [-Description <String>] [-Force] [-Port <Int32>] -Server <CHost> [-SSHCredentials <CCredentials>] [-SSHEnable] [<CommonParameters>]
```
