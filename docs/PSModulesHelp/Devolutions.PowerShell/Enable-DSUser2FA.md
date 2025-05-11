Enable-DSUser2FA
----------------

### Synopsis
Enable a predefined 2FA authentication for a user.

---

### Description

Enable a predefined 2FA authentication for a user. The server must be configured to allow 2FA enforcement on an individual basis.

---

### Related Links
* [Disable-DSUser2FA](Disable-DSUser2FA)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Enable-DSUser2FA -UserID $userId -TwoFactorAuthenticationType GoogleAuthenticator
Set an Authenticator (TOTP) for the user identified by $userId. The user will complete the set up on the next login.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TwoFactorAuthenticationType**
2FA type
Valid Values:

* None
* GoogleAuthenticator
* Yubikey
* Email
* Sms
* Duo
* SafeNet
* AuthAnvil
* AzureMFA
* Radius
* VascoSoap

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[TwoFactorAuthenticationType]`|true    |named   |false        |

#### **UserID**
User's ID

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Enable-DSUser2FA -detailed". For technical information, type "Get-Help Enable-DSUser2FA -full".

---

### Syntax
```PowerShell
Enable-DSUser2FA -UserID <Guid> -TwoFactorAuthenticationType <GoogleAuthenticator | Yubikey | Email | Sms | Duo | AzureMFA | Radius> [-AsLegacyResponse] [<CommonParameters>]
```
