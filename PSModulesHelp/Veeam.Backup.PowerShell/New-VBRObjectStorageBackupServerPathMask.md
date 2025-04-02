New-VBRObjectStorageBackupServerPathMask
----------------------------------------

### Synopsis
Defines an exclusion mask for prefixes in object storage.

---

### Description

This cmdlet creates the VBRObjectStorageBackupServerPathMask object. This object defines an exclusion mask for prefixes in object storage.

---

### Examples
> Defining Exclusion Mask for Prefixes Within Object Storage

```PowerShell
$ExclusionMask = New-VBRObjectStorageBackupServerPathMask -Path "files/New Inc-Exc"
This command defines that prefixes that start with files/New Inc-Exc will be excluded from object storage backups.
```

---

### Parameters
#### **Path**
This object defines an exclusion mask for prefixes in object storage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRObjectStorageBackupServerPathMask -Path <String> [<CommonParameters>]
```
