Find-CSExtension
----------------

### Synopsis
This function retrieves Group Policy Client Side Extensions (CSEs) from a specified Windows computer.

---

### Description

The Find-CSExtension function lists Group Policy Client Side Extensions (CSEs) configured on a Windows computer. It queries the Windows Registry to retrieve information about the CSEs.

---

### Examples
> EXAMPLE 1

```PowerShell
Find-CSExtension -ComputerName "Computer01"
Retrieves all CSEs configured on the computer named "Computer01".
```
> EXAMPLE 2

```PowerShell
Find-CSExtension -CSE "CSE1", "CSE2" -ComputerName "Computer02"
Retrieves information about CSEs named "CSE1" and "CSE2" on the computer named "Computer02".
```

---

### Parameters
#### **CSE**
Specifies an array of CSE names to filter the results. If not provided, all CSEs will be listed.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **ComputerName**
Specifies the name of the computer from which to retrieve the CSE information.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Find-CSExtension [[-CSE] <String[]>] [[-ComputerName] <String>] [<CommonParameters>]
```
