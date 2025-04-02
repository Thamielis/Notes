Set-DSUserLicense
-----------------

### Synopsis
Set the license assignments

---

### Description

Set the license assignments.
To assign or unassign a user to a license, modify the IsMember field of the desired user.

---

### Related Links
* [Get-DSUserLicense](Get-DSUserLicense)

---

### Examples
> EXAMPLE

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
User assignements to a license obtained from Get-DSUserLicense

|Type                         |Required|Position|PipelineInput |
|-----------------------------|--------|--------|--------------|
|`[PSLicenseAssignmentInfo[]]`|true    |named   |true (ByValue)|

---

### Inputs
RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseAssignmentInfo[]

Modified assignments obtained from Get-DSUserLicense

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Set-DSUserLicense -detailed". For technical information, type "Get-Help Set-DSUserLicense -full".

---

### Syntax
```PowerShell
Set-DSUserLicense -InputObject <PSLicenseAssignmentInfo[]> [-AsLegacyResponse] [<CommonParameters>]
```
