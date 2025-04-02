Get-DSSecureMessages
--------------------

### Synopsis
Fetch all secure messages for the currently authenticated user.

---

### Description

It fetch messages for the user you logged in with (New-DSSession). For other users, you need to re-authenticate and type the command again.

---

### Examples
> EXAMPLE

```PowerShell
Get-DSSecureMessages
Fetch all the secure message for the authentififed user.
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
* Devolutions.Server.Models.Shared.Models.SecureMessage.SecureMessage[]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Models.Shared.Models.SecureMessage.SecureMessage, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSSecureMessages -detailed". For technical information, type "Get-Help Get-DSSecureMessages -full".

---

### Syntax
```PowerShell
Get-DSSecureMessages [-AsLegacyResponse] [<CommonParameters>]
```
