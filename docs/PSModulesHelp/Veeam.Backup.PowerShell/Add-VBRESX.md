Add-VBRESX
----------

### Synopsis
WARNING! THIS CMDLET IS NO LONGER SUPPORTED. Adds ESX hosts to Veeam Backup & Replication.

---

### Description

This cmdlet adds ESX servers to the Veeam Backup & Replication managing console.  If an ESX host is a part of a vCenter hierarchy, it is recommended to add the vCenter Server instead of a single ESX host. When adding a new ESX server, you will need to provide either username and password or credentials. Use an appropriate parameter set for each case.

---

### Examples
> Example 1

```PowerShell
Add-VBRESX -Name 172.16.11.188 -User root -Password qwerty
This command adds the ESX host with 172.16.11.188 IP address. The username is "root" and the password is "qwerty".
```
> Example 2

```PowerShell
Add-VBRESX -Name 172.16.11.188 -Credentials $Administrator
This command adds the ESX host with 172.16.11.188 IP address. The credentials to authenticate with the host are obtained with  Get-VBRCredentials and assigned to the $cAdministrator variable beforehand.
```

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the ESX server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the ESX server. If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add VMware ESXi hosts without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the full DNS name or IP address of the ESX host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **Password**
Specifies the password you want to use for authenticating with the ESX host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **Port**
Sets the integer specifying the number of the Web service port used to connect to the ESX host. Default: 443.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SSHCredentials**
For SSH connection. Specify credentials you want to use to authenticate with the service console.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **SSHEnable**
Specifies the description of the ESX server. If not set, Veeam Backup & Replication will enter date and time of creation by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SSHPassword**
Specifies the string with the password of the account used for service console connection to the host (recommended).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SSHPort**
Sets the integer specifying the number of the service console port (recommended).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SSHUser**
Specifies the string with the user name of the account used for service console connection to the host (recommended).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the ESX host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |False        |

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
Add-VBRESX [-Name] <String> -Credentials <CCredentials> [-Description <String>] [-Force] [-Port <Int32>] [-SSHCredentials <CCredentials>] [-SSHEnable] [-SSHPassword <String>] [-SSHPort <Int32>] [-SSHUser 
```
```PowerShell
<String>] [<CommonParameters>]
```
```PowerShell
Add-VBRESX [-Name] <String> [-User] <String> [-Password] <String> [-Description <String>] [-Force] [-Port <Int32>] [-SSHCredentials <CCredentials>] [-SSHEnable] [-SSHPassword <String>] [-SSHPort <Int32>] 
```
```PowerShell
[-SSHUser <String>] [<CommonParameters>]
```
