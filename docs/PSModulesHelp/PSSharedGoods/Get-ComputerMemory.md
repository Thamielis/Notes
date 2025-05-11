Get-ComputerMemory
------------------

### Synopsis
Retrieves memory information from specified computers.

---

### Description

This function retrieves memory information from specified computers, including details about physical memory usage, virtual memory usage, and memory percentages.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerMemory -ComputerName "Server01"
Retrieves memory information from a remote computer named Server01.
```
> EXAMPLE 2

```PowerShell
Get-ComputerMemory -ComputerName "WorkstationA", "WorkstationB" -Protocol Wsman -All
Retrieves all available memory properties from multiple remote computers using the Wsman protocol.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer(s) to retrieve memory information from. Defaults to the local computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for retrieving memory information. Valid values are 'Default', 'Dcom', and 'Wsman'. Defaults to 'Default'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Switch parameter to retrieve all available memory properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerMemory [[-ComputerName] <String[]>] [[-Protocol] <String>] [-All] [<CommonParameters>]
```
