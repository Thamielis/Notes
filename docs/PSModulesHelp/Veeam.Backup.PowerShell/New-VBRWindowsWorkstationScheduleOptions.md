New-VBRWindowsWorkstationScheduleOptions
----------------------------------------

### Synopsis
Creates the schedule for the backup policy for Windows workstations.

---

### Description

The cmdlet creates the VBRWindowsWorkstationScheduleOptions object. This object contains schedule settings for the backup policy that Veeam Agent job applies to Windows workstations.
NOTE: Use the New-VBRServerScheduleOptions cmdlet to create the schedule settings for the following types of jobs:
- For the backup policy that Veeam Agent job applies to a Windows server.
- For Veeam Agent jobs that back up Windows servers.
- For Veeam Agent jobs that back up failover clusters.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

---

### Examples
> Example 1. Creating Daily Schedule for Veeam Agent Job for Windows Workstations

$daily = New-VBRDailyOptions -Type Everyday -Period 7:00
New-VBRWindowsWorkstationScheduleOptions -DailyOptions $daily -EnableDailySchedule -PowerOffAction BackupAtPowerOn -PostBackupAction Hibernate -BackupAtLogOff
This example shows how to create a schedule for a Veeam Agent job that backs up Windows workstations. The job will run with the following settings:
- The job will run every day at 7:00 AM.
- In case the protected computer is powered off when the backup job starts, Veeam Agent for Microsoft Windows will start the scheduled backup job when the protected computer is powered on.
- Veeam Agent for Microsoft Windows will bring the computer to the hibernate mode after the backup job completes successfully.
- Veeam Agent for Microsoft Windows will back up the protected computer when the user logs off.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the Type and Period parameter values. Save the result to the $daily variable.
2. Run the New-VBRWindowsWorkstationScheduleOptions cmdlet. Specify the following settings:
- Set the $daily variable as the DailyOptions parameter value.
- Provide the EnableDailySchedule parameter.
- Set the BackupAtPowerOn option for the PowerOffAction parameter.
- Set the Hibernate option for the PostBackupAction parameter.
- Provide the BackupAtLogOff parameter.
> Example 2. Creating Schedule for Veeam Agent Job for Windows Workstations

New-VBRWindowsWorkstationScheduleOptions -BackupAtLock -BackupTimeout 5 -BackupTimeoutType Hour
This command creates a schedule for Windows workstation.
Per this schedule, Veeam Backup & Replication will start a backup session when the user locks the machine.
Provide the BackupTimeout parameter to set the interval between Veeam Agent backup jobs to 5 hours.

---

### Parameters
#### **BackupAtLock**
For backups at a particular event.
Defines that the Veeam Agent backup job will start when the user locks the protected computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupAtLogOff**
For backups at a particular event.
Defines that the Veeam Agent backup job will start when the user working with the protected computer performs a logout operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupAtTargetConnection**
For backups at a particular event.
Defines that the Veeam Agent backup job will start when the backup storage becomes available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupTimeout**
For backups at a particular event.
Specifies an interval between the backup job sessions.
Use the BackupTimeoutType parameter to set the job interval.
Note: This option does not work for daily schedule.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **BackupTimeoutType**
For the BackupTimeout parameter.
Specifies an interval between the Veeam Agent backup job. Use the following types of time interval:
* Minute: use this option to set up a minute interval between the backup job sessions.
* Hour: use this option to set up an hourly interval between the backup job sessions.
* Day: use this option to set up a daily interval between the backup job sessions.
Valid Values:

* Minute
* Hour
* Day

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRAgentBackupTimeoutType]`|false   |named   |False        |

#### **DailyOptions**
For periodical backups.
Specifies daily schedule settings. The cmdlet will create the server schedule with these settings.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[VBRDailyOptions]`|true    |named   |True (ByValue)|

#### **EjectStorageAfterBackup**
For the BackupAtTargetConnection parameter. Indicates that Veeam Agent for Microsoft Windows will unmount the storage device after the backup job completes successfully.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableDailySchedule**
For periodical backups.
Enables daily schedule.
Veeam Agent backup job will start at the time specified in the DailyOptions parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PostBackupAction**
For periodical backups.
Specifies the action that Veeam Agent for Microsoft Windows will perform after the backup job completes successfully.
* Sleep: select this option if you want Veeam Agent for Microsoft Windows to bring the protected computer to the standby mode.
* Hibernate: select this option if you want Veeam Agent for Microsoft Windows to bring the protected computer to the hibernate mode.
Note: This option is available if the hibernate mode is enabled on the protected computer.
* Shutdown: select this option if you want Veeam Agent for Microsoft Windows to shut down the protected computer.
* KeepRunning: select this option if the protected computer must keep on working.
Valid Values:

* Sleep
* Hibernate
* Shutdown
* KeepRunning

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRPostBackupAction]`|true    |named   |False        |

#### **PowerOffAction**
For periodical backups.
Specifies the action that Veeam Agent for Microsoft Windows must perform when the protected computer is powered off at a time when the scheduled backup job must start.
* SkipBackup: select this option if you do not want Veeam Agent for Microsoft Windows to start the scheduled backup job when the computer is powered on. Veeam Agent for Microsoft Windows will perform backup at the next scheduled time.
* BackupAtPowerOn: select this option if you want Veeam Agent for Microsoft Windows to start the scheduled backup job when the protected computer is powered on.
Valid Values:

* SkipBackup
* BackupAtPowerOn

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRPowerOffAction]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDailyOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRWindowsWorkstationScheduleOptions [-BackupAtLock] [-BackupAtLogOff] [-BackupAtTargetConnection] [-BackupTimeout <Int32>] [-BackupTimeoutType {Minute | Hour | Day}] -DailyOptions <VBRDailyOptions> 
```
```PowerShell
[-EjectStorageAfterBackup] [-EnableDailySchedule] -PostBackupAction {Sleep | Hibernate | Shutdown | KeepRunning} -PowerOffAction {SkipBackup | BackupAtPowerOn} [<CommonParameters>]
```
