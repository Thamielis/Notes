Get-ComputerStartup
-------------------

### Synopsis
Retrieves information about startup programs on a remote computer.

---

### Description

The Get-ComputerStartup function retrieves information about startup programs on a specified computer using CIM/WMI.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerStartup -ComputerName "RemoteComputer" -Protocol Wsman
Retrieves startup program information from a remote computer using the Wsman protocol.
```
> EXAMPLE 2

```PowerShell
Get-ComputerStartup -All
Retrieves all startup program information from the local computer.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer to retrieve startup information from. Defaults to the local computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for the connection. Valid values are 'Default', 'Dcom', or 'Wsman'. Default is 'Default'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Indicates whether to retrieve all properties of the startup programs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerStartup [[-ComputerName] <String[]>] [[-Protocol] <String>] [-All] [<CommonParameters>]
```
