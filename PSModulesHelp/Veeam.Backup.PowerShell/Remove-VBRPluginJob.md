Remove-VBRPluginJob
-------------------

### Synopsis
Removes plug-in backup jobs and plug-in backup copy jobs from the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet removes plug-in backup jobs and plug-in backup copy jobs from the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRPluginJob](Get-VBRPluginJob)

---

### Examples
> Removing All Plug-in Backup Jobs and Plug-in Backup Copy Jobs

$pluginjobs = Get-VBRPluginJob -Name "Plug-in backup 17"
Remove-VBRPluginJob -Job $pluginjobs
This example shows how to remove plug-in backup jobs and plug-in backup copy jobs from the Veeam Backup & Replication infrastructure.
Perform the following steps:
1. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $pluginjobs variable.
2. Run the Remove-VBRPluginJob cmdlet. Set the $pluginjobs variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of plug-in backup jobs and plug-in backup copy jobs. The cmdlet will remove these jobs from the Veeam Backup & Replication infrastructure. Accepts the VBRPluginJob[] object.  To get this object, run the Get-VBRPluginJob cmdlet.

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[VBRPluginJob[]]`|true    |0       |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRPluginJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRPluginJob [-Job] <VBRPluginJob[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
