Set-VBRApplicationBackupJob
---------------------------

### Synopsis
Modifies application backup policies.

---

### Description

This cmdlet modifies settings of application backup policies. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

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

* [Add-VBRApplicationBackupJob](Add-VBRApplicationBackupJob)

---

### Examples
> Example - Modifying SAP HANA Backup Settings for Application Backup Policy

$policy = Get-VBRApplicationBackupJob -Name "Plugin Policy 05"
$hana_options = New-VBRSAPHANAOptions -ParallelChannelsCount 5
Set-VBRApplicationBackupJob -Job $policy -SAPHANAOptions $hana_options
This example shows how to modify the number of data processing channels that can be assigned to the Plugin Policy 05 application backup policy.

Perform the following steps:
1. Run the Get-VBRApplicationBackupJob cmdlet. Specify the Name parameter value. Save the result to the $policy variable.
2. Run the New-VBRSAPHANAOptions cmdlet. Specify the ParallelChannelsCount parameter value. Save the result to the $hana_options variable.
3. Run the Set-VBRApplicationBackupJob cmdlet. Set the $policy variable as the Job parameter value. Set the $hana_options variable as the SAPHANAOptions parameter value.

---

### Parameters
#### **BackupObject**
Specifies an array of protection groups and discovered computers that you want to add to the application backup policy. Accepts the Object[] object.  To get this object, run the Get-VBRProtectionGroup cmdlet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |False        |

#### **BackupOptions**
Specifies backup settings for the application backup policy. Accepts the VBRApplicationBackupOptions object.  To define this object, run the New-VBRApplicationBackupOptions cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRApplicationBackupOptions]`|false   |named   |False        |

#### **BackupRepository**
Specifies the target backup location for the application backup policy. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

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

#### **EnableRetentionPolicy**
Enables retention policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSchedule**
Enables the option to schedule the application backup policy to run on a regular basis.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the application backup policy that you want to modify. Accepts the VBRApplicationBackupJob object.  To get this object, run the Get-VBRApplicationBackupJob group cmdlet.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRApplicationBackupJob]`|true    |named   |True (ByValue)|

#### **NotificationOptions**
Specifies notification settings for the application backup policy. Accepts the VBRNotificationOptions object. To define this object, run the New-VBRNotificationOptions cmdlet.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRNotificationOptions]`|false   |named   |False        |

#### **OracleRMANOptions**
Note: This option works only for Veeam Plug-in for Oracle RMAN. Specifies the backup settings for Veeam Plug-in for Oracle RMAN Accepts the VBROracleRMANOptions object.  To define this object, run the New-VBROracleRMANOptions cmdlet.

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
Specifies the settings for the application backup policy schedule. Accepts the objects returned by the following cmdlets:
* New-VBRServerScheduleType
* New-VBRApplicationScheduleOptions

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRApplicationScheduleOptions]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRApplicationBackupJob

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRApplicationBackupJob [-BackupObject <Object[]>] [-BackupOptions <VBRApplicationBackupOptions>] [-BackupRepository <CBackupRepository>] [-DatabaseProcessingOptions <VBRDatabaseProcessingOptions[]>] 
```
```PowerShell
[-Description <String>] [-EnableRetentionPolicy] [-EnableSchedule] -Job <VBRApplicationBackupJob> [-NotificationOptions <VBRNotificationOptions>] [-OracleRMANOptions <VBROracleRMANOptions>] 
```
```PowerShell
[-OracleRMANStorageOptions <VBROracleRMANStorageOptions>] [-RetentionPolicy <Int32>] [-SAPHANACredentialsOptions <VBRSAPHANACredentialsOptions[]>] [-SAPHANAOptions <VBRSAPHANAOptions>] [-SAPOnOracleMode {RMAN | 
```
```PowerShell
BACKINT}] [-SAPOnOracleOptions <VBRSAPOnOracleOptions>] [-SAPOnOracleStorageOptions <VBRSAPOnOracleStorageOptions>] [-ScheduleOptions <VBRApplicationScheduleOptions>] [<CommonParameters>]
```
