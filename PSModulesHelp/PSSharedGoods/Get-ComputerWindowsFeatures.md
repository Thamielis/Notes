Get-ComputerWindowsFeatures
---------------------------

### Synopsis
Get Windows Features status on one or more computers/servers

---

### Description

Get Windows Features status on one or more computers/servers

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerWindowsFeatures -EnabledOnly | Format-Table
```

---

### Parameters
#### **ComputerName**
ComputerName to provide when executing query remotly. By default current computer name is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Protocol**
Protocol to use when gathering data. Choices are Default, Dcom, WSMan
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **EnabledOnly**
Returns only data if Windows Feature is enabled

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **All**
Gets all properties without any preprocessing

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-ComputerWindowsFeatures [[-ComputerName] <String>] [[-Protocol] <String>] [-EnabledOnly] [-All] [<CommonParameters>]
```
