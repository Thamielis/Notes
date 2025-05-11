Disable-VBRCatalystCopyJob
--------------------------

### Synopsis
Disables backup copy jobs for HPE StoreOnce repositories.

---

### Description

This cmdlet disables backup copy jobs for HPE StoreOnce repositories.
Run the Enable-VBRCatalystCopyJob cmdlet to enable backup copy jobs for HPE StoreOnce repositories.

---

### Related Links
* [Get-VBRCatalystCopyJob](Get-VBRCatalystCopyJob)

---

### Examples
> Disabling Backup Copy Job for HPE StoreOnce Repository

$job = Get-VBRCatalystCopyJob -Name "StoreOnce copy job"
Disable-VBRCatalystCopyJob -Job $job
This example shows how to disable the StoreOnce copy job backup copy job for an HPE StoreOnce repository.
Perform the following steps:
1. Run the Get-VBRCatalystCopyJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Disable-VBRCatalystCopyJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of backup copy jobs for HPE StoreOnce repositories. The cmdlet will disable these jobs.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRCatalystCopyJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

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
Disable-VBRCatalystCopyJob [-Job] <VBRCatalystCopyJob[]> [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```
