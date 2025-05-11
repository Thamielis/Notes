New-VBRHvInstantRecoveryHelperAppliance
---------------------------------------

### Synopsis
Defines settings for a helper appliance.

---

### Description

This cmdlet defines the VBRHvInstantRecoveryHelperAppliance object. This object contains settings for a helper appliance used in Instant Recovery to Microsoft Hyper-V.

---

### Examples
> Example 1

$network = Get-VBRHvServerNetworkInfo -Server "srv01.tech.local"
New-VBRHvInstantRecoveryHelperAppliance -Network $network
This example shows how to configure a network for a helper appliance used in Instant Recovery to Microsoft Hyper-V.

Perform the following steps:

1.	Run the Get-VBRHvServerNetworkInfo cmdlet. Specify the Server parameter value. Save the result to the $network variable. 2.	Run the New-VBRHvInstantRecoveryHelperAppliance cmdlet. Set the $network variable as the Network parameter value.

---

### Parameters
#### **AlternateDNSServer**
Specifies the IPv4 address of an alternate DNS server in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **DefaultGateway**
Specifies the IPv4 address of the default gateway in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **EnableIPv4Interface**
If you provide this parameter Veeam Backup & Replication will use IPv4 addresses.
IPv4 is used by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableIPv6Interface**
If you provide this parameter Veeam Backup & Replication will use IPv6 addresses.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IpAddress**
For the ObtainIPAutomatically parameter set to False.
Specifies the IPv4 address of the helper appliance.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6Address**
For the EnableIPv6Interface parameter specified and the ObtainIPAutomatically parameter set to False.
If you provide this parameter Veeam Backup & Replication will use IPv6 addresses.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6AlternateDNSServer**
For the EnableIPv6Interface parameter specified and the ObtainIPAutomatically parameter set to False.
Specifies the IPv6 address of an alternate DNS server in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6DefaultGateway**
For the EnableIPv6Interface parameter specified and the ObtainIPAutomatically parameter set to False.
Specifies the IPv6 address of the default gateway in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PreferredDNSServer**
For the EnableIPv6Interface parameter specified and the ObtainIPAutomatically parameter set to False.
Specifies the IPv6 address of the DNS server in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PrefixLength**
For the EnableIPv6Interface parameter specified and the ObtainIPAutomatically parameter set to False.
Specifies the length of the IPv6 prefix.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Network**
Specifies an array of production networks to which the helper appliance must be connected.
Accepts the VBRHvServerNetworkInfo[] object. To get this object, run the Get-VBRHvServerNetworkInfo cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRHvServerNetworkInfo]`|true    |named   |False        |

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRHvInstantRecoveryHelperAppliance [-AlternateDNSServer <IPAddress>] [-DefaultGateway <IPAddress>] [-EnableIPv4Interface] [-EnableIPv6Interface] [-IpAddress <IPAddress>] [-IPv6Address <IPAddress>] 
```
```PowerShell
[-IPv6AlternateDNSServer <IPAddress>] [-IPv6DefaultGateway <IPAddress>] [-IPv6PreferredDNSServer <IPAddress>] [-IPv6PrefixLength <Int32>] -Network <VBRHvServerNetworkInfo> [-ObtainDNSAutomatically] 
```
```PowerShell
[-ObtainIPAutomatically] [-ObtainIPv6AddressAutomatically] [-ObtainIPv6DNSAutomatically] [-PreferredDNSServer <IPAddress>] [-SubnetMask <IPAddress>] [-VLanID <Int32>] [<CommonParameters>]
```
