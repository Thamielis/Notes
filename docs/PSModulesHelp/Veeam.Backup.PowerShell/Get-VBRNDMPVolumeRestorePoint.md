Get-VBRNDMPVolumeRestorePoint
-----------------------------

### Synopsis
Returns restore points of NDMP server volumes.

---

### Description

This cmdlet returns restore points available for NDMP server volumes.

---

### Related Links
* [Get-VBRNDMPVolume](Get-VBRNDMPVolume)

---

### Examples
> Example 1. Getting Restore Points for NDMP Server Volume [Using Variable]

$volume = Get-VBRNDMPVolume -Name "/svm-cifs/Exhcange_vol"
Get-VBRNDMPVolumeRestorePoint -Volume $volume
This example shows how to get the restore points available for the /svm-cifs/Exhcange_vol volume.

Perform the following steps:
1. Run the Get-VBRNDMPVolume cmdlet to get the volume. Specify the Name parameter value. Save the result to the $volume variable.
2. Run the Get-VBRNDMPVolumeRestorePoint cmdlet. Set the $volume variable as the Volume parameter value.
> Example 2. Getting Restore Points for NDMP Server Volume by Backup ID [Using Variable]

$volume = Get-VBRNDMPVolume -Name "/svm-cifs/Exhcange_vol"
Get-VBRNDMPVolumeRestorePoint -Volume $volume -ID "3efbf118-978f-4858-805d-d8560208dc6f"
This example shows how to get the restore points available on the /svm-cifs/Exhcange_vol volume by the 3efbf118-978f-4858-805d-d8560208dc6f backup ID.

Perform the following steps:
1. Run the Get-VBRNDMPVolume cmdlet to get the volume. Specify the Name parameter value. Save the result to the $volume variable.
2. Run the Get-VBRNDMPVolumeRestorePoint cmdlet. Set the $volume variable as the Volume parameter value. Specify the ID parameter value.

---

### Parameters
#### **Id**
Specifies an array of IDs for backups that are stored on the NDMP server. The cmdlet will return an array of selected backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Volume**
Specifies NDMP server volumes. The cmdlet will return an array of restore points available for selected volumes. Accepts the VBRNDMPVolume object. To get this object, run the Get-VBRNDMPVolume cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRNDMPVolume]`|true    |named   |False        |

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
Get-VBRNDMPVolumeRestorePoint -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNDMPVolumeRestorePoint -Volume <VBRNDMPVolume> [<CommonParameters>]
```
