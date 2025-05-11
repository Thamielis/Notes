Set-VBRCloudGateway
-------------------

### Synopsis
Modifies cloud gateways.

---

### Description

This cmdlet modifies an existing cloud gateway. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCloudGateway](Get-VBRCloudGateway)

---

### Examples
> Example 1. Setting New Port for Cloud Gateway [Using Variable]

$cloudgateway = Get-VBRCloudGateway -Name "Cloud Gateway"
Set-VBRCloudGateway -CloudGateway $cloudgateway -IncomingPort 9012
This example shows how to set a new port for the cloud gateway to connect to Veeam Backup & Replication. The new port number is set to 9012.

Perform the following steps:
1. Run the Get-VBRCloudGateway cmdlet. Specify the Name parameter value. Save the result to the $cloudgateway variable.
2. Run the Set-VBRCloudGateway cmdlet. Set the $cloudgateway variable as the CloudGateway parameter value. Specify the IncomingPort parameter value.
> Example 2. Setting New Port for Cloud Gateway [Using Pipeline]

Get-VBRCloudGateway | Set-VBRCloudGateway -IpAddress 172.16.10.20 -IncomingPort 8062
This example shows how to set a new cloud gateway IP address and port to connect to Veeam Backup & Replication. The IP address is set to 172.16.10.20 and the port is set to 8062.

Perform the following steps:
1. Run the Get-VBRCloudGateway cmdlet.
2. Pipe the cmdlet output to the Set-VBRCloudGateway cmdlet. Specify the IpAddress and the IncomingPort parameter values.

---

### Parameters
#### **CloudGateway**
Specifies the cloud gateway you want to modify. Accepts the VBRCloudGateway object. To get this object, run the Get-VBRCloudGateway cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRCloudGateway]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies the description of the cloud gateway.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **IncomingPort**
Specifies a port on the NAT gateway used for listening to connections from users and passing cloud commands from users to the SP Veeam backup server. Permitted values: 1 to 65535. Default: 6180.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **IpAddress**
Specifies an external IP address of the NAT or network interface gateway. Accepts IPAddress object or string type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NATPort**
SSpecifies an external port that will be used by the Veeam backup server to connect to the gateway. Permitted values: 1 to 65535. Default: (for Direct) null, (for NAT) 6180.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **NetworkMode**
Specifies network mode: Direct, NAT.
Valid Values:

* Direct
* NAT

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRGatewayNetworkMode]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudGateway

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudGateway -CloudGateway <VBRCloudGateway> [-Description <String>] [-IncomingPort <Int32>] [-IpAddress <String>] [-NATPort <Int32>] [-NetworkMode {Direct | NAT}] [-PassThru] [<CommonParameters>]
```
