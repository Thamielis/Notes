Get-ComputerDevice
------------------

### Synopsis
Retrieves information about computer devices.

---

### Description

This function retrieves information about computer devices using WMI.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerDevice -ComputerName "Computer01" -Protocol "Wsman" -All
Retrieves all properties of computer devices from a remote computer using Wsman protocol.
```
> EXAMPLE 2

```PowerShell
Get-ComputerDevice -ComputerName "Computer02" -Extended
Retrieves extended properties of computer devices from a remote computer.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer to query. Defaults to the local computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for the query. Valid values are 'Default', 'Dcom', or 'Wsman'. Default is 'Default'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Retrieves all properties of the computer devices.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Extended**
Retrieves extended properties of the computer devices.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerDevice [[-ComputerName] <String>] [[-Protocol] <String>] [-All] [-Extended] [<CommonParameters>]
```
