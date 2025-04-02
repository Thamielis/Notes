Get-ComputerTimeNtp
-------------------

### Synopsis
Gets (Simple) Network Time Protocol time (SNTP/NTP, rfc-1305, rfc-2030) from a specified server

---

### Description

This function connects to an NTP server on UDP port 123 and retrieves the current NTP time.
Selected components of the returned time information are decoded and returned in a PSObject.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-NtpTime uk.pool.ntp.org
Gets time from the specified server.
```
> EXAMPLE 2

```PowerShell
Get-NtpTime | fl *
Get time from default server (pool.ntp.org) and displays all output object attributes.
```

---

### Parameters
#### **Server**
The NTP Server to contact.  Uses pool.ntp.org by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ToLocal**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
Author https://github.com/ChrisWarwick/PowerShell-NTP-Time
Slightly simplified for different usage scenarios

---

### Syntax
```PowerShell
Get-ComputerTimeNtp [[-Server] <String>] [-ToLocal] [<CommonParameters>]
```
