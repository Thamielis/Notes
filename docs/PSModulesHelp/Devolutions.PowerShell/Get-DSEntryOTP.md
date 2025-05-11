Get-DSEntryOTP
--------------

### Synopsis
Get a PSObject containing the OTP code with the remaining time of an OTP entry and the corresponding end time (UTC)

---

### Description

Get a PSObject containing the OTP code with the remaining time of an OTP entry and the corresponding end time (UTC). The entry must be specified by its ID.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $response = Get-DSEntryOTP -EntryID '12345678-1234-1234-1234-123456789ABC'
        $otpCode = $response.code
Get the OTP code of the entry whose ID is '12345678-1234-1234-1234-123456789ABC'
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EntryID**
ID of the entry for which you want to retrieve the OTP

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSEntryOTP -detailed". For technical information, type "Get-Help Get-DSEntryOTP -full".

---

### Syntax
```PowerShell
Get-DSEntryOTP -EntryID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
