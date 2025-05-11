New-VBRNASBackupPathMask
------------------------

### Synopsis
Defines an exclusion mask for path for a file backup job.

---

### Description

This cmdlet creates the VBRNASBackupPathMask object. This object defines an exclusion path for mask for a file backup job. You can exclude either a specific folder or the whole file share.

---

### Examples
> Example 1. Defining Exclusion Paths for File Backup Job

$exclusionMask = New-VBRNASBackupPathMask -Path "\\EV-NIMBLE\SMB_Share\New Inc-Exc
This command defines the \EV-NIMBLE\SMB_Share\New Inc-Exc exclusion path.
> Example 2. Defining Exclusion Paths for File Backup Job

```PowerShell
$exclusionMask = New-VBRNASBackupPathMask -Path "New Inc-Exc" -ForAllShares
This command defines that the New Inc-Exc folder will be excluded from all file shares.
```

---

### Parameters
#### **ForAllShares**
Defines that the cmdlet will exclude multiple paths under file shares. Note: You can exclude multiples paths for only for root file shares.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Path**
Specifies a path to the folder that you want to exclude.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRNASBackupPathMask [-ForAllShares] -Path <String> [<CommonParameters>]
```
