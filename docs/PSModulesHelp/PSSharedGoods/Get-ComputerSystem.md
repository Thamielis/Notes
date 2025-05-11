Get-ComputerSystem
------------------

### Synopsis
Retrieves computer system information from remote computers.

---

### Description

This function retrieves computer system information from remote computers using CIM/WMI queries.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerSystem -ComputerName AD1, AD2, EVO1, ADFFS | ft -a *
Retrieves computer system information for the specified computers and displays it in a table format.
```

---

### Parameters
#### **ComputerName**
Specifies the names of the remote computers to retrieve system information from.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for the remote connection. Valid values are 'Default', 'Dcom', or 'Wsman'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **All**
Indicates whether to retrieve all available properties of the computer system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
This function uses CIM/WMI queries to gather system information from remote computers.

---

### Syntax
```PowerShell
Get-ComputerSystem [[-ComputerName] <String[]>] [[-Protocol] <String>] [-All] [<CommonParameters>]
```
