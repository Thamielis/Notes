Unregister-DSLicense
--------------------

### Synopsis
Unregister a license

---

### Description

Unregister a license. The server license cannot be unregistered.

---

### Related Links
* [Get-DSLicense](Get-DSLicense)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $licResponse = Get-DSLicence;
        $licRespones | Where -Property Status -eq Expired | Unregister-DSLicense
Remove all expired licenses
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InputObject**
License to delete obtained from Get-DSLicense

|Type             |Required|Position|PipelineInput |
|-----------------|--------|--------|--------------|
|`[PSLicenseInfo]`|true    |named   |true (ByValue)|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Unregister-DSLicense -detailed". For technical information, type "Get-Help Unregister-DSLicense -full".

---

### Syntax
```PowerShell
Unregister-DSLicense -InputObject <PSLicenseInfo> [-AsLegacyResponse] [<CommonParameters>]
```
