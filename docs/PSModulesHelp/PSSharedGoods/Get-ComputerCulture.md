Get-ComputerCulture
-------------------

### Synopsis
Retrieves culture information from a specified computer.

---

### Description

This function retrieves culture information from the specified computer. It provides details such as KeyboardLayoutId, DisplayName, and Windows Language.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerCulture
Retrieves culture information from the local computer.
```
> EXAMPLE 2

```PowerShell
Get-ComputerCulture -ComputerName "Server01"
Retrieves culture information from a remote computer named Server01.
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer from which to retrieve culture information. Defaults to the local computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-ComputerCulture [[-ComputerName] <String>] [<CommonParameters>]
```
