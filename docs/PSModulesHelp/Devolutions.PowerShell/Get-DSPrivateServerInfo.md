Get-DSPrivateServerInfo
-----------------------

### Synopsis
Obtain the private server information.

---

### Description

Obtain the private server information at the specified URL. Must be connected to the server via New-DSSession.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> New-DSSession -BaseURI 'Your/DVLS/Instance/URL' -WindowsAuthentication;
    $privateInfo = Get-DSPrivateServerInfo;
    $privateInfo.Data
Obtain the private server information of the dvls instance located at 'Your/DVLS/Instance/URL'.
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
* Devolutions.RemoteDesktopManager.Business.Entities.PrivateWebInstanceInfo

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.PrivateWebInstanceInfo, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSPrivateServerInfo -detailed". For technical information, type "Get-Help Get-DSPrivateServerInfo -full".

---

### Syntax
```PowerShell
Get-DSPrivateServerInfo [-AsLegacyResponse] [<CommonParameters>]
```
