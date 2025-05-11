Set-DnsServerIpAddress
----------------------

### Synopsis
Sets the DNS server IP addresses on a specified computer for a given network interface.

---

### Description

This function allows you to set the DNS server IP addresses on a specified computer for a given network interface. It checks if the computer is online before attempting to set the DNS server addresses.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-DnsServerIpAddress -ComputerName "Server01" -NicName "Ethernet*" -IpAddresses '8.8.8.8','8.8.4.4','8.8.8.1'
Sets the DNS server IP addresses '8.8.8.8', '8.8.4.4', and '8.8.8.1' on the network interface starting with "Ethernet" on the computer "Server01".
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer where the DNS server IP addresses will be set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **NicName**
Specifies the name of the network interface (NIC) where the DNS server IP addresses will be set. Supports wildcard characters.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **IpAddresses**
Specifies one or more IP addresses of the DNS servers to be set on the specified network interface.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Notes
This function may require further enhancements for specific use cases.

---

### Syntax
```PowerShell
Set-DnsServerIpAddress [[-ComputerName] <String>] [[-NicName] <String>] [[-IpAddresses] <String>] [<CommonParameters>]
```
