Convert-IpAddressToPtr
----------------------

### Synopsis
Converts an IP address to a PTR record

---

### Description

This function takes an IP address as input and converts it to a PTR record.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-IpAddressToPtr -IPAddress "10.1.2.3"
```
> EXAMPLE 2

```PowerShell
Convert-IpAddressToPtr -IPAddress "10.1.2.3", "8.8.8.8" -AsObject
```

---

### Parameters
#### **IPAddress**
The IP address to convert

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |false        |

#### **AsObject**
Should the function return an object instead of a string?

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-IpAddressToPtr [-IPAddress] <String[]> [-AsObject] [<CommonParameters>]
```
