Set-LoggingCustomTarget
-----------------------

### Synopsis
Sets a folder as custom target repository

---

### Description

This function sets a folder as a custom target repository.
Every *.ps1 file will be loaded as a custom target and available to be enabled for logging to.

---

### Related Links
* [https://logging.readthedocs.io/en/latest/functions/Set-LoggingCustomTarget.md](https://logging.readthedocs.io/en/latest/functions/Set-LoggingCustomTarget.md)

* [https://logging.readthedocs.io/en/latest/functions/CustomTargets.md](https://logging.readthedocs.io/en/latest/functions/CustomTargets.md)

* [https://logging.readthedocs.io/en/latest/functions/Write-Log.md](https://logging.readthedocs.io/en/latest/functions/Write-Log.md)

* [https://github.com/EsOsO/Logging/blob/master/Logging/public/Set-LoggingCustomTarget.ps1](https://github.com/EsOsO/Logging/blob/master/Logging/public/Set-LoggingCustomTarget.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Set-LoggingCustomTarget -Path C:\Logging\CustomTargets
```

---

### Parameters
#### **Path**
A valid path containing *.ps1 files that defines new loggin targets

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Set-LoggingCustomTarget [-Path] <String> [<CommonParameters>]
```
