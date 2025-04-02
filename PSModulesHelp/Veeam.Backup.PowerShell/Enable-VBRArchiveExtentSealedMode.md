Enable-VBRArchiveExtentSealedMode
---------------------------------

### Synopsis
Enables the Sealed mode for the archive extent.

---

### Description

This cmdlet enables the Sealed mode for the archive extent of the scale-out backup repository.
Run the Disable-VBRArchiveExtentSealedMode cmdlet to disable the Sealed mode.

---

### Related Links
* [Get-VBRArchiveExtent](Get-VBRArchiveExtent)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Enabling Sealed Mode for Archive Extent

$repository = Get-VBRBackupRepository -ScaleOut
$extent = Get-VBRArchiveExtent -Repository $repository
Enable-VBRArchiveExtentSealedMode -ArchiveExtent $extent
This example shows how to enable Sealed mode for the specified capacity extent of the scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Provide the ScaleOut parameter. Save the result to the $repository variable.
2. Run the Get-VBRArchiveExtent cmdlet. Set the $repository variable as the Repository parameter value. Save the result to the $extent variable.
3. Run the Enable-VBRArchiveExtentSealedMode cmdlet. Set the $extent variable as the ArchiveExtent parameter value.

---

### Parameters
#### **ArchiveExtent**
Specifies the archive extent. The cmdlet will set this extent to the Sealed mode.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRArchiveExtent[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRArchiveExtent[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRArchiveExtentSealedMode -ArchiveExtent <VBRArchiveExtent[]> [-RunAsync] [<CommonParameters>]
```
