Start-VBRNDMPVolumeRestore
--------------------------

### Synopsis
Restores data from tape to an NDMP server.

---

### Description

This cmdlet restores data from the tape device to an NDMP server.

NOTE: You can restore entire volumes only.

---

### Related Links
* [Get-VBRNDMPVolume](Get-VBRNDMPVolume)

* [Get-VBRNDMPVolumeRestorePoint](Get-VBRNDMPVolumeRestorePoint)

* [Get-VBRNDMPServer](Get-VBRNDMPServer)

---

### Examples
> Example 1. Restoring Data from Tape to Original NDMP Server [Using Variable]

$volume = Get-VBRNDMPVolume -Name "/svm-cifs/Exhcange_vol"
$restorepoint = Get-VBRNDMPVolumeRestorePoint -Volume $volume
Start-VBRNDMPVolumeRestore -RestorePoint $restorepoint -ToOriginalLocation
This example shows how to restore data from tape to an original NDMP server.

Perform the following steps:
1. Run the Get-VBRNDMPVolume cmdlet. Specify the Name parameter value. Save the result to the $volume variable.
2. Run the Get-VBRNDMPVolumeRestorePoint cmdlet. Set the $volume variable as the Volume parameter value.
3. Run the Start-VBRNDMPVolumeRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Provide the ToOriginalLocation parameter.
> Example 2. Restoring Data from Tape to Another NDMP Server [Using Variable]

$volume = Get-VBRNDMPVolume -Name "/svm-cifs/Exhcange_vol"
$restorepoint = Get-VBRNDMPVolumeRestorePoint -Volume $volume
$ndmpserver = Get-VBRNDMPServer -Name "NetApp.tech.local"
Start-VBRNDMPVolumeRestore -RestorePoint $restorepoint -Server $ndmpserver -Path "/svm-cifs/ks_tapes"
This example shows how to restore data from tape to another NDMP server named NetApp.tech.local.

Perform the following steps:
1. Run the Get-VBRNDMPVolume cmdlet. Specify the Name parameter value. Save the result to the $volume variable.
2. Run the Get-VBRNDMPVolumeRestorePoint cmdlet. Set the $volume variable as the Volume parameter value.
3. Run the Get-VBRNDMPServer cmdlet. Specify the Name parameter value. Save the result to the $ndmpserver variable.
4. Run the Start-VBRNDMPVolumeRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $ndmpserver variable as the Server parameter value. Specify the Path parameter value.

---

### Parameters
#### **Path**
For restore to another location. Specifies the path to the volume on the target NDMP server. Veeam Backup & Replication will restore the data to that volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PreserveFolderHierarchy**
For restore to another location. Defines that Veeam Backup and Replication will preserve folder hierarchy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point to which you want to restore the selected volume. Accepts the VBRNDMPVolumeRestorePoint object. To get this object, run the Get-VBRNDMPVolumeRestorePoint cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRNDMPVolumeRestorePoint]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
For restore to another location. Specifies the target NDMP server. Veeam Backup & Replication will restore the volumes to that server. Accepts the VBRNDMPServer object.  To get this object, run the Get-VBRNDMPServer cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRNDMPServer]`|true    |named   |False        |

#### **ToOriginalLocation**
Defines that the cmdlet will start the restore to the original NDMP server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

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
Start-VBRNDMPVolumeRestore -Path <String> [-PreserveFolderHierarchy] -RestorePoint <VBRNDMPVolumeRestorePoint> [-RunAsync] -Server <VBRNDMPServer> [<CommonParameters>]
```
```PowerShell
Start-VBRNDMPVolumeRestore -RestorePoint <VBRNDMPVolumeRestorePoint> [-RunAsync] -ToOriginalLocation [<CommonParameters>]
```
