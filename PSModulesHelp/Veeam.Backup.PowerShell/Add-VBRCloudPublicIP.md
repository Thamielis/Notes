Add-VBRCloudPublicIP
--------------------

### Synopsis
Adds public IP address or a pool of IP addresses.

---

### Description

This cmdlet adds a single IP address or a range of IP addresses to the public IP address pool.  You can create a pool of public IP addresses and provide them to tenants.  The tenants will be able to connect their replicas to your network so that the replicas are accessible from the Internet during a full site failover.

---

### Examples
> Example 1. Creating Pool of Public IP Addresses

```PowerShell
Add-VBRCloudPublicIP -FirstIpAddress 198.51.100.1 -LastIpAddress 198.51.100.15
This command creates a pool of public IP addresses.
```
> Example 2. Adding Public IP Address

```PowerShell
Add-VBRCloudPublicIP -FirstIpAddress 198.51.100.17
This command adds an individual public IP address.
```

---

### Parameters
#### **FirstIpAddress**
Specifies a single IP address or the first IP address of the range that you want to add.

|Type         |Required|Position|PipelineInput |
|-------------|--------|--------|--------------|
|`[IPAddress]`|true    |named   |True (ByValue)|

#### **LastIpAddress**
Specifies the last IP address of the range that you want to add.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

---

### Inputs
System.Net.IPAddress

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCloudPublicIP -FirstIpAddress <IPAddress> [-LastIpAddress <IPAddress>] [<CommonParameters>]
```
