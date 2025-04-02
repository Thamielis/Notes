Get-DSUserLicense
-----------------

### Synopsis
Get all the assignments of a specific license

---

### Description

Get all the assignments of a specific license.
To assign a license, modify the IsMember field of the desired user. Once the modifications are done, use the Set-DSUserLicense cmdlet.

---

### Related Links
* [Get-DSLicense](Get-DSLicense)

* [Set-DSUserLicense](Set-DSUserLicense)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $assignResponse = Get-DSUserLicense -Serial XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
        $assignments = $assignResponse.Data
        $asssignments | Where -Property IsMember -eq $true | Select Name, UserId
Obtain all the users who have been assigned the license 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX'
```
> EXAMPLE 2

```PowerShell
PS C:\> $AsLegacyResponse = $true
        $licResponse = Get-DSLicence;
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

#### **InputObject**
User license assignments of this specific serial

|Type             |Required|Position|PipelineInput |
|-----------------|--------|--------|--------------|
|`[PSLicenseInfo]`|true    |named   |true (ByValue)|

#### **Serial**
User license assignments of this specific serial

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo

License object obtained from the data field of the Get-DSLicense response

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseAssignmentInfo[]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseAssignmentInfo, Devolutions.PowerShell, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSUserLicense -detailed". For technical information, type "Get-Help Get-DSUserLicense -full".

---

### Syntax
```PowerShell
Get-DSUserLicense -InputObject <PSLicenseInfo> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSUserLicense -Serial <String> [-AsLegacyResponse] [<CommonParameters>]
```
