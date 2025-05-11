Set-LoggingDefaultLevel
-----------------------

### Synopsis
Sets a global logging severity level.

---

### Description

This function sets a global logging severity level.
Log messages written with a lower logging level will be discarded.

---

### Related Links
* [https://logging.readthedocs.io/en/latest/functions/Set-LoggingDefaultLevel.md](https://logging.readthedocs.io/en/latest/functions/Set-LoggingDefaultLevel.md)

* [https://logging.readthedocs.io/en/latest/functions/Write-Log.md](https://logging.readthedocs.io/en/latest/functions/Write-Log.md)

* [https://github.com/EsOsO/Logging/blob/master/Logging/public/Set-LoggingDefaultLevel.ps1](https://github.com/EsOsO/Logging/blob/master/Logging/public/Set-LoggingDefaultLevel.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Set-LoggingDefaultLevel -Level ERROR
PS C:\> Write-Log -Level INFO -Message "Test"
=> Discarded.
```

---

### Syntax
```PowerShell
Set-LoggingDefaultLevel [<CommonParameters>]
```
