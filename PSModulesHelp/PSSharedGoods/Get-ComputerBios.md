Get-ComputerBios
----------------

### Synopsis
Retrieves BIOS information from a remote or local computer.

---

### Description

This function retrieves BIOS information from a specified computer using CIM/WMI.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerBios -ComputerName "RemoteComputer" -Protocol Wsman
Retrieves BIOS information from a remote computer using the Wsman protocol.
```
> EXAMPLE 2

```PowerShell
Get-ComputerBios -All
Retrieves all available BIOS information from the local computer.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer to retrieve BIOS information from. Defaults to the local computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for communication. Valid values are 'Default', 'Dcom', or 'Wsman'. Default is 'Default'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Switch parameter to retrieve all available BIOS properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerBios [[-ComputerName] <String>] [[-Protocol] <String>] [-All] [<CommonParameters>]
```
