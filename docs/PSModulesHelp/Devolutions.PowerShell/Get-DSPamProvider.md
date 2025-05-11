Get-DSPamProvider
-----------------

### Synopsis
Get all PAM providers.

---

### Description

Get all PAM providers.

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
* Devolutions.Server.Pam.Dto.PamProvider[]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Pam.Dto.PamProvider, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSPamProvider -detailed". For technical information, type "Get-Help Get-DSPamProvider -full".

---

### Syntax
```PowerShell
Get-DSPamProvider [-AsLegacyResponse] [<CommonParameters>]
```
