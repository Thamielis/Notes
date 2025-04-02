Add-LoggingLevel
----------------

### Synopsis
Define a new severity level

---

### Description

This function add a new severity level to the ones already defined

---

### Related Links
* [https://logging.readthedocs.io/en/latest/functions/Add-LoggingLevel.md](https://logging.readthedocs.io/en/latest/functions/Add-LoggingLevel.md)

* [https://logging.readthedocs.io/en/latest/functions/Write-Log.md](https://logging.readthedocs.io/en/latest/functions/Write-Log.md)

* [https://github.com/EsOsO/Logging/blob/master/Logging/public/Add-LoggingLevel.ps1](https://github.com/EsOsO/Logging/blob/master/Logging/public/Add-LoggingLevel.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Add-LoggingLevel -Level 41 -LevelName CRITICAL
```
> EXAMPLE 2

```PowerShell
Add-LoggingLevel -Level 15 -LevelName VERBOSE
```

---

### Parameters
#### **Level**
An integer that identify the severity of the level, higher the value higher the severity of the level
By default the module defines this levels:
NOTSET   0
DEBUG   10
INFO    20
WARNING 30
ERROR   40

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |1       |false        |

#### **LevelName**
The human redable name to assign to the level

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Syntax
```PowerShell
Add-LoggingLevel [-Level] <Int32> [-LevelName] <String> [<CommonParameters>]
```
