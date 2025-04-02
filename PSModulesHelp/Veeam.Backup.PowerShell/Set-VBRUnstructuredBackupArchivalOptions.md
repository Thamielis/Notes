Set-VBRUnstructuredBackupArchivalOptions
----------------------------------------

### Synopsis
Modifies a scope of file versions to keep on an archive repository for file backup job or object storage backup job.

---

### Description

This cmdlet modifies settings of a scope of file versions to keep on an archive repository for file backup job or object storage backup job.
NOTE: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRUnstructuredBackupArchivalOptions](New-VBRUnstructuredBackupArchivalOptions)

---

### Examples
> Example 1. Modifying Scope of File Versions

$archiveoptions = New-VBRUnstructuredBackupArchivalOptions -ArchivalType ExclusionMask -ExclusionMask ('*.jpeg', '*.exe')           
Set-VBRUnstructuredBackupArchivalOptions -Options $archiveoptions -ArchivalType InclusionMask -InclusionMask ('*.docx', '*.pdf')
This example shows how to modify a scope of file versions that are located on an archive repository. The archive repository will have the following file version settings:
- The long-term repository will keep .DOCX and .PDF file extensions.
- The long-term repository will not keep .EXE and .JPEG  file extensions.
Perform the following steps:
1. Run the New-VBRUnstructuredBackupArchivalOptions cmdlet. Specify the ArchivalType and ExclusionMask parameters values. Save the result to the $archiveoptions variable.
2. Run the Set-VBRUnstructuredBackupArchivalOptions cmdlet. Specify the following settings:
- Set the $archiveoptions variable as the Options parameter value.
- Set the InclusionMask as the ArchivalType parameter value.
- Specify the InclusionMask parameter value.

---

### Parameters
#### **ArchivalType**
Specifies the filter settings for file versions that you want to keep on the archive repository. You can specify one of the following filter settings:
* All: use this option if you want to keep all types of file versions on the archive repository.
* InclusionMask: use this option if you want to keep only file versions with specific extensions on the archive repository. Use the InclusionMask parameter to specify these extensions.
* ExclusionMask: use this option if you do not want to keep file versions with specific extensions on the archive repository. Use the ExclusionMask parameter to specify these extensions.
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

#### **Options**
Specifies the scope of file versions. The cmdlet will modify this scope. Accepts the VBRUnstructuredBackupArchivalOptions object.  To create this object, run the New-VBRUnstructuredBackupArchivalOptions cmdlet.

|Type                                    |Required|Position|PipelineInput                 |
|----------------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupArchivalOptions]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupArchivalOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRUnstructuredBackupArchivalOptions [-ArchivalType {All | InclusionMask | ExclusionMask}] [-ExclusionMask <String[]>] [-InclusionMask <String[]>] -Options <VBRUnstructuredBackupArchivalOptions> 
```
```PowerShell
[<CommonParameters>]
```
