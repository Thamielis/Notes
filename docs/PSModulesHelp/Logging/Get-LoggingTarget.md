Get-LoggingTarget
-----------------

### Synopsis
Returns enabled logging targets

---

### Description

This function returns enabled logging targtes

---

### Related Links
* [https://logging.readthedocs.io/en/latest/functions/Get-LoggingTarget.md](https://logging.readthedocs.io/en/latest/functions/Get-LoggingTarget.md)

* [https://logging.readthedocs.io/en/latest/functions/Write-Log.md](https://logging.readthedocs.io/en/latest/functions/Write-Log.md)

* [https://github.com/EsOsO/Logging/blob/master/Logging/public/Get-LoggingTarget.ps1](https://github.com/EsOsO/Logging/blob/master/Logging/public/Get-LoggingTarget.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-LoggingTarget
```
> EXAMPLE 2

```PowerShell
Get-LoggingTarget -Name Console
```

---

### Parameters
#### **Name**
The Name of the target to retrieve, if not passed all configured targets will be returned

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-LoggingTarget [[-Name] <String>] [<CommonParameters>]
```
