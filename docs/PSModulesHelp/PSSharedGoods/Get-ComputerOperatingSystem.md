Get-ComputerOperatingSystem
---------------------------

### Synopsis
Retrieves operating system information from remote computers.

---

### Description

This function retrieves operating system information from remote computers using CIM/WMI queries. It provides details such as the operating system name, version, manufacturer, architecture, language, product suite, installation date, last boot-up time, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerOperatingSystem -ComputerName "Server01" -Protocol Wsman
Retrieves operating system information from a single remote computer named "Server01" using the Wsman protocol.
```
> EXAMPLE 2

```PowerShell
Get-ComputerOperatingSystem -ComputerName "Server01", "Server02" -All
Retrieves all available operating system properties from multiple remote computers named "Server01" and "Server02".
```

---

### Parameters
#### **ComputerName**
Specifies the name of the remote computer(s) to retrieve the operating system information from. Defaults to the local computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for the connection (Default, Dcom, or Wsman). Default is 'Default'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Switch parameter to retrieve all available properties of the operating system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerOperatingSystem [[-ComputerName] <String[]>] [[-Protocol] <String>] [-All] [<CommonParameters>]
```
