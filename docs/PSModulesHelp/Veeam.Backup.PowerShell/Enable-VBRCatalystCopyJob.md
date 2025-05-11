Enable-VBRCatalystCopyJob
-------------------------

### Synopsis
Enables backup copy jobs for HPE StoreOnce repositories.

---

### Description

This cmdlet enables backup copy jobs for HPE StoreOnce repositories.
Run the Disable-VBRCatalystCopyJob cmdlet to disable backup copy jobs for HPE StoreOnce repositories

---

### Related Links
* [Get-VBRCatalystCopyJob](Get-VBRCatalystCopyJob)

---

### Examples
> Enabling Backup Copy Job for HPE StoreOnce Repository

$job = Get-VBRCatalystCopyJob -Name "StoreOnce copy job"
Enable-VBRCatalystCopyJob -Job $job
This example shows how to enable the StoreOnce copy job backup copy job for an HPE StoreOnce repository.
Perform the following steps:
1. Run the Get-VBRCatalystCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Enable-VBRCatalystCopyJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of backup copy jobs for HPE StoreOnce repositories. The cmdlet will enable these jobs.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRCatalystCopyJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCatalystCopyJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRCatalystCopyJob [-Job] <VBRCatalystCopyJob[]> [-PassThru] [<CommonParameters>]
```
