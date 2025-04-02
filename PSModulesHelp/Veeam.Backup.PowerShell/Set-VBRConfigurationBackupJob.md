Set-VBRConfigurationBackupJob
-----------------------------

### Synopsis
Modifies the configuration backup job.

---

### Description

This cmdlet modifies settings of the configuration backup job.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRConfigurationBackupScheduleOptions](New-VBRConfigurationBackupScheduleOptions)

* [Get-VBREncryptionKey](Get-VBREncryptionKey)

---

### Examples
> Example 1. Disabling Configuration Backup Job

```PowerShell
Set-VBRConfigurationBackupJob -Enable:$False
This command disables the configuration backup job.
```
> Example 2. Modifying Configuration Backup Schedule and Enabling Encryption

$daily = New-VBRDailyOptions -Period "05:00" -DayOfWeek Saturday
$dailyschedule = New-VBRConfigurationBackupScheduleOptions -Type Daily -DailyOptions $daily
$encryptionkey = Get-VBREncryptionKey -Description "veeam encryption"
Set-VBRConfigurationBackupJob -ScheduleOptions $dailyschedule -EnableEncryption -EncryptionKey $encryptionkey
This command modifies the configuration backup schedule and enables encryption. The job is set to run at 00:00 every Saturday.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the Period and the DayOfWeek parameter values. Save the result to the $daily variable.
2. Run the New-VBRConfigurationBackupScheduleOptions cmdlet. Set the Daily option for the Type parameter. Set the $daily variable as the DailyOptions parameter value. Save the result to the $dailyschedule variable.
3. Run the Get-VBREncryptionKey cmdlet. Specify the Description parameter value. Save it to the $encryptionkey variable.
4. Run the Set-VBRConfigurationBackupJob cmdlet. Set the $dailyschedule variable as the ScheduleOptions parameter value. Provide the EnableEncryption parameter. Set the $encryptionkey variable as the EncryptionKey parameter value.

---

### Parameters
#### **Enable**
Defines that the job will run automatically on schedule.
If set to $False, you will need to run the job manually.
Default: True.
Note: To disable the configuration job schedule, specify the $false value for the Enable parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEncryption**
If set to true, the configuration backup will be encrypted.
Use the EncryptionKey parameter to specify the encryption key.
Note: if you have created at least one password in the Password Manager on the backup server, you must enable encryption for the configuration backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
Used to set the encryption key for the EnableEncryption parameter.
Specifies the encryption key you want to use to encrypt the data.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBREncryptionKey]`|false   |named   |False        |

#### **NotificationOptions**
Specifies email notification options for the configuration backup job. Accepts the VBRNotificationOptions object. Run the New-VBRNotificationOptions cmdlet to create this object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Repository**
Specifies the backup repository where you want to store the configuration backups.
You cannot specify a cloud repository that is created on base of scale-out backup repository.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RestorePointsToKeep**
Specifies the number of restore points you want to keep on disk.
You can set 1 to 255.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies the schedule for the configuration backup job.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[VBRConfigurationBackupScheduleOptions]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRConfigurationBackupJob [-Enable] [-EnableEncryption] [-EncryptionKey <VBREncryptionKey>] [-NotificationOptions <VBRNotificationOptions>] [-PassThru] [-Repository <CBackupRepository>] 
```
```PowerShell
[-RestorePointsToKeep <Int32>] [-ScheduleOptions <VBRConfigurationBackupScheduleOptions>] [<CommonParameters>]
```
