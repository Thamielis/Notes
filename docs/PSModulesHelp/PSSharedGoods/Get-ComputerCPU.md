Get-ComputerCPU
---------------

### Synopsis
Retrieves CPU information from specified computers.

---

### Description

This function retrieves CPU information from the specified computers. It provides details such as Name, DeviceID, Caption, SystemName, CurrentClockSpeed, MaxClockSpeed, ProcessorID, ThreadCount, Architecture, Status, LoadPercentage, L3CacheSize, Manufacturer, NumberOfCores, NumberOfEnabledCore, and NumberOfLogicalProcessors.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerCPU -ComputerName Server01, Server02 -Protocol Wsman -All
Retrieves all available CPU information from remote computers Server01 and Server02 using Wsman protocol.
```
> EXAMPLE 2

```PowerShell
Get-ComputerCPU -ComputerName "Workstation01" -Protocol Default
Retrieves CPU information from a single remote computer named Workstation01 using the default protocol.
```

---

### Parameters
#### **ComputerName**
Specifies the names of the computers for which to retrieve CPU information.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for retrieving CPU information. Valid values are 'Default', 'Dcom', and 'Wsman'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Indicates whether to retrieve all available CPU information.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerCPU [[-ComputerName] <String[]>] [[-Protocol] <String>] [-All] [<CommonParameters>]
```
