Add-VBRPreferredNetwork
-----------------------

### Synopsis
Specifies preferred networks.

---

### Description

This cmdlet specifies preferred networks for the backup infrastructure.
You can instruct Veeam Backup & Replication to transfer data over preferred networks only. To do that, run the Enable-VBRPreferredNetworkDataTransfer cmdlet.

---

### Examples
> Adding Preferred Network to List

```PowerShell
Add-VBRPreferredNetwork -IpAddress 192.168.0.1 -SubnetMask 255.255.255.255
This command adds the a preferred network to a list of preferred networks.
```

---

### Parameters
#### **IpAddress**
Specifies the IP address for a preferred network.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[IPAddress]`|true    |named   |True (ByPropertyName)|

#### **SubnetMask**
Specifies the subnet mask for a preferred network

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

---

### Inputs
System.Net.IPAddress

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRPreferredNetwork -IpAddress <IPAddress> -SubnetMask <String> [<CommonParameters>]
```
