Get-DSPublicServerInfo
----------------------

### Synopsis
Obtain the public server information.

---

### Description

Obtain the public server information at the specified URL.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-DSPublicServerInfo -URL https://here.is.myapp/dvls
Obtain the public server information of the dvls instance located at "https://here.is.myapp/dvls".
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **URL**
URL of the server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.Entities.PublicWebInstanceInfo

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.PublicWebInstanceInfo, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSPublicServerInfo -detailed". For technical information, type "Get-Help Get-DSPublicServerInfo -full".

---

### Syntax
```PowerShell
Get-DSPublicServerInfo -URL <String> [-AsLegacyResponse] [<CommonParameters>]
```
