Add-VBRNDMPServer
-----------------

### Synopsis
Adds NDMP servers to the backup infrastructure.

---

### Description

This cmdlet adds NDMP servers to the backup infrastructure.

---

### Related Links
* [Add-VBRCredentials](Add-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Adding NDMP Server with Automatic Gateway Selection

$creds = Add-VBRCredentials -User "New NDMP" -Password "Password"
Add-VBRNDMPServer -Name "NetApp.tech.local" -Credentials $creds -GatewayMode Automatic -Port 10000
This example shows how to add an NDMP server to the backup infrastructure. Veeam Backup & Replication will select the gateway server automatically.
Perform the following steps:
1. Run the Add-VBRCredentials cmdlet. Specify the User and the Password parameters value. Save the result to the $creds variable.
2. Run the Add-VBRNDMPServer cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $creds variable as the Credentials parameter value.
- Set the Automatic option for the GatewayMode parameter.
- Specify the Port parameter value.
> Example 2. Adding NDMP Server with Manual Gateway Selection

$creds = Add-VBRCredentials -User "New NDMP" -Password "Password"
$gateway = Get-VBRServer  -Name "Gateway server"
Add-VBRNDMPServer -Name "NDMPv4 Storage" -Port 1000 -Credentials $creds -GatewayMode SelectedGateway -SelectedGateway $gateway
This example shows how to add an NDMP server to the backup infrastructure. Veeam Backup & Replication will use selected server as the gateway server.
Perform the following steps:
1. Run the Add-VBRCredentials cmdlet. Specify the User and the Password parameters value. Save the result to the $creds variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter. Save the result to the $gateway variable.
3. Run the Add-VBRNDMPServer cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Specify the Port parameter value.
- Set the $creds variable as the Credentials parameter value.
- Set the SelectedGateway option for the GatewayMode parameter.
- Set the $gateway variable as the SelectedGateway parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials. Veeam Backup & Replication will use these credentials to connect to an NDMP server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **GatewayMode**
Specifies a gateway server. Veeam Backup & Replication will use this gateway server to connect to the NDMP server.
You can select the following modes of selecting the gateway server:
* Automatic - use this option if you want Veeam Backup & Replication to choose the gateway server automatically.
* SelectedGateway - use this option if you want to specify the gateway server explicitly. Use the SelectedGateway parameter to specify the gateway server.
Valid Values:

* Automatic
* SelectedGateway

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRGatewayMode]`|true    |named   |False        |

#### **Name**
Specifies the DNS or IP of an NDMP server that you want to add to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Port**
Specifies the port. Veeam Backup & Replication will use that port to connect to an NDMP server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |False        |

#### **SelectedGateway**
For specifying a gateway server explicitly with the SelectedGateway option.
Specifies the server that you want to use as the gateway server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

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
Add-VBRNDMPServer -Credentials <CCredentials> -GatewayMode {Automatic | SelectedGateway} -Name <String> -Port <Int32> [-SelectedGateway <CHost>] [<CommonParameters>]
```
