Start-VBRNASInstantRecovery
---------------------------

### Synopsis
Starts an instant restore of backups created by the file share backup job.

---

### Description

This cmdlet starts an instant restore of backups created by the file share backup job. It starts agents, creates a file share on the specified repository (the file share name is retrieved from the file share backup) and creates records in the database.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

* [New-VBRNASPermissionSet](New-VBRNASPermissionSet)

* [New-VBRNASInstantRecoveryMountOptions](New-VBRNASInstantRecoveryMountOptions)

---

### Examples
> Example 1. Starting Instant Restore for NAS Backups with Automatic Mapping

$backup = Get-VBRUnstructuredBackup -Name "Daily SMB1 Backup"
$nasBackupPoint = Get-VBRUnstructuredBackupRestorePoint -NASBackup $backup
$permissions = New-VBRNASPermissionSet -RestorePoint $nasBackupPoint[0] -Owner "User 1" -AllowEveryone
Start-VBRNASInstantRecovery -RestorePoint $nasBackupPoint[0] -Permissions $permissions -Reason "Test instant restore for NAS"
The following example shows how to start instant restore for NAS backups with automatic mapping.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Set the $backup variable as the NASBackup parameter value. Save the result to the $nasBackupPoint variable.
3. Run the New-VBRNASPermissionSet cmdlet. Specify the RestorePoint, Owner and AllowEveryone parameter values.
4. Run the Start-VBRNASInstantRecovery cmdlet. Specify the following parameters:
- Specify the first value from the array returned to the $nasBackupPoint variable as the RestorePoint parameter.
- Set the $permissions variable as the Permissions parameter value.
- Specify the Reason parameter.
> Example 2. Starting Instant Restore for NAS Backups with Manual Mapping

$backup = Get-VBRUnstructuredBackup -Name "Daily SMB1 Backup"
$nasBackupPoint = Get-VBRUnstructuredBackupRestorePoint -NASBackup $backup
$permissions = New-VBRNASPermissionSet -RestorePoint $nasBackupPoint[0] -Owner "User 1" -AllowEveryone
$manualMapping = New-VBRNASInstantRecoveryMountOptions -RestorePoint $nasBackupPoint[0] -MountServer "172.16.20.3"
Start-VBRNASInstantRecovery -RestorePoint $nasBackupPoint[0] -Permissions $permissions -MountOptions $manualMapping -Reason "Test instant restore for NAS"
The following example shows how to start instant restore for NAS backups with manual mapping.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Set the $backup variable as the NASBackup parameter value. Save the result to the $nasBackupPoint variable.
3. Run the New-VBRNASPermissionSet cmdlet. Specify the RestorePoint, Owner and AllowEveryone parameter values.
4. Run the New-VBRNASInstantRecoveryMountOptions cmdlet. Specify the RestorePoint and MountServer parameter values.
5. Run the Start-VBRNASInstantRecovery cmdlet. Specify the following parameters:
- Specify the first value from the array returned to the $nasBackupPoint variable as the RestorePoint parameter.
- Set the $permissions variable as the Permissions parameter value.
- Set the $manualMapping variable as the MountOptions parameter value.
- Specify the Reason parameter.

---

### Parameters
#### **MountOptions**
Specifies a mapping configuration for instant restore of NAS backups. If the parameter is not defined, the cmdlet will use automatic mapping. Accepts the VBRNASInstantRecoveryMountOptions object. To create this object, run the New-VBRNASInstantRecoveryMountOptions cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRNASInstantRecoveryMountOptions]`|false   |2       |False        |

#### **Permissions**
Specifies an array of permission sets. The cmdlet will start an instant recovery by applying these permission sets. Accepts the VBRNASPermissionSet[] object. To create this object, run the New-VBRNASPermissionSet cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRNASPermissionSet[]]`|false   |1       |False        |

#### **Reason**
Specifies the reason for starting the instant restore of NAS backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies an array of restore points. The cmdlet will start an instant recovery for each of the specified restore points. Accepts the VBRUnstructuredBackupRestorePoint[] object. To get this object, run the Get-VBRUnstructuredBackupRestorePoint cmdlet.

|Type                                   |Required|Position|PipelineInput                 |
|---------------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupRestorePoint[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WaitAllSessions**
If the parameter is set to True, the cmdlet will wait for all sessions to finish before returning the result. In this case, the result is sorted according to the order in which restore points are specified. Sessions are also started in this order. If the parameter is set to False, the cmdlet will return the result after each session finishes. In this case, the result is returned in nondeterministic order. Note: This parameter is used with the RunAsync parameter that must be set to False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackupRestorePoint[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNASInstantRecovery[]

---

### Notes

---

### Syntax
```PowerShell
Start-VBRNASInstantRecovery [-RestorePoint] <VBRUnstructuredBackupRestorePoint[]> [[-Permissions] <VBRNASPermissionSet[]>] [[-MountOptions] <VBRNASInstantRecoveryMountOptions>] [-Reason <String>] [-RunAsync] 
```
```PowerShell
[-WaitAllSessions] [<CommonParameters>]
```
