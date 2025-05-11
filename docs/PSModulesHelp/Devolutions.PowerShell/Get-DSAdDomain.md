Get-DSAdDomain
--------------

### Synopsis
Get domains of the server.

---

### Description

Get domains of the server. The Platinum Edition license is required to enable the Multi Domain feature.

---

### Parameters
#### **All**
Ignored parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSAdDomain -detailed". For technical information, type "Get-Help Get-DSAdDomain -full".

---

### Syntax
```PowerShell
Get-DSAdDomain [-All] [-AsLegacyResponse] [<CommonParameters>]
```
