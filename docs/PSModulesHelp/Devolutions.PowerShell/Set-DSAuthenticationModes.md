Set-DSAuthenticationModes
-------------------------

### Synopsis
Modify the authentification modes allowed.

---

### Description

Modify the authentification modes allowed. AzureAD, Custom (Devolutions Server) and Domain authentications can be modified.

---

### Related Links
* [Set-DSAuthenticationModes](Set-DSAuthenticationModes)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Set-DSAuthenticationModes -AzureADAuthenticationEnabled $true
Allow AzureAD authentication on the dlvs server.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AzureADAuthenticationEnabled**
Allow or not AzureAD authentication method.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CustomAuthenticationEnabled**
Allow or not Custom (Devolutions Server) authentication method.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **DomainAuthenticationEnabled**
Allow or not Domain authentication method.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Set-DSAuthenticationModes -detailed". For technical information, type "Get-Help Set-DSAuthenticationModes -full".

---

### Syntax
```PowerShell
Set-DSAuthenticationModes [-AzureADAuthenticationEnabled <Boolean>] [-CustomAuthenticationEnabled <Boolean>] [-DomainAuthenticationEnabled <Boolean>] [-AsLegacyResponse] [<CommonParameters>]
```
