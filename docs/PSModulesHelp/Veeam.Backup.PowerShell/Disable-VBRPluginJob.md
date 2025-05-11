Disable-VBRPluginJob
--------------------

### Synopsis
Stops plug-in backup jobs and plug-in backup copy jobs.

---

### Description

This cmdlet stops plug-in backup jobs and plug-in backup copy jobs.
Run the Enable-VBRPluginJob cmdlet to start plug-in backup jobs and plug-in backup copy jobs.

---

### Related Links
* [Get-VBRPluginJob](Get-VBRPluginJob)

---

### Examples
> Stopping All Plug-in Backup Jobs and Plug-in Backup Copy Jobs

$job = Get-VBRPluginJob -Name "Plug-in backup 17"
Disable-VBRPluginJob -Job $job
This example shows how to stop plug-in backup jobs and plug-in backup copy jobs.
Perform the following steps:
1. Run the Get-VBRPluginJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Disable-VBRPluginJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will return a notification that the backup files created by the plug-in backup copy job will be left in the inconsistent state after running this cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies an array of plug-in backup jobs and plug-in backup copy jobs. The cmdlet will stop these jobs. Accepts the VBRPluginJob[] object.  To get this object, run the Get-VBRPluginJob cmdlet.

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
Disable-VBRPluginJob [-Job] <VBRPluginJob[]> [-Force] [-Confirm] [-WhatIf] [<CommonParameters>]
```
