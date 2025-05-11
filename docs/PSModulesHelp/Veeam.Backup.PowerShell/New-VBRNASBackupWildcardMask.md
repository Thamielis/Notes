New-VBRNASBackupWildcardMask
----------------------------

### Synopsis
Defines a wildcard mask for file backup job.

---

### Description

This cmdlet creates the VBRNASBackupWildcardMask object. This object defines settings of a wildcard mask for file backup job. You can use this mask to exclude files from file backup job or include them to this job.

---

### Examples
> Defining Wildcard Mask for File Backup Job

```PowerShell
$exclusionMask = New-VBRNASBackupWildcardMask -Wildcard "*.avi"
This command defines the wildcard mask the .avi types of files.
```

---

### Parameters
#### **Wildcard**
Specifies the wildcard value.

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
New-VBRNASBackupWildcardMask -Wildcard <String> [<CommonParameters>]
```
