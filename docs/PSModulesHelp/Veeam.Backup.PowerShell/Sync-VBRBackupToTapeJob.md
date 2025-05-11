Sync-VBRBackupToTapeJob
-----------------------

### Synopsis
Starts an active full for a selected GFS backup to tape job.

---

### Description

This cmdlet starts an active full for a selected backup to tape job. The job must be targeted to a GFS media pool.

---

### Related Links
* [Get-VBRTapeJob](Get-VBRTapeJob)

---

### Examples
> Example - Starting Weekly Active Full Backup for GFS Backup to Tape Job

$job = Get-VBRTapeJob -Name "WebApp Backup"
Sync-VBRBackupToTapeJob -Job $job -Weekly
This example shows how to start an active weekly full backup for the WebApp Backup GFS job.
Perform the following steps:
1. Run the Get-VBRTapeJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Sync-VBRBackupToTapeJob cmdlet. Set the $job variable as the Job parameter value. Provide the Weekly parameter.

---

### Parameters
#### **Job**
Specifies the backup to tape job for which you want to create an active full. Accepts the VBRBackupToTapeJob object. To get this object, run the Get-VBRTapeJob cmdlet.

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[VBRBackupToTapeJob]`|true    |named   |True (ByValue)|

#### **Monthly**
Defines that the job will create a monthly full.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Quarterly**
Defines that the job will create a quarterly full.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Wait**
Defines that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Weekly**
Defines that the job will create a weekly full.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Yearly**
Defines that the job will create a yearly full.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackupToTapeJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRBackupToTapeJob -Job <VBRBackupToTapeJob> -Monthly [-Wait] [<CommonParameters>]
```
```PowerShell
Sync-VBRBackupToTapeJob -Job <VBRBackupToTapeJob> -Quarterly [-Wait] [<CommonParameters>]
```
```PowerShell
Sync-VBRBackupToTapeJob -Job <VBRBackupToTapeJob> [-Wait] -Weekly [<CommonParameters>]
```
```PowerShell
Sync-VBRBackupToTapeJob -Job <VBRBackupToTapeJob> [-Wait] -Yearly [<CommonParameters>]
```
