Set-VBRJobAdvancedViOptions
---------------------------

### Synopsis
Customizes VMware job settings.

---

### Description

This cmdlet sets special options for the selected VMware job.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Editing Advanced Job Settings to Specific Backup Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01" | Set-VBRJobAdvancedViOptions -VMToolsQuiesce $True -EnableChangeTracking $True -UseChangeTracking $True -ExcludeSwapFile $True
This example shows how to edit the advanced job settings to backup job named Backup Job 01:
- The VMware quiescence is enabled.
- The changed block data is enabled.
- The CBT is forced to use despite the ESX host settings.
- The swap file is excluded form backup.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedViOptions cmdlet. Specify the following settings:
- Provide the $True value for the VmToolsQuiesce parameter.
- Provide the $True value for the EnableChangeTracking parameter.
- Provide the $True value for the UseChangeTracking parameter.
- Provide the $True value for the ExcludeSwapFile parameter.

---

### Parameters
#### **EnableChangeTracking**
Defines whether the changed block tracking will be enabled.
* True: the changed block tracking will be enabled.
* False: the changed block tracking will be disabled.
Default: True.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **ExcludeSwapFile**
Defines whether the swap file will be excluded from backup.
* True: the swap file will be excluded from backup.
* False: the swap file will not be excluded from backup.
Default: True.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs. The cmdlet will modify advanced VMware backup options of these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SetResultsToVmAttribute**
Defines whether the job results will be written to custom attributes field of the VM.
* True: the job results will be written to custom attributes field of the VM.
* False: the job results will not be written to custom attributes field of the VM.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **UseChangeTracking**
Defines whether the changed block tracking will be used even if CBT is disabled on the ESXi host.
* True: the changed block tracking will be used.
* False: the changed block tracking will not be used.
Default: True.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **VmAttributeName**
Specifies the custom attributes field name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VMToolsQuiesce**
Defines whether the VMware quiescence mechanism will be enabled.
* True: the VMware quiescence mechanism will be enabled.
* False: the VMware quiescence mechanism will not be enabled.
Use this mechanism if the application-aware processing cannot be used.
Default: False.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRJobAdvancedViOptions [-EnableChangeTracking <Boolean>] [-ExcludeSwapFile <Boolean>] -Job <CBackupJob[]> [-SetResultsToVmAttribute <Boolean>] [-UseChangeTracking <Boolean>] [-VmAttributeName <String>] 
```
```PowerShell
[-VMToolsQuiesce <Boolean>] [<CommonParameters>]
```
