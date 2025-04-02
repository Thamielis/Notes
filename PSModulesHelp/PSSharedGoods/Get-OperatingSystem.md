Get-OperatingSystem
-------------------

### Synopsis
Retrieves information about Windows operating systems.

---

### Description

This function returns details about various versions of Windows operating systems, including their names, version numbers, code names, marketing names, build numbers, release dates, and support end dates.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OperatingSystem -Version '10.0 (19042)'
Retrieves information about Windows 10 20H2.
```
> EXAMPLE 2

```PowerShell
Get-OperatingSystem
Retrieves information about all available Windows operating systems.
```

---

### Parameters
#### **Version**
Specifies the version number of the Windows operating system to retrieve information for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-OperatingSystem [[-Version] <String>] [<CommonParameters>]
```
