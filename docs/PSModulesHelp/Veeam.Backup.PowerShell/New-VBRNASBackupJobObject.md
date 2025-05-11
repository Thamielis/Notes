New-VBRNASBackupJobObject
-------------------------

### Synopsis
Defines settings of files and folders and enterprise NAS system that will be added to the file backup job.

---

### Description

This cmdlet creates the VBRNASBackupJobObject object. This object contains settings of files and folders and enterprise NAS system that will be added to the file backup job.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

---

### Examples
> Example 1. Defining Folders to Add to File Backup Job

$server = Sync-VBRUnstructuredBackupState -Name "\\WinSRV2049\Documents"
New-VBRNASBackupJobObject -Server $server -Path "//WinSRV2049/Documents/January"
This example shows how to define folders that you want to add to the file backup job. The job will back up all files that are located in the \WinSRV2049\Documents\January folder.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the New-VBRNASBackupJobObject cmdlet. Set the $server variable as the Server parameter value. Specify the Path parameter value.
> Example 2. Defining Included Files to Add to File Backup Job

$server = Sync-VBRUnstructuredBackupState -Name "\\WinSRV2049\Documents"
New-VBRNASBackupJobObject -Server $server -Path "//WinSRV2049/Documents/January" -InclusionMask *.docx
This example shows how to define a mask for files that you want to add to the file backup job. The job will back up only .DOCX files that are located in the \WinSRV2049\Documents\January folder.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the New-VBRNASBackupJobObject cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
- Specify the InclusionMask parameter value.
> Example 3. Defining Excluded Files to Add to File Backup Job

$server = Sync-VBRUnstructuredBackupState -Name "\\WinSRV2049\Documents"
New-VBRNASBackupJobObject -Server $server -Path "//WinSRV2049/Documents/January" -ExclusionMask *.exe
This example shows how to define a mask for files that you want to exclude from the file backup job. The job will not back up .EXE files that are located in the \WinSRV2049\Documents\January folder.

Perform the following steps:
1. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the New-VBRNASBackupJobObject cmdlet. Specify the following settings:
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
- Specify the ExclusionMask parameter value.

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

#### **Path**
Specifies a path to folders and files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SANEntity**
Specifies a name of an enterprise NAS system. The cmdlet will return an array of file shares residing on this NAS system. Accepts the VBRSANEntity object. To create this object, run the Get-NetAppHost cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRSANEntity]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Server**
Specifies the server with the file share. Accepts the VBRNASServer object. To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRNASServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASServer

Veeam.Backup.PowerShell.Infos.VBRSANEntity

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRNASBackupJobObject [-ExclusionMask <VBRNASBackupMask[]>] [-InclusionMask <VBRNASBackupMask[]>] [-Path <String>] -Server <VBRNASServer> [<CommonParameters>]
```
```PowerShell
New-VBRNASBackupJobObject [-ExclusionMask <VBRNASBackupMask[]>] [-InclusionMask <VBRNASBackupMask[]>] -SANEntity <VBRSANEntity> [<CommonParameters>]
```
