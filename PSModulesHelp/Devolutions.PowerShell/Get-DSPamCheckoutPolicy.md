Get-DSPamCheckoutPolicy
-----------------------

### Synopsis
Return checkout policies

---

### Description

If a policy ID is supplied, it will try to fetch and return the policy matching the ID. If no ID is supplied, it will return a list of all policies in place.

---

### Related Links
* [New-DSPamCheckoutPolicy](New-DSPamCheckoutPolicy)

* [Remove-DSPamCheckoutPolicy](Remove-DSPamCheckoutPolicy)

* [Update-DSPamCheckoutPolicy](Update-DSPamCheckoutPolicy)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $response = Get-DSPamCheckoutPolicy
Return all checkout policies currently in place.
```
> EXAMPLE 2

```PowerShell
PS C:\> $response = Get-DSPamCheckoutPolicy $PolicyID
Return the checkout policy, if found.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PolicyID**
ID of the policy to get

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.PamCheckoutPolicy[]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCheckoutPolicy, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCheckoutPolicy, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSPamCheckoutPolicy -detailed". For technical information, type "Get-Help Get-DSPamCheckoutPolicy -full".

---

### Syntax
```PowerShell
Get-DSPamCheckoutPolicy [-PolicyID <Guid>] [-AsLegacyResponse] [<CommonParameters>]
```
