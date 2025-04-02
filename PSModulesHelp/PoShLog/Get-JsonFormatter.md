Get-JsonFormatter
-----------------

### Synopsis
Returns new instance of Serilog.Formatting.Json.JsonFormatter.

---

### Description

Returns new instance of Serilog.Formatting.Json.JsonFormatter that can be used with File sink.

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-SinkFile -Path 'C:\Data\Log\test.log' -Formatter (Get-JsonFormatter) | Start-Logger
```

---

### Inputs
None

---

### Outputs
* Instance of Serilog.Formatting.Json.JsonFormatter

---

### Syntax
```PowerShell
Get-JsonFormatter [<CommonParameters>]
```
