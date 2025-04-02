Get-ComputerMissingDrivers
--------------------------

### Synopsis
Retrieves information about missing drivers on a specified computer.

---

### Description

This function retrieves information about missing drivers on a specified computer by querying the Win32_PNPEntity WMI class.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerMissingDrivers -ComputerName "Computer01"
Retrieves information about missing drivers on a computer named "Computer01".
```
> EXAMPLE 2

```PowerShell
Get-ComputerMissingDrivers
Retrieves information about missing drivers on the local computer.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer to query. Defaults to the local computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-ComputerMissingDrivers [[-ComputerName] <String>] [<CommonParameters>]
```
