Set-VBRHvInstantRecoveryHelperAppliance
---------------------------------------

### Synopsis
Modifies settings for a helper appliance.

---

### Description

This cmdlet modifies settings of a helper appliance used in Instant Recovery to Microsoft Hyper-V.

NOTE: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Examples
> Example 1

$network = Get-VBRHvServerNetworkInfo -Server "srv01.tech.local"
$appliance = New-VBRHvInstantRecoveryHelperAppliance -Network $network
Set-VBRHvInstantRecoveryHelperAppliance -HelperAppliance $appliance -ObtainIPAutomatically
This example shows how to modify IP address settings for a helper appliance.

1. Run the Get-VBRHvServerNetworkInfo cmdlet. Specify the Server parameter. Save the result to the $network variable.
2. Run the New-VBRHvInstantRecoveryHelperAppliance cmdlet. Specify the Network parameter. Save the result to the $appliance variable.
3. Run the Set-VBRHvInstantRecoveryHelperAppliance cmdlet. Set the $appliance variable as the HelperAppliance parameter value. Provide the ObtainIPAutomatically parameter.

---

### Parameters
#### **AlternateDNSServer**
Specifies the IPv4 address of an alternate DNS server in the network where the appliance resides

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **DefaultGateway**
Specifies the IPv4 address of the default gateway in the network where the appliance resides

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **EnableIPv4Interface**
Enables the option to use IPv4 addresses.
IPv4 is used by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableIPv6Interface**
Enables the option to use IPv6 addresses.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HelperAppliance**
Specifies a helper appliance which settings you want to modify.

|Type                                   |Required|Position|PipelineInput                 |
|---------------------------------------|--------|--------|------------------------------|
|`[VBRHvInstantRecoveryHelperAppliance]`|true    |named   |True (ByPropertyName, ByValue)|

#### **IpAddress**
Applies if the ObtainIPAutomatically parameter is set to False.
Specifies the IPv4 address of the helper appliance

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6Address**
Applies if the EnableIPv6Interface parameter is specified and the ObtainIPAutomatically parameter is set to False.
If you provide this parameter Veeam Backup & Replication will use IPv6 addresses.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6AlternateDNSServer**
Applies if the EnableIPv6Interface parameter is specified and the ObtainIPAutomatically parameter is set to False.
Specifies the IPv6 address of an alternate DNS server in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6DefaultGateway**
Applies if the EnableIPv6Interface parameter is specified and the ObtainIPAutomatically parameter is set to False. Specifies the IPv6 address of the default gateway in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PreferredDNSServer**
Applies if the EnableIPv6Interface parameter is specified and the ObtainIPAutomatically parameter is set to False.
Specifies the IPv6 address of the DNS server in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PrefixLength**
Applies if the EnableIPv6Interface parameter is specified and the ObtainIPAutomatically parameter is set to False.
Specifies the length of the IPv6 prefix.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Network**
Specifies an array of production networks to which the helper appliance must be connected.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo]`|false   |named   |False        |

#### **ObtainDNSAutomatically**
Use if you have a DHCP server in the network.
If you provide this parameter, Veeam Backup & Replication will obtain an IPv4 address of the DNS server automatically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPAutomatically**
Use if you have a DHCP server in the network.
If you provide this parameter, Veeam Backup & Replication will obtain an IP address of the helper appliance automatically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPv6AddressAutomatically**
Use if you have a DHCP server in the network.
If you provide this parameter, Veeam Backup & Replication will obtain an IPv6 address of the helper appliance automatically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ObtainIPv6DNSAutomatically**
For the EnableIPv6Interface parameter specified and the ObtainIPAutomatically parameter set to False.
Use if you have a DHCP server in the network.
If you provide this parameter, Veeam Backup & Replication will obtain an IPv6 address of the DNS server automatically.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PreferredDNSServer**
Specifies the IPv4 address of the DNS server in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **SubnetMask**
Specifies the subnet mask of the network where the helper appliance will be connected.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **VLanID**
Specifies the VLAN ID where the helper appliance must reside.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRHvInstantRecoveryHelperAppliance

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvInstantRecoveryHelperAppliance [-AlternateDNSServer <IPAddress>] [-DefaultGateway <IPAddress>] [-EnableIPv4Interface] [-EnableIPv6Interface] -HelperAppliance <VBRHvInstantRecoveryHelperAppliance> 
```
```PowerShell
[-IpAddress <IPAddress>] [-IPv6Address <IPAddress>] [-IPv6AlternateDNSServer <IPAddress>] [-IPv6DefaultGateway <IPAddress>] [-IPv6PreferredDNSServer <IPAddress>] [-IPv6PrefixLength <Int32>] [-Network 
```
```PowerShell
<VBRHvServerNetworkInfo>] [-ObtainDNSAutomatically] [-ObtainIPAutomatically] [-ObtainIPv6AddressAutomatically] [-ObtainIPv6DNSAutomatically] [-PreferredDNSServer <IPAddress>] [-SubnetMask <IPAddress>] [-VLanID 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
