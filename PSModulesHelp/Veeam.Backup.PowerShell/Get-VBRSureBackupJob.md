Get-VBRSureBackupJob
--------------------

### Synopsis
Returns SureBackup jobs.

---

### Description

This cmdlet returns SureBackup jobs.

---

### Examples
> Example 1. Getting All SureBackup Jobs from Veeam Backup & Replication Infrastructure

Get-VBRSureBackupJob
VirtualLab                  : Virtual Lab 2
ApplicationGroup            : Application Group 2
KeepApplicationGroupRunning : True
LinkedJob                   : {Veeam.Backup.PowerShell.Infos.VBRSureBackupLinkedJob}
LinkToJobs                  : True
MaxConcurrentVMs            : 3
VerificationOptions         : Veeam.Backup.PowerShell.Infos.VBRSureBackupJobVerificationOptions
ScheduleOptions             : Veeam.Backup.PowerShell.Infos.VBRSureBackupJobScheduleOptions
LastRun                     : 2/28/2020 6:31:24 AM
LastResult                  : None
NextRun                     : 1/1/0001 12:00:00 AM
LastState                   : Starting
IsEnabled                   : True
ScheduleEnabled             : True
Id                          : 1982ee0c-acd2-4c7c-a97f-e8d8cafabf31
Name                        : Job02
Description                 : Created by WinSRV2049\Administrator at 2/20/2020 6:23 AM.

VirtualLab                  : Virtual Lab 1
ApplicationGroup            : Application Group 1
KeepApplicationGroupRunning : True
LinkedJob                   : {}
LinkToJobs                  : False
MaxConcurrentVMs            : 3
VerificationOptions         : Veeam.Backup.PowerShell.Infos.VBRSureBackupJobVerificationOptions
ScheduleOptions             : Veeam.Backup.PowerShell.Infos.VBRSureBackupJobScheduleOptions
LastRun                     : 2/25/2020 6:22:39 AM
LastResult                  : None
NextRun                     : 1/1/0001 12:00:00 AM
LastState                   : Working
IsEnabled                   : True
ScheduleEnabled             : True
Id                          : 6298815d-2c1c-46a0-86a9-299a8bf1ab72
Name                        : Job01
Description                 : Created by WinSRV2049\Administrator at 2/20/2020 6:21 AM.
This command returns all SureBackup jobs that are added to the Veeam Backup & Replication Infrastructure.
The cmdlet output will contain details on SureBackup jobs.
> Example 2. Getting SureBackup Job by Name

```PowerShell
Get-VBRSureBackupJob -Name "SureJob2"
VirtualLab                  : Virtual Lab 2
ApplicationGroup            : Application Group 2
KeepApplicationGroupRunning : True
LinkedJob                   : {Veeam.Backup.PowerShell.Infos.VBRSureBackupLinkedJob}
LinkToJobs                  : True
MaxConcurrentVMs            : 3
VerificationOptions         : Veeam.Backup.PowerShell.Infos.VBRSureBackupJobVerificationOptions
ScheduleOptions             : Veeam.Backup.PowerShell.Infos.VBRSureBackupJobScheduleOptions
LastRun                     : 9/24/2019 6:31:24 AM
LastResult                  : None
NextRun                     : 1/1/0001 12:00:00 AM
LastState                   : Starting
IsEnabled                   : True
ScheduleEnabled             : True
Id                          : 1982ee0c-acd2-4c7c-a97f-e8d8cafabf31
Name                        : Job02
Description                 : Created by WinSRV2049\Administrator at 2/20/2020 6:23 AM.
This command returns the SureJob2 SureBackup job.
The cmdlet output will contain details on the SureBackup job.
```
> Example 3. Getting SureBackup Job by ID

```PowerShell
Get-VBRSureBackupJob -Id 6298815d-2c1c-46a0-86a9-299a8bf1ab72
VirtualLab                  : Virtual Lab 1
ApplicationGroup            : Application Group 1
KeepApplicationGroupRunning : True
LinkedJob                   : {}
LinkToJobs                  : False
MaxConcurrentVMs            : 3
VerificationOptions         : Veeam.Backup.PowerShell.Infos.VBRSureBackupJobVerificationOptions
ScheduleOptions             : Veeam.Backup.PowerShell.Infos.VBRSureBackupJobScheduleOptions
LastRun                     : 9/24/2019 6:22:39 AM
LastResult                  : None
NextRun                     : 1/1/0001 12:00:00 AM
LastState                   : Working
IsEnabled                   : True
ScheduleEnabled             : True
Id                          : 6298815d-2c1c-46a0-86a9-299a8bf1ab72
Name                        : Job01
Description                 : Created by WinSRV2049\Administrator at 2/20/2020 6:21 AM.
This command returns the 6298815d-2c1c-46a0-86a9-299a8bf1ab72 SureBackup job.
The cmdlet output will contain details on the SureBackup job.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for SureBackup jobs. The cmdlet will return SureBackup jobs with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for SureBackup jobs. The cmdlet will return SureBackup jobs with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String[]

System.Guid[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRSureBackupJob [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRSureBackupJob [-Name <String[]>] [<CommonParameters>]
```
