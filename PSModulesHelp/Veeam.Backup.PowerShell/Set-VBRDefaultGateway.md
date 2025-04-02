Set-VBRDefaultGateway
---------------------

### Synopsis
Modifies cloud default gateways.

---

### Description

This cmdlet modifies the default cloud gateway.

---

### Examples
> Example 1

```PowerShell
$c = Get-VBRDefaultGatewayConfiguration
$alldefaultgateways = $c.Defaultgateway.name
$alldefaultgateways
Hardware plan hv network 1
Hardware plan hv network 1 (internet)
$defaultgateway = $c.Defaultgateway[0]
Set-VBRDefaultGateway -Gateway $defaultgateway -IpAddress "172.16.2.232" -NetworkMask "255.255.0.0"
This example shows how to set the IP address and the network mask of a selected default gateway. Run Get-VBRDefaultGatewayConfiguration to get all default gateway configurations. Save it to $c variable. Get all default gateways by name. Save the array of gateways to $alldefaultgateways variable. Run $alldefaultgateways to see all the names of all gateways available. Select the first default gateway from the array. Save it to $defaultgateway variable. Run Set-VBRDefaultGateway to set the IP address and network mask of the selected default gateway.
```

---

### Parameters
#### **Gateway**
Specifies the default cloud gateway you want to modify.
Accepts VBRDefaultGateway object.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRDefaultGateway]`|true    |named   |True (ByPropertyName, ByValue)|

#### **IpAddress**
Specifies the IP address you want to assign to the default gateway.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Ipv6Address**
Specifies the IPv6 address that you want to assign to the default gateway.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Ipv6PrefixLength**
Specifies the length of an IPv6 prefix.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Byte]`|false   |named   |False        |

#### **Ipv6SubnetAddress**
Specifies the production IPv6 network.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NetworkMask**
Specifies the network mask you want to assign to the default gateway.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PassThru**
Indicates that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDefaultGateway

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRDefaultGateway -Gateway <VBRDefaultGateway> [-IpAddress <String>] [-Ipv6Address <String>] [-Ipv6PrefixLength <Byte>] [-Ipv6SubnetAddress <String>] [-NetworkMask <String>] [-PassThru] [<CommonParameters>]
```
