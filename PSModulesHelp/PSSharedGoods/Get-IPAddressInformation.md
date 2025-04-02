Get-IPAddressInformation
------------------------

### Synopsis
Retrieves detailed information about an IP address using the ip-api.com service.

---

### Description

This function retrieves detailed information about the specified IP address using the ip-api.com service. It provides details such as country, region, city, ISP, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-IpAddressInformation -IP "8.8.8.8"
Retrieves information about the IP address "8.8.8.8" using the ip-api.com service.
```

---

### Parameters
#### **IP**
Specifies the IP address for which information needs to be retrieved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Notes
This function requires an active internet connection to retrieve IP address information from the ip-api.com service.

---

### Syntax
```PowerShell
Get-IPAddressInformation [[-IP] <String>] [<CommonParameters>]
```
