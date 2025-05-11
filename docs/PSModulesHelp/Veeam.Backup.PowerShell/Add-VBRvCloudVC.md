Add-VBRvCloudVC
---------------

### Synopsis
Adds vCenter Server managed by Cloud Director to Veeam Backup & Replication.

---

### Description

This cmdlet adds a new vCenter Server to Veeam Backup & Replication infrastructure. The vCenter Server is registered as a part of Cloud Director.
Note: Run the Add-VBRvCloud cmdlet to add a Cloud Director server to Veeam Backup & Replication infrastructure.

---

### Examples
> Example 1

$vc = Find-VBRvCloudEntity -Vc
Get-VBRServer -Name "172.16.1.13" | Add-VBRvCloudVC -VCInfo $vc -User "Administrator" -Password "Password" -Name "vCenter Server 1"
This example shows how to add a new vCenter Server with the following parameters:
- The vCenter will be registered on the server with 172.16.1.13 IP address.
- The user name is Administrator and the password is Password.
- The Port parameter is not set to enable the default 443 web-service port number.
- The Description parameter is not set to enable the default description.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Provide the Vc parameter. Save the result to the $vc variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Add-VBRvCloudVC cmdlet. Specify the following settings:
- Set the $vc variable as the VCInfo parameter value.
- Specify the User and the Password parameter values.
- Specify the Name parameter value.
> Example 2

$s = Get-VBRServer -Name "172.16.1.13"
$vc = Find-VBRvCloudEntity -Vc
$creds = Get-VBRCredentials -Name "vCenter Administrator"
Add-VBRvCloudVC -vCloudServer $s -VCInfo $vc -Credentials $creds -Name "vCenter Server 2" -Port 456
This command adds a new vCenter Server with the following parameters:
- The vCenter will be registered on the server with 172.16.1.13 IP address.
- The Port parameter is set to 456.
- The Description parameter is not set to enable the default description.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $s variable.
2. Run the Find-VBRvCloudEntity cmdlet. Provide the Vc parameter. Save the result to the $vc variable.
3. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the credentials to the $creds variable.
4. Run the Add-VBRvCloudVC cmdlet. Specify the following settings:
- Set the $s variable as the vCloudServer parameter value.
- Set the $vc variable as the VCInfo parameter value.
- Set the $creds variable as the Credentials parameter value.
- Specify the Name parameter value.
- Specify the Port parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the vCenter Server.
If you use the Credentials scenario, the User and Password parameters must be omitted.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Description**
Specifies the description of the vCenter Server.
If not set, the default description containing the user name of the user who created the record and date and time of creation will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add a vCenter Server without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the DNS name or IP address of the vCenter Server you want to connect.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use for authenticating with the vCenter Server.
If you use the User/Password scenario, the Credentials parameter must be omitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |False        |

#### **Port**
Specifies the web-service port number. If not set, the default port number 443 will be used.
Note: When you customize the port number, you must set this port on the vCenter Server/ESXi host settings first.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **User**
Specifies the user name you want to use for authenticating with the vCenter Server.
If you use the User/Password scenario, the Credentials parameter must be omitted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **VCInfo**
Specifies the vCenter Server you want to connect to the Cloud Director.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CVcdVcInfo]`|true    |1       |False        |

#### **vCloudServer**
Specifies the Cloud Director server you want to connect a vCenter to.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |0       |True (ByPropertyName, ByValue)|

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
Add-VBRvCloudVC [-vCloudServer] <CHost> [-VCInfo] <CVcdVcInfo> -Credentials <CCredentials> [-Description <String>] [-Force] [-Name <String>] [-Port <Int32>] [<CommonParameters>]
```
```PowerShell
Add-VBRvCloudVC [-vCloudServer] <CHost> [-VCInfo] <CVcdVcInfo> [-User] <String> [-Password] <String> [-Description <String>] [-Force] [-Name <String>] [-Port <Int32>] [<CommonParameters>]
```
