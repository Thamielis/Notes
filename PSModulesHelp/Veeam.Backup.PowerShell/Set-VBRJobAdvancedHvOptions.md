Set-VBRJobAdvancedHvOptions
---------------------------

### Synopsis
Customizes Hyper-V job settings.

---

### Description

This cmdlet sets special options for the selected Hyper-V job.

In case you cannot use application-aware image processing, you can enable a Hyper-V quiescence mechanism to backup data that can be changed during the backup.

Read more about Hyper-V job settings in Veeam Backup & Replication user guide at http://www.veeam.com/vmware-backup/help-center.

Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Editing Advanced Job Settings to Specific Backup Job [Using Pipeline]

Get-VBRJob -Name "Backup Job 01" | Set-VBRJobAdvancedHvOptions -EnableHvQuiescence $True -CanDoCrashConsistent $True -UseChangeTracking $True -ExcludeSwapFile $True
This example shows how to edit advanced job settings to backup job named Backup Job 01:
- The Hyper-V quiescence is enabled.
- The crash consistent backup is enabled.
- The changed block data is enabled.
- The swap file is excluded form backup.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRJobAdvancedHvOptions cmdlet. Specify the following settings:
- Provide the $True value for the EnableHVQuiescence parameter.
- Provide the $True value for the CanDoCrashConsistent parameter.
- Provide the $True value for the UseChangeTracking parameter.
- Provide the $True value for the ExcludeSwapFile parameter.

---

### Parameters
#### **CanDoCrashConsistent**
Defines whether the job will create crash consistent backup.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **EnableHvQuiescence**
Defines whether the job will use the Hyper-V quiescence mechanism.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **ExcludeSwapFile**
Defines whether the job will exclude the swap file from backup.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs. The cmdlet will modify advanced Hyper-V backup options of these jobs.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **UseChangeTracking**
Defines whether the job will use the changed block tracking.

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
Set-VBRJobAdvancedHvOptions [-CanDoCrashConsistent <Boolean>] [-EnableHvQuiescence <Boolean>] [-ExcludeSwapFile <Boolean>] -Job <CBackupJob[]> [-UseChangeTracking <Boolean>] [<CommonParameters>]
```
