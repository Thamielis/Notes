Add-VBRvCloud
-------------

### Synopsis
Adds a Cloud Director server to Veeam Backup & Replication.

---

### Description

This cmdlet adds a new Cloud Director server to Veeam Backup & Replication infrastructure.
Note: Run the Add-VBRvCloudVC cmdlet to add a vCenter Server managed by Cloud Director to Veeam Backup & Replication infrastructure.

---

### Examples
> Example 1

Add-VBRvCloud -Name "vCloudDirectorServer.domain.com" -User Administrator -Password password -Url "https://vclouddirectorserver:443" -Description "Cloud Director Server"
This command creates a new vCloudDirectorServer server with the following settings:
- The URL address is https://vclouddirectorserver:443.
- The user name is Administrator and the password is password.
- The description is Cloud Director Server.
> Example 2

$administrator = Get-VBRCredentials -Name "Administrator"
Add-VBRvCloud -Name "vCloudDirectorServer.domain.com" -Credentials $administrator -Url "https://vclouddirectorserver:443"
This example shows how to create a new vCloudDirectorServer server with the following settings:
- The URL address is https://vclouddirectorserver:443.
- The user name is Administrator and the password is password.
- The description is the default one.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $administrator variable.
2. Run the Add-VBRvCloud cmdlet. Specify the Name parameter value. Set the $administrator variable as the Credentials parameter value. Specify the Url parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the Cloud Director server.
If you use the Credentials scenario, the User and Password parameters must be omitted.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the new Cloud Director server.
If not set, the user name who created the server and the date and time of creation will be added by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the full DNS name or IP address of the Cloud Director server or any cell in the Cloud Director infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **Password**
Specifies the password you want to use for authenticating with the Cloud Director server.
If you use the Username/Password scenario, the Credentials parameter must be omitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **Url**
Specifies the URL you want to connect to the Cloud Director Web API with.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the Cloud Director server.
If you use the Username/Password scenario, the Credentials parameter must be omitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

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
Add-VBRvCloud [-Name] <String> -Credentials <CCredentials> [-Description <String>] [-Url <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Add-VBRvCloud [-Name] <String> [-User] <String> [-Password] <String> [-Description <String>] [-Url <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
