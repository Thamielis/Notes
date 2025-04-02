Set-VBRNDMPServer
-----------------

### Synopsis
Modifies NDMP server settings.

---

### Description

This cmdlet modifies settings of a selected NDMP server.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRNDMPServer](Get-VBRNDMPServer)

* [Get-VBRCredentials](Get-VBRCredentials)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Changing Gateway Server Selection for NDMP Server

$ndmp = Get-VBRNDMPServer -Name "NetApp.tech.local"
$gateway = Get-VBRServer  -Name "Gateway server"
$creds = Get-VBRCredentials -Name "GatewayServer"
Set-VBRNDMPServer -Name "NetApp.tech.local" -Credentials $creds -GatewayMode SelectedGateway -SelectedGateway $gateway -Port 10000
This command shows how to change the gateway server selection mode for an NDMP server. Veeam Backup & Replication will use a specific gateway server.
Perform the following steps:
1. Run the Get-VBRNDMPServer cmdlet. Specify the Name parameter value. Save the result to the $ndmp variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter. Save the result to the $gateway variable.
3. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
4. Run the Set-VBRNDMPServer cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $creds variable as the Credentials parameter value.
- Set the SelectedGateway option for the GatewayMode parameter.
- Set the $gateway variable as the SelectedGateway parameter value.
- Specify the Port parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials. Veeam Backup & Replication will use these credentials to connect to the NDMP server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **GatewayMode**
Specifies the gateway server. Veeam Backup & Replication will use this gateway server to connect to the NDMP server.
You can specify the following modes of selecting the gateway server:
* Automatic - use this option if you want Veeam Backup & Replication to choose the gateway server automatically.
* SelectedGateway - use this option if you want to specify the particlular gateway server. Use the SelectedGateway parameter to specify the server.
Valid Values:

* Automatic
* SelectedGateway

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRGatewayMode]`|false   |named   |False        |

#### **Name**
Specifies the DNS or IP address of the NDMP server that you want to modify.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Port**
Specifies the port. Veeam Backup & Replication will use that port to connect to the NDMP server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SelectedGateway**
For specifying a particular gateway server with the SelectedGateway option. Specifies the server that you want to use as the gateway server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Server**
Specifies the NDMP server that you want to modify.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRNDMPServer]`|true    |named   |False        |

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
Set-VBRNDMPServer [-Credentials <CCredentials>] [-GatewayMode {Automatic | SelectedGateway}] [-Name <String>] [-Port <Int32>] [-SelectedGateway <CHost>] -Server <VBRNDMPServer> [<CommonParameters>]
```
