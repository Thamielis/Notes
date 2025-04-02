Get-DSIsLogged
--------------

### Synopsis
Verify if the session is etablished.

---

### Description

Verify if the session is etablished by a previous call to New-DSSession.

---

### Related Links
* [Close-DSSession](Close-DSSession)

* [New-DSSession](New-DSSession)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-DSIsLogged
Verify if the session is still established.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Boolean, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]

---

### Notes
For more information, type "Get-Help Get-DSIsLogged -detailed". For technical information, type "Get-Help Get-DSIsLogged -full".

---

### Syntax
```PowerShell
Get-DSIsLogged [-AsLegacyResponse] [<CommonParameters>]
```
