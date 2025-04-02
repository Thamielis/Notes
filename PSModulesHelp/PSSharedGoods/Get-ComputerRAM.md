Get-ComputerRAM
---------------

### Synopsis
Retrieves information about the RAM of a specified computer.

---

### Description

This function retrieves detailed information about the RAM of a specified computer. It provides various properties such as Manufacturer, Model, Capacity, Speed, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerRAM -ComputerName "Server01" -Protocol Wsman
Retrieves RAM information from a remote computer named Server01 using the Wsman protocol.
```
> EXAMPLE 2

```PowerShell
Get-ComputerRAM -ComputerName "WorkstationA" -All
Retrieves all available RAM properties from a computer named WorkstationA.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer to retrieve RAM information from. Defaults to the local computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for retrieving RAM information. Valid values are 'Default', 'Dcom', and 'Wsman'. Defaults to 'Default'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Indicates whether to retrieve all available properties of the RAM. If specified, all properties will be retrieved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Extended**
Indicates whether to retrieve extended properties of the RAM. If specified, additional properties will be retrieved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerRAM [[-ComputerName] <String>] [[-Protocol] <String>] [-All] [-Extended] [<CommonParameters>]
```
