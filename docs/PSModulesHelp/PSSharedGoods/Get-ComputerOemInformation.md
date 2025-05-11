Get-ComputerOemInformation
--------------------------

### Synopsis
Retrieves OEM information from a specified computer.

---

### Description

This function retrieves OEM information such as Model, Manufacturer, Logo, Support Phone, Support URL, and Support Hours from the specified computer.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerOemInformation
Retrieves OEM information from the local computer.
```
> EXAMPLE 2

```PowerShell
Get-ComputerOemInformation -ComputerName "Computer01"
Retrieves OEM information from a remote computer named "Computer01".
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer from which to retrieve the OEM information. If not specified, the local computer name is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-ComputerOemInformation [[-ComputerName] <String>] [<CommonParameters>]
```
