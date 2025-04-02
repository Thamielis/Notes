Add-VBRCloudGateway
-------------------

### Synopsis
Creates cloud gateways for Veeam Cloud Connect.

---

### Description

This cmdlet creates a cloud gateway.

Performing operations on Cloud Connect infrastructure requires the VCP licence.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Adding New Gateway with Direct Network Connection

$server = Get-VBRServer -Name "Cloud_Gateway"
Add-VBRCloudGateway -Server $server -Description "Gateway directly connected to Internet" -IpAddress 104.45.85.123 -IncomingPort 6260 -NetworkMode Direct
This example shows how to add a new cloud gateway with a direct network connection.  The port that will be used by Veeam Backup & Replication to connect to the gateway server is 6260.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Run the Add-VBRCloudGateway cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Description parameter value.
- Specify the IpAddress parameter value.
- Specify the IncomingPort parameter value.
- Set the Direct option for the NetworkMode parameter.
> Example 2. Adding New Gateway in Local Network Behind NAT Gateway

Add-VBRCloudGateway -Server $server -Description "Gateway behind NAT" -IpAddress 104.45.95.227 -IncomingPort 6180 -NATPort 7180 -NetworkMode NAT
This example shows how to add a new cloud gateway in the local network behind the NAT gateway with the following settings:
- The external NAT gateway IP is 104.45.95.227.
- The port that will be used by Veeam Backup & Replication to connect to the gateway server is 6180.
- The port that will be used by the NAT gateway is 7180.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Run the Add-VBRCloudGateway cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Description parameter value.
- Specify the IpAddress parameter value.
- Specify the IncomingPort parameter value.
- Specify the NATPort parameter value.
- Set the NAT option for the NetworkMode parameter.

---

### Parameters
#### **Description**
Specifies the description of the cloud gateway.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **IncomingPort**
SSpecifies a port on the NAT gateway used for listening to connections from users and passing cloud commands from users to the SP Veeam backup server. Permitted values: 1 to 65535. Default: 6180.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **IpAddress**
Specifies an external IP address of the NAT or network interface gateway. Accepts the IPAddress object or string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NATPort**
Specifies an external port that will be used by the Veeam backup server to connect to the gateway. Permitted values: 1 to 65535. Default: (for Direct) null, (for NAT) 6180.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **NetworkMode**
Specifies the network mode: Direct, NAT.
Valid Values:

* Direct
* NAT

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRGatewayNetworkMode]`|false   |named   |False        |

#### **Server**
Specifies server that will perform the role of a cloud gateway. You can select any server added to Veeam Backup & Replication on assign the cloud gateway role to the Veeam backup server itself. Accepted server types: Windows, Local. Default: Local. Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet.

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
Add-VBRCloudGateway [-Description <String>] [-IncomingPort <Int32>] [-IpAddress <String>] [-NATPort <Int32>] [-NetworkMode {Direct | NAT}] [-Server <CHost>] [<CommonParameters>]
```
