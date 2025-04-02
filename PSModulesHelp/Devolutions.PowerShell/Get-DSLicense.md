Get-DSLicense
-------------

### Synopsis
Get all licenses, except the server one

---

### Description

Get all licenses, except the server one.
To obtain the users who have been assigned to a specific license, use the cmdlet Get-DSUserLicense.

---

### Related Links
* [Get-DSUserLicense](Get-DSUserLicense)

* [Set-DSUserLicense](Set-DSUserLicense)

* [Unregister-DSLicense](Unregister-DSLicense)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $licenses = Get-DSLicence
Obtain all licenses, except the server one
```
> EXAMPLE 2

```PowerShell
PS C:\> $licResponse = Get-DSLicence -AsLegacyResponse;
        $licRespones.Data | Where -Property Status -eq Expired | Unregister-DSLicense
Remove all expired licenses
```
> EXAMPLE 3

```PowerShell
PS C:\> $licResponse = Get-DSLicence;
        $license = $licRespones.Data | Where -Property License -like XXXXX* | Select -First 1
        $assignResponse = Get-DSUserLicense -InputObject $license
        $assignments = $assignResponse.Data
        $aUserAssignment = $asssignments | Where Name -eq 'Name of the user to assign'
        $aUserAssignment.IsMember = $true
        Set-DSUserLicense -InputObject $aUserAssignment
Assign the license starting with XXXXX to the user 'Name of the user to assign'
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
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo[]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo, Devolutions.PowerShell, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSLicense -detailed". For technical information, type "Get-Help Get-DSLicense -full".

---

### Syntax
```PowerShell
Get-DSLicense [-AsLegacyResponse] [<CommonParameters>]
```
