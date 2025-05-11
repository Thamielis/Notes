Add-VSBJob
----------

### Synopsis
Creates a VMware SureBackup job.

---

### Description

This cmdlet creates a new VMware SureBackup job.

To add VMs that you want to verify to the SureBackup job, you can use an application group containing the list of VMs, or link a backup job which will act as a VM container.

Note that if you link a backup job, the SureBackup job will verify all VMs added to the linked job.

When you create a SureBackup job, you need to run it manually unless you enable a job schedule.

Run Start-VSBJob to start the created SureBackup job. Run Set-VSBJobScheduleOptions to set schedule for the SureBackup job.

---

### Examples
> Example 1

Get-VBRJob -Name "Exchange Backup Job" | Add-VSBJob -Name "Exchange SureJob" -VirtualLab $VLab01 -AppGroup $"Exchange Appgroup"
This command creates a new Sure Backup job named "Exchange SureJob" using a virtual lab, an application group and a linked job.

- The VM to verify is obtained by searching for the backup job named "Exchange Backup Job" with Get-VBRJob, and piped down.

- The virtual lab and the application group objects are obtained with Get-VSBVirtualLab and Get-VSBApplicationGroup and assigned to $VLab01 and $"Exchange Appgroup" variables accordingly beforehand.
> Example 2

```PowerShell
Add-VSBJob -Name "Exchange SureJob" -VirtualLab $VLab01 -AppGroup $"Exchange Appgroup"
This command creates a new Sure Backup job named "Exchange SureJob" using a virtual lab, an application group and a linked job.

The virtual lab and application group objects are obtained with Get-VSBVirtualLab and Get-VSBApplicationGroup and assigned to $VLab01 and $"Exchange Appgroup" variables accordingly beforehand.
```
> Example 3

Get-VSBVirtualLab -Name "Exchange VLab 01" | Add-VSBJob -Name "Exchange SureJob" -AppGroup $"Exchange Appgroup"
This command creates a new Sure Backup job named "Exchange SureJob" using a virtual lab and an application group.

- The virtual lab object is obtained with Get-VSBVirtualLab and piped down.

- The VM to verify is included into the application group, the application group object is obtained with Get-VSBApplicationGroup and assigned to the $"Exchange Appgroup" variable beforehand.
> Example 4

Add-VSBJob -Name "Exchange SureJob" -VirtualLab $VLab01 -LinkedJob $"Exchange Backup"
This command creates a new Sure Backup job named "Exchange SureJob" using a virtual lab and a linked job.

- The virtual lab object is obtained with Get-VSBVirtualLab and assigned to $VLab01 variable beforehand.

- The VM to verify is obtained with Get-VBRJob and assigned to the $"Exchange Backup" variable beforehand.

---

### Parameters
#### **AppGroup**
Specifies the application group you want to use to provide the copy of the production environment of the verified VM.  If you do not use an application group, make sure that the -LinkedJob parameter is set.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CSbAppGroup]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies the description of the new SureBackup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **LinkedJob**
Specifies the backup, replication or copy job containing the VM you want to verify. If you do not use a linked backup job, make sure that the -AppGroup parameter is set. You can assign multiple backup jobs to this object.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the name you want to assign to the SureBackup job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |0       |False        |

#### **VirtualLab**
Specifies the virtual lab you want to use for verification.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[CViSbVirtualLab]`|false   |1       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.SureBackup.CViSbVirtualLab

Veeam.Backup.Core.SureBackup.CSbAppGroup

Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VSBJob [[-Name] <String>] [[-VirtualLab] <CViSbVirtualLab>] [-AppGroup <CSbAppGroup>] [-Description <String>] [-LinkedJob <CBackupJob[]>] [<CommonParameters>]
```
