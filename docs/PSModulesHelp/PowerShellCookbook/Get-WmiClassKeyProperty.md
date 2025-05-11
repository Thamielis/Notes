Get-WmiClassKeyProperty
-----------------------

### Synopsis
Get all of the properties that you may use in a WMI filter for a given class.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-WmiClassKeyProperty Win32_Process
Handle
```

---

### Parameters
#### **WmiClass**
The WMI class to examine

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ManagementClass]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-WmiClassKeyProperty [[-WmiClass] <ManagementClass>] [<CommonParameters>]
```
