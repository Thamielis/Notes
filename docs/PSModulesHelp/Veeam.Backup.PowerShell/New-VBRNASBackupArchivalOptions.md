New-VBRNASBackupArchivalOptions
-------------------------------

### Synopsis
Defines long-term retention policy for file versions of backed up files from file shares.

---

### Description

This cmdlet defines retention policy for file versions that are kept on the long-term repository.

---

### Examples
> Example 1. Defining Retention Policy for Active File Versions with Filter Settings

```PowerShell
New-VBRNASBackupArchivalOptions -ArchivalType InclusionMask -InclusionMask "*.pdf","*.docx"
This command shows how to define retention policy for active file versions.  The long-term repository will keep only .PDF and .DOCX file extensions.
```
> Example 2. Defining Retention Policy for Deleted File Versions with Filter Settings

```PowerShell
New-VBRNASBackupArchivalOptions -ArchivalType ExclusionMask -ExclusionMask "*.exe"
This command shows how to define retention policy for deleted file versions. The long-term repository will not keep .EXE file extensions.
```

---

### Parameters
#### **ArchivalType**
Specifies the filter settings for file versions that must be kept on the long-term repository. You can specify either of the following filter settings:
* All: use this option if you want to keep all types of file versions on the long-term repository.
* InclusionMask: use this option if you want to keep only file versions with specific extensions on the long-term repository. Use the InclusionMask parameter to specify these extensions.
* ExclusionMask: use this option if you do not want to keep file versions with specific extensions on the long-term repository. Use the ExclusionMask parameter to specify these extensions.
Valid Values:

* All
* InclusionMask
* ExclusionMask

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRNASBackupArchivalType]`|false   |named   |False        |

#### **ExclusionMask**
For the ArchivalType parameter with the ExclusionMask value. Specifies a file mask for files and folders that you do not want to add to the file backup job.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **InclusionMask**
For the ArchivalType parameter with the InclusionMask value. Specifies a file mask for files and folders that you want to add to the file backup job. The cmdlet will back up only these files and folders.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
New-VBRNASBackupArchivalOptions [-ArchivalType {All | InclusionMask | ExclusionMask}] [-ExclusionMask <String[]>] [-InclusionMask <String[]>] [<CommonParameters>]
```
