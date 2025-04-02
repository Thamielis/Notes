Get-ApiKeyHttpClient
--------------------

### Synopsis
Gets instance of ApiKeyHttpClient

---

### Description

Gets instance of ApiKeyHttpClient that is then used by Add-SinkHttp cmdlet.

---

### Examples
> EXAMPLE 1

```PowerShell
PS> New-Logger | Add-SinkHttp -RequestUri 'https://requestbin.net/r/6y06j5z8' -HttpClient (Get-ApiKeyHttpClient -ApiKey '...') | Start-Logger
```

---

### Parameters
#### **ApiKey**

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[System.String]`|false   |named   |false        |

---

### Outputs
* PoShLog.Sinks.Http.HttpClients.ApiKeyHttpClient

---

### Syntax
```PowerShell
Get-ApiKeyHttpClient [-ApiKey <string>] [<CommonParameters>]
```
