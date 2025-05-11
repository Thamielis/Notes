New-VBRUnstructuredBackupArchivalOptions
----------------------------------------

### Synopsis
Defines a scope of file versions to keep on an archive repository for file backup job or object storage backup job.

---

### Description

This cmdlet defines a scope of file versions backed-up by file backup job or object storage backup job to keep on an archive repository. You can include all files, define certain files to keep on archive repository or exclude certain files from the repository.

---

### Examples
> Example 1. Defining Scope of Files to Keep on Archive Repository

```PowerShell
New-VBRUnstructuredBackupArchivalOptions -ArchivalType InclusionMask -InclusionMask ('*.pdf', '*.docx')
This command defines a scope of file versions to keep on archive repositories. The archive repository will keep only file versions with PDF and DOCX extensions.
```
> Example  2. Excluding Files from Backup Scope

```PowerShell
New-VBRUnstructuredBackupArchivalOptions -ArchivalType ExclusionMask -ExclusionMask '*.exe'
This command excludes a scope of file versions. The archive repository will not keep .EXE file extensions.
```

---

### Parameters
#### **ArchivalType**
Specifies the filter settings for file versions that you want to keep on the archive repository. You can specify one of the following filter settings:
* All: use this option if you want to keep all types of file versions on the archive repository.
* InclusionMask: use this option if you want to keep only file versions with specific extensions on the archive repository. Use the InclusionMask parameter to specify these extensions.
* ExclusionMask: use this option if you do not want to keep file versions with specific extensions on the archive repository.
Use the ExclusionMask parameter to specify these extensions.
Valid Values:

* All
* InclusionMask
* ExclusionMask

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupArchivalType]`|false   |named   |False        |

#### **ExclusionMask**
For the ArchivalType parameter with the ExclusionMask value.
Specifies a file mask for files and folders that you do not want to add to the file backup job or object storage backup job.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **InclusionMask**
For the ArchivalType parameter with the InclusionMask value.
Specifies a file mask for files and folders that you want to add to the file backup job or object storage backup job. The cmdlet will back up only these files and folders.

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
New-VBRUnstructuredBackupArchivalOptions [-ArchivalType {All | InclusionMask | ExclusionMask}] [-ExclusionMask <String[]>] [-InclusionMask <String[]>] [<CommonParameters>]
```
