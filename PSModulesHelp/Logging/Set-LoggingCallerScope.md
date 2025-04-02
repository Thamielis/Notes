Set-LoggingCallerScope
----------------------

### Synopsis
Sets the scope from which to get the caller scope

---

### Description

This function sets the scope to obtain information from the caller

---

### Related Links
* [https://logging.readthedocs.io/en/latest/functions/Set-LoggingCallerScope.md](https://logging.readthedocs.io/en/latest/functions/Set-LoggingCallerScope.md)

* [https://logging.readthedocs.io/en/latest/functions/Write-Log.md](https://logging.readthedocs.io/en/latest/functions/Write-Log.md)

* [https://github.com/EsOsO/Logging/blob/master/Logging/public/Set-LoggingCallerScope.ps1](https://github.com/EsOsO/Logging/blob/master/Logging/public/Set-LoggingCallerScope.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Set-LoggingCallerScope -CallerScope 2
```
> EXAMPLE 2

```PowerShell
Set-LoggingCallerScope
It sets the caller scope to 1
```

---

### Parameters
#### **CallerScope**
Integer representing the scope to use to find the caller information. Defaults to 1 which represent the scope of the function where Write-Log is being called from

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

---

### Syntax
```PowerShell
Set-LoggingCallerScope [[-CallerScope] <Int32>] [<CommonParameters>]
```
