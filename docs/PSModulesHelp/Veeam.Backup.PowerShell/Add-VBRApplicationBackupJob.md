Add-VBRApplicationBackupJob
---------------------------

### Synopsis
Creates application backup policies.

---

### Description

This cmdlet creates application backup policies. To create application backup policies, you must specify a container object with discovered application entities (for example, individual computers, databases, protection groups, and so on) that you plan to back up and the target location for storing backups.
1. Run Get-VBRProtectionGroup to get the protection group.
2. Run Get-VBRBackupRepository to get the repository.
3. Run Add-VBRApplicationBackupJob to create application backup policy.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRApplicationBackupOptions](New-VBRApplicationBackupOptions)

* [New-VBRApplicationScheduleOptions](New-VBRApplicationScheduleOptions)

* [New-VBRSAPHANAProcessingOptions](New-VBRSAPHANAProcessingOptions)

* [New-VBRDatabaseProcessingOptions](New-VBRDatabaseProcessingOptions)

* [New-VBRSAPHANAOptions](New-VBRSAPHANAOptions)

* [New-VBRSAPHANACredentialsOptions](New-VBRSAPHANACredentialsOptions)

---

### Examples
> Example - Creating Application Backup Policy for Veeam Plug-in for SAP HANA

$group = Get-VBRProtectionGroup -Name "Database Servers"
$repository = Get-VBRBackupRepository -Name "Default Backup Repository"
$backup_options = New-VBRApplicationBackupOptions -FullBackupScheduleType Weekly -WeeklyScheduleType SelectedDays -SelectedDays Sunday, Wednesday
$daily = New-VBRDailyOptions -DayOfWeek Friday -Period 7:00
$schedule_options = New-VBRApplicationScheduleOptions -Type Daily -DailyOptions $daily
$db_administrator = Get-VBRCredentials
$processing_settings = New-VBRSAPHANAProcessingOptions -Credentials $db_administrator -DeleteSourceLogs Keep -ArchiveLogBackupPeriod 15
$db_processing_options = New-VBRDatabaseProcessingOptions -BackupObject $group -SAPOnOracleProcessingOptions $processing_settings
$hana_options = New-VBRSAPHANAOptions -ParallelChannelsCount 3
$os_administrator = Get-VBRCredentials
$db_hana_administrator = Get-VBRCredentials
$hana_credentials = New-VBRSAPHANACredentialsOptions -SAPSystem SH4 -SSHCredentials $os_administrator -BackupCredentials $db_hana_administrator
Add-VBRApplicationBackupJob -BackupObject $group -BackupRepository $repository -Name "Backup Job" -Description "Daily backup of SAP systems" -BackupOptions $backup_options -EnableSchedule -ScheduleOptions $schedule_options -DatabaseProcessingOptions $db_processing_options -SAPHANAOptions $hana_options -SAPHANACredentialsOptions $hana_credentials
This example shows how to create the application backup policy for Veeam Plug-in for SAP HANA.

Perform the following steps:
1. Get a protection group and a backup repository:
- Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
- Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Define backup settings and backup schedule:
- Run the New-VBRApplicationBackupOptions cmdlet. Specify the FullBackupScheduleType, WeeklyScheduleType and the SelectedDays parameter values. Save the result to the $backup_options variable.
- Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek and the Period parameter values. Save the result to the $daily variable.
- Run the New-VBRApplicationScheduleOptions cmdlet. Specify the Type and the DailyOptions parameter values. Save the result to the $schedule_options variable.
3. Define processing and backup settings:
- Run the Get-VBRCredentials cmdlet. Save the result to the $db_administrator variable.
- Run the New-VBRSAPHANAProcessingOptions cmdlet. Specify the Credentials, DeleteSourceLogs and the ArchiveLogBackupPeriod parameter values. Save the result to the $processing_settings variable.
- Run the New-VBRDatabaseProcessingOptions cmdlet. Specify the DayOfWeek and the SAPOnOracleProcessingOptions parameter values. Save the result to the $db_processing_options variable.
- Run the New-VBRSAPHANAOptions cmdlet. Specify the ParallelChannelsCount parameter value. Save the result to the $hana_options variable.
4. Get SAP HANA credentials settings:
- Run the Get-VBRCredentials cmdlet. Save the result to the $os_administrator variable.
- Run the Get-VBRCredentials cmdlet. Save the result to the $db_hana_administrator variable.
- Run the New-VBRSAPHANACredentialsOptions cmdlet. Specify the SAPSystem, SSHCredentials and the BackupCredentials parameter values. Save the result to the $hana_credentials variable.
5. Run the Add-VBRApplicationBackupJob cmdlet. Specify the following settings:
- Set the $group variable as the BackupObject parameter value.
- Set the $repository variable as the BackupRepository parameter value.
- Specify the Name parameter value.
- Specify the Description parameter value.
- Set the $backup_options variable as the BackupOptions parameter value.
- Provide the EnableSchedule parameter.
- Set the $schedule_options variable as the ScheduleOptions parameter value.
- Set the $db_processing_options variable as the DatabaseProcessingOptions parameter value.
- Set the $hana_options variable as the SAPHANAOptions parameter value.
- Set the $hana_credentials variable as the SAPHANACredentialsOptions parameter value.

---

### Parameters
#### **BackupObject**
Specifies an array of discovered application entities: individual computers, databases, protection groups, and so on. The cmdlet will add these entities to the application backup policy. Accepts the Object[] object. To get this object, run the Get-VBRProtectionGroup cmdlet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|true    |named   |False        |

#### **BackupOptions**
Specifies backup settings for the application backup policy. Accepts the VBRApplicationBackupOptions object.  To define this object, run the New-VBRApplicationBackupOptions cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRApplicationBackupOptions]`|false   |named   |False        |

#### **BackupRepository**
Specifies the target backup location for the application backup policy. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **DatabaseProcessingOptions**
Specifies database processing settings for the application backup policy. Accepts the VBRDatabaseProcessingOptions[] object. To define this object, run the New-VBRDatabaseProcessingOptions cmdlet.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRDatabaseProcessingOptions[]]`|false   |named   |False        |

#### **Description**
Specifies the description of the application backup policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableSchedule**
Enables the option to schedule the application backup policy to run on a regular basis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name that you want to assign to the application backup policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NotificationOptions**
Specifies notification settings for the application backup policy. Accepts the VBRNotificationOptions object. To define this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OracleRMANOptions**
Note: This option works only for Veeam Plug-in for Oracle RMAN. Specifies the backup settings for Veeam Plug-in for Oracle RMAN. Accepts the VBROracleRMANOptions object.  To define this object, run the New-VBROracleRMANOptions cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBROracleRMANOptions]`|false   |named   |False        |

#### **OracleRMANStorageOptions**
Note: This option works only for Veeam Plug-in for Oracle RMAN. Specifies the storage options for Veeam Plug-in for Oracle RMAN. Accepts the VBROracleRMANStorageOptions object.  To define this object, run the New-VBROracleRMANStorageOptions cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBROracleRMANStorageOptions]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies the retention policy for backups created by Veeam Plug-in. Note: The retention policy specifies the number of restore points or a number of days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SAPHANACredentialsOptions**
Note: This option works only for Veeam Plug-in for SAP HANA. Specifies the credentials settings for Veeam Plug-in for SAP HANA. Accepts the VBRSAPHANACredentialsOptions[] object.  To define this object, run the New-VBRSAPHANAOptions cmdlet.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRSAPHANACredentialsOptions[]]`|false   |named   |False        |

#### **SAPHANAOptions**
Note: This option works only for Veeam Plug-in for SAP HANA. Specifies the backup settings for Veeam Plug-in for SAP HANA. Accepts the VBROracleRMANOptions object.  To define this object, run the New-VBRSAPHANAOptions cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRSAPHANAOptions]`|false   |named   |False        |

#### **SAPOnOracleMode**
Note: This option works only for Veeam Plug-in for SAP on Oracle. Specifies the backup mode for Veeam Plug-in for SAP on Oracle:
* RMAN: for BR*Tools with RMAN (rman_util mode).
* BACKINT: for BR*Tools with BACKINT (util_file_online mode).
Valid Values:

* RMAN
* BACKINT

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRSAPOnOracleMode]`|false   |named   |False        |

#### **SAPOnOracleOptions**
Note: This option works only for Veeam Plug-in for SAP on Oracle. Specifies the backup settings for Veeam Plug-in for SAP on Oracle. Accepts the VBRSAPOnOracleOptions object. To define this object, run the New-VBRSAPOnOracleOptions cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRSAPOnOracleOptions]`|false   |named   |False        |

#### **SAPOnOracleStorageOptions**
Note: This option works only for Veeam Plug-in for SAP on Oracle. Specifies the storage settings for Veeam Plug-in for SAP on Oracle. Accepts the VBRSAPOnOracleStorageOptions object. To define this object, run the New-VBRSAPOnOracleStorageOptions cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRSAPOnOracleStorageOptions]`|false   |named   |False        |

#### **ScheduleOptions**
Specifies the settings for the application backup policy schedule. Accepts the types returned by the following cmdlets:
* New-VBRServerScheduleType
* New-VBRApplicationScheduleOptions

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRApplicationScheduleOptions]`|false   |named   |False        |

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
Add-VBRApplicationBackupJob -BackupObject <Object[]> [-BackupOptions <VBRApplicationBackupOptions>] -BackupRepository <CBackupRepository> [-DatabaseProcessingOptions <VBRDatabaseProcessingOptions[]>] 
```
```PowerShell
[-Description <String>] [-EnableSchedule] [-Name <String>] [-NotificationOptions <VBRNotificationOptions>] [-OracleRMANOptions <VBROracleRMANOptions>] [-OracleRMANStorageOptions <VBROracleRMANStorageOptions>] 
```
```PowerShell
[-RetentionPolicy <Int32>] [-SAPHANACredentialsOptions <VBRSAPHANACredentialsOptions[]>] [-SAPHANAOptions <VBRSAPHANAOptions>] [-SAPOnOracleMode {RMAN | BACKINT}] [-SAPOnOracleOptions <VBRSAPOnOracleOptions>] 
```
```PowerShell
[-SAPOnOracleStorageOptions <VBRSAPOnOracleStorageOptions>] [-ScheduleOptions <VBRApplicationScheduleOptions>] [<CommonParameters>]
```
