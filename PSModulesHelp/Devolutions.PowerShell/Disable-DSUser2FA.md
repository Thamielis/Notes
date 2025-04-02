Disable-DSUser2FA
-----------------

### Synopsis
Disable 2FA for a user.

---

### Description

Disable 2FA for a user. The server must be configured to allow 2FA enforcement on an individual basis.

---

### Related Links
* [Enable-DSUser2FA](Enable-DSUser2FA)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Disable-DSUser2FA -UserID $userId
2FA disabled for the user identified by $userId.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
For more information, type "Get-Help Disable-DSUser2FA -detailed". For technical information, type "Get-Help Disable-DSUser2FA -full".

---

### Syntax
```PowerShell
Disable-DSUser2FA -UserID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
