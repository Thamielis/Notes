Start-VBRCatalystCopyJob
------------------------

### Synopsis
Starts backup copy jobs for HPE StoreOnce repositories.

---

### Description

This cmdlet starts backup copy jobs for HPE StoreOnce repositories.

---

### Related Links
* [Get-VBRCatalystCopyJob](Get-VBRCatalystCopyJob)

---

### Examples
> Starting Backup Copy Job for HPE StoreOnce Repository

$job = Get-VBRCatalystCopyJob -Name "StoreOnce copy job"
Start-VBRCatalystCopyJob -Job $job
This example shows how to start the StoreOnce copy job backup copy job for an HPE StoreOnce repository.
Perform the following steps:
1. Run the Get-VBRCatalystCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Start-VBRCatalystCopyJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of backup copy jobs for HPE StoreOnce repositories. The cmdlet will start these jobs.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRCatalystCopyJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

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
Start-VBRCatalystCopyJob [-Job] <VBRCatalystCopyJob[]> [<CommonParameters>]
```
