Add-LoggingTarget
-----------------

### Synopsis
Enable a logging target

---

### Description

This function configure and enable a logging target

---

### Related Links
* [https://logging.readthedocs.io/en/latest/functions/Add-LoggingTarget.md](https://logging.readthedocs.io/en/latest/functions/Add-LoggingTarget.md)

* [https://logging.readthedocs.io/en/latest/functions/Write-Log.md](https://logging.readthedocs.io/en/latest/functions/Write-Log.md)

* [https://logging.readthedocs.io/en/latest/AvailableTargets.md](https://logging.readthedocs.io/en/latest/AvailableTargets.md)

* [https://github.com/EsOsO/Logging/blob/master/Logging/public/Add-LoggingTarget.ps1](https://github.com/EsOsO/Logging/blob/master/Logging/public/Add-LoggingTarget.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Add-LoggingTarget -Name Console -Configuration @{Level = 'DEBUG'}
```
> EXAMPLE 2

```PowerShell
Add-LoggingTarget -Name File -Configuration @{Level = 'INFO'; Path = 'C:\Temp\script.log'}
```

---

### Parameters
#### **Configuration**
An hashtable containing the configurations for the target

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |3       |false        |

---

### Syntax
```PowerShell
Add-LoggingTarget [[-Configuration] <Hashtable>] [<CommonParameters>]
```
