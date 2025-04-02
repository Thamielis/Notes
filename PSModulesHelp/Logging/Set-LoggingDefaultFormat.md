Set-LoggingDefaultFormat
------------------------

### Synopsis
Sets a global logging message format

---

### Description

This function sets a global logging message format

---

### Related Links
* [https://logging.readthedocs.io/en/latest/functions/Set-LoggingDefaultFormat.md](https://logging.readthedocs.io/en/latest/functions/Set-LoggingDefaultFormat.md)

* [https://logging.readthedocs.io/en/latest/functions/LoggingFormat.md](https://logging.readthedocs.io/en/latest/functions/LoggingFormat.md)

* [https://logging.readthedocs.io/en/latest/functions/Write-Log.md](https://logging.readthedocs.io/en/latest/functions/Write-Log.md)

* [https://github.com/EsOsO/Logging/blob/master/Logging/public/Set-LoggingDefaultFormat.ps1](https://github.com/EsOsO/Logging/blob/master/Logging/public/Set-LoggingDefaultFormat.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Set-LoggingDefaultFormat -Format '[%{level:-7}] %{message}'
```
> EXAMPLE 2

```PowerShell
Set-LoggingDefaultFormat
It sets the default format as [%{timestamp:+%Y-%m-%d %T%Z}] [%{level:-7}] %{message}
```

---

### Parameters
#### **Format**
The string used to format the message to log

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Set-LoggingDefaultFormat [[-Format] <String>] [<CommonParameters>]
```
