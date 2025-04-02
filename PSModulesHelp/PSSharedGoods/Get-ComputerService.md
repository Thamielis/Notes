Get-ComputerService
-------------------

### Synopsis
Retrieves information about services running on specified computers.

---

### Description

This function retrieves information about services running on one or more specified computers. It returns details such as ComputerName, Name, Displayname, Status, and StartType of the services.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerServices -ComputerName "Computer01"
Retrieves information about services running on a single computer named "Computer01".
```
> EXAMPLE 2

```PowerShell
Get-ComputerServices -ComputerName "Computer01", "Computer02"
Retrieves information about services running on multiple computers named "Computer01" and "Computer02".
```

---

### Parameters
#### **ComputerName**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-ComputerService [[-ComputerName] <String[]>] [<CommonParameters>]
```
