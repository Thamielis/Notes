Get-DSAuthenticationModes
-------------------------

### Synopsis
Get the authentication modes allowed by the server.

---

### Description

Get the authentication modes allowed by the server. The possibilities of authentication are AzureAD, Otka, Custom (Devolutions Server), Domain and Windows Authentication

---

### Related Links
* [Set-DSAuthenticationModes](Set-DSAuthenticationModes)

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
* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSAuthenticationModes -detailed". For technical information, type "Get-Help Get-DSAuthenticationModes -full".

---

### Syntax
```PowerShell
Get-DSAuthenticationModes [-AsLegacyResponse] [<CommonParameters>]
```
