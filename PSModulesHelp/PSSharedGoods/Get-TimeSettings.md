Get-TimeSettings
----------------

### Synopsis
Retrieves and displays time synchronization settings for the specified computer(s).

---

### Description

The Get-TimeSettings function retrieves and displays time synchronization settings for the specified computer(s). It provides information on the type of time synchronization mechanism being used, NTP server flags, cross-site synchronization flags, and announce flags.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-TimeSettings -ComputerName 'Server01'
Retrieves time synchronization settings for a single computer named 'Server01'.
```
> EXAMPLE 2

```PowerShell
Get-TimeSettings -ComputerName 'Server01','Server02' -Formatted -Splitter ','
Retrieves time synchronization settings for multiple computers named 'Server01' and 'Server02' in a formatted output separated by commas.
```

---

### Parameters
#### **ComputerName**
Specifies the computer(s) for which time synchronization settings are to be retrieved. If not specified, the local computer name is used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Formatted**
Switch parameter to format the output in a structured manner.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Splitter**
Specifies the character used to split the output if Formatted parameter is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-TimeSettings [[-ComputerName] <String[]>] [-Formatted] [[-Splitter] <String>] [<CommonParameters>]
```
