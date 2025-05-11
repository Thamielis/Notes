Set-VBRObjectRestorePointStatus
-------------------------------

### Synopsis
Modifies the malware status of restore points.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet modifies the malware status of restore points.
IMPORTANT!  The cmdlet does not return an output. To get details on the updated malware status of restore points, run the Get-VBRObjectRestorePoint cmdlet.

---

### Related Links
* [Get-VBRObjectRestorePoint](Get-VBRObjectRestorePoint)

---

### Examples
> Modifying Malware Status of Restore Points

$rp = Get-VBRObjectRestorePoint -Id "2ee79fec-9aa8-4058-a147-ff6b76ef2924"
Set-VBRObjectRestorePointStatus -RestorePoint $rp[0] -Status Clean
This example shows how to set the Clean status for restore points.
Perform the following steps:
1. Run the Get-VBRObjectRestorePoint cmdlet. Specify the Id parameter value. Save the result to the $rp variable.
The Get-VBRObjectRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the first restore session in the array).
2. Run the Set-VBRObjectRestorePointStatus cmdlet. Set the $rp variable as the RestorePoint parameter value. Set the Clean option for the Status parameter.

---

### Parameters
#### **RestorePoint**
Specifies restore points which malware status you want to moduify.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRObjectRestorePoint]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Status**
Specifies one of the following malware status:
* Clean
* Suspicious
* Infected
Valid Values:

* Clean
* Suspicious
* Infected

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRActivitySeverity]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRObjectRestorePoint

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRObjectRestorePointStatus [-RestorePoint] <VBRObjectRestorePoint> -Status {Clean | Suspicious | Infected} [<CommonParameters>]
```
