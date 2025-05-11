Add-VBRESXi
-----------

### Synopsis
Adds VMware ESXi hosts to the backup infrastructure.

---

### Description

This cmdlet adds VMware ESXi hosts to the backup infrastructure.
Note: If an ESXi host is a part of a vCenter Server, it is recommended to add the vCenter Server instead of a single ESXi host.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding VMware ESXi Hosts Using Account User Name and Password

```PowerShell
Add-VBRESXi -Name 172.16.11.188 -User Administrator -Password qwerty
This command adds the 172.16.11.188 ESXi host with the Administrator user name and the qwerty password of the account.
```
> Example 2. Adding VMware ESXi Hosts Using Credentials Managed by Veeam Backup & Replication

$Administrator = Get-VBRCredentials
Add-VBRESXi -Name 172.16.11.188 -Credentials $Administrator
This example shows how to add the 172.16.11.188 ESXi host using the credentials managed by Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $Administrator variable.
2. Run the Add-VBRESXi cmdlet. Specify the Name parameter value. Set the $Administrator variable as the Credentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the ESXi server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the ESXi server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add VMware ESXi hosts without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the full DNS name or IP address of the ESXi host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **Password**
Specifies the password you want to use for authenticating with the ESXi host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **Port**
Specifies the Web service port for connection to the ESXi host.
Default: 443.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the ESXi host.

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
Add-VBRESXi [-Name] <String> -Credentials <CCredentials> [-Description <String>] [-Force] [-Port <Int32>] [<CommonParameters>]
```
```PowerShell
Add-VBRESXi [-Name] <String> [-User] <String> [-Password] <String> [-Description <String>] [-Force] [-Port <Int32>] [<CommonParameters>]
```
