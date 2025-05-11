Set-VBRWindowsWorkstationScheduleOptions
----------------------------------------

### Synopsis
Modifies the schedule of the backup policy for Windows workstations.

---

### Description

This cmdlet modifies schedule settings for the backup policy that Veeam Agent job applies to Windows workstations.
IMPORTANT!
Use the Set-VBRServerScheduleOptions cmdlet to modify the schedule settings for the following types of jobs:
- For the backup policy that Veeam Agent job applies to Windows servers.
- For Veeam Agent jobs that back up Windows servers.
- For Veeam Agent jobs that back up failover clusters.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [New-VBRWindowsWorkstationScheduleOptions](New-VBRWindowsWorkstationScheduleOptions)

* [New-VBRDailyOptions](New-VBRDailyOptions)

---

### Examples
> Modifying Schedule for Veeam Agent Job for Windows Workstations

$job = Get-VBRComputerBackupJob -Name "Windows_W_Job"
$options = New-VBRWindowsWorkstationScheduleOptions -BackupAtLock -BackupTimeout 5 -BackupTimeoutType Hour
$daily = New-VBRDailyOptions -DayOfWeek Wednesday -Period 20:00
Set-VBRWindowsWorkstationScheduleOptions -Options $options -DailyOptions $daily
This example shows how to modify a schedule for a Veeam Agent job that backs up Windows workstations.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the New-VBRWindowsWorkstationScheduleOptions cmdlet. Provide the BackupAtLock parameter. Specify the BackupTimeout and BackupTimeoutType parameter values. Save the result to the $options variable.
3. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek and Period parameter values. Save the result to the $daily variable.
4. Run the Set-VBRWindowsWorkstationScheduleOptions cmdlet. Set the $options variable as the Options parameter value. Set the $daily variable as the DailyOptions parameter value.

---

### Parameters
#### **BackupAtLock**
Defines that the Veeam Agent backup job will start when the user locks the protected computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupAtLogOff**
Defines that the Veeam Agent backup job will start when the user working with the protected computer performs a logout operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupAtTargetConnection**
Defines that the Veeam Agent backup job will start when the backup storage becomes available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **BackupTimeout**
Specifies the number of Veeam Agent backup job sessions. Use this option to restrict the frequency of the backup job sessions.
Use the BackupTimeoutType parameter to set the job interval.
Note: this option does not work for daily schedule.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **BackupTimeoutType**
Specifies an interval between the backup job sessions.
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
For daily schedule.
Specifies daily schedule settings. The cmdlet will create the Veeam Agent backup job with these settings.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **EjectStorageAfterBackup**
For the BackupAtTargetConnection parameter.
Defines that Veeam Agent for Microsoft Windows will unmount the storage device after the backup job completes successfully.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableDailySchedule**
Enables daily schedule.
Veeam Agent backup job will start at the time specified in the DailyOptions parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Options**
Specifies the daily schedule settings for Windows workstations. The cmdlet will modify the existing daily schedule settings.

|Type                                    |Required|Position|PipelineInput |
|----------------------------------------|--------|--------|--------------|
|`[VBRWindowsWorkstationScheduleOptions]`|true    |named   |True (ByValue)|

#### **PostBackupAction**
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
|`[VBRPostBackupAction]`|false   |named   |False        |

#### **PowerOffAction**
Specifies the action that Veeam Agent for Microsoft Windows must perform when the protected computer is powered off at a time when the scheduled backup job must start.
* SkipBackup: select this option if you do not want Veeam Agent for Microsoft Windows to start the scheduled backup job when the computer is powered on. Veeam Agent for Microsoft Windows will perform backup at the next scheduled time.
* BackupAtPowerOn: select this option if you want Veeam Agent for Microsoft Windows to start the scheduled backup job when the protected computer is powered on.
Valid Values:

* SkipBackup
* BackupAtPowerOn

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRPowerOffAction]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRWindowsWorkstationScheduleOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRWindowsWorkstationScheduleOptions [-BackupAtLock] [-BackupAtLogOff] [-BackupAtTargetConnection] [-BackupTimeout <Int32>] [-BackupTimeoutType {Minute | Hour | Day}] [-DailyOptions <VBRDailyOptions>] 
```
```PowerShell
[-EjectStorageAfterBackup] [-EnableDailySchedule] -Options <VBRWindowsWorkstationScheduleOptions> [-PostBackupAction {Sleep | Hibernate | Shutdown | KeepRunning}] [-PowerOffAction {SkipBackup | 
```
```PowerShell
BackupAtPowerOn}] [<CommonParameters>]
```
