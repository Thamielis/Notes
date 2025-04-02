Set-VBRNASBackupJobObject
-------------------------

### Synopsis
Modifies settings of files and folders that will be added to the file backup job.

---

### Description

This cmdlet modifies settings of files and folders that will be added to the file backup job.

To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [New-VBRNASBackupJobObject](New-VBRNASBackupJobObject)

---

### Examples
> Example 1. Modifying Included Files

$server = Get-VBRUnstructuredServer -Name "\\WinSRV2049\Documents"
$files = New-VBRNASBackupJobObject -Server $server -Path "\\WinSRV2049\Documents\January" -InclusionMask *.docx
Set-VBRNASBackupJobObject -JobObject $files -InclusionMask "*.docx, *.pdf"
This example shows how to modify settings of a file mask for files that you want to add to the file backup job. The job will back up only .DOCX and .PDF files that are located in the \\WinSRV2049\Documents\January folder.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the New-VBRNASBackupJobObject cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
- Specify the InclusionMask parameter value.
- Save the result to the $files variable.
3. Run the Set-VBRNASBackupJobObject cmdlet. Set the $files as the JobObject parameter. Specify the InclusionMask parameter value.
> Example 2. Modifying Excluded Files

$server = Get-VBRUnstructuredServer -Name "\\WinSRV2049\Documents"
$files = New-VBRNASBackupJobObject -Server $server -Path "\\WinSRV2049\Documents\January" -ExclusionMask *.exe
Set-VBRNASBackupJobObject -JobObject $files -ExclusionMask "*.exe""
This example shows how to modify settings of file mask for files that you want to exclude from the file backup job. The job will not back up .EXE files that are located in the \\WinSRV2049\Documents\January folder.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the New-VBRNASBackupJobObject cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
- Specify the ExclusionMask parameter value.
- Save the result to the $files variable.
3. Run the Set-VBRNASBackupJobObject cmdlet. Set the $files as the JobObject parameter. Specify the ExclusionMask parameter value.

---

### Parameters
#### **ExclusionMask**
Specifies a file mask for folders and files that you do not want to add to the file backup job. The cmdlet will not back up these folders and files.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRNASBackupMask[]]`|false   |named   |False        |

#### **InclusionMask**
Specifies a file mask for folders and files that you want to add to the file backup job. The cmdlet will back up only folders and files specified in this file mask.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRNASBackupMask[]]`|false   |named   |False        |

#### **JobObject**
Specifies the settings of files and folders that will be added to the file backup job. The cmdlet will modify these settings. Accepts the VBRNASBackupJobObject object. To create this object, run the New-VBRNASBackupJobObject cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRNASBackupObject]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupObject

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASBackupJobObject [-ExclusionMask <VBRNASBackupMask[]>] [-InclusionMask <VBRNASBackupMask[]>] -JobObject <VBRNASBackupObject> [<CommonParameters>]
```
