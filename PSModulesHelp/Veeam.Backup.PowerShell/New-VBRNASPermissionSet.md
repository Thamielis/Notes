New-VBRNASPermissionSet
-----------------------

### Synopsis
Creates a permission set for instant restore of file share backups that will be used if the file share backup does not contain security information.

---

### Description

The cmdlet creates a permission set for instant restore of file share backups that will be used if the file share backup does not contain security information.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

---

### Examples
> Example 1. Creating Permission Set to Deny Access to SMB Share to Everyone Except Owner

$backup = Get-VBRUnstructuredBackup -Name "Daily SMB1 Backup"
$nasBackupPoint = Get-VBRUnstructuredBackupRestorePoint -NASBackup $backup
$permissions = New-VBRNASPermissionSet -RestorePoint $nasBackupPoint[0] -Owner "User 1" -DenyEveryone
The following request creates a permission set that denies access to the published SMB share to everyone except its owner.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Set the $backup variable as the NASBackup parameter value. Save the result to the $nasBackupPoint variable.
3. Run the New-VBRNASPermissionSet cmdlet. Specify the following parameters:
- Specify the first value from the array returned to the $nasBackupPoint variable as the RestorePoint parameter.
- Specify the Owner parameter value.
- Provide the DenyEveryone parameter.
- Save the result to the $permissions variable.
> Example 2. Creating Permission Set to Allow Access to SMB Share to Everyone

$backup = Get-VBRUnstructuredBackup -Name "Daily SMB1 Backup"
$nasBackupPoint = Get-VBRUnstructuredBackupRestorePoint -NASBackup $backup
$permissions = New-VBRNASPermissionSet -RestorePoint $nasBackupPoint[0] -Owner "User 1" -AllowEveryone
The following request creates a permission set that allows access to the published SMB share to everyone.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Set the $backup variable as the NASBackup parameter value. Save the result to the $nasBackupPoint variable.
3. Run the New-VBRNASPermissionSet cmdlet. Specify the following parameters:
- Specify the first value from the array returned to the $nasBackupPoint variable as the RestorePoint parameter.
- Specify the Owner parameter value.
- Provide the AllowEveryone parameter.
- Save the result to the $permissions variable.
> Example 3. Creating Permission Set to Allow Access to SMB Share to Selected Users

$backup = Get-VBRUnstructuredBackup -Name "Daily SMB1 Backup"
$nasBackupPoint = Get-VBRUnstructuredBackupRestorePoint -NASBackup $backup
$permissions = New-VBRNASPermissionSet -RestorePoint $nasBackupPoint[0] -Owner "User 1" -AllowSelected -PermissionScope ("domain\user 2")
The following request creates a permission set that allows access to the published SMB share to selected users.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Set the $backup variable as the NASBackup parameter value. Save the result to the $nasBackupPoint variable.
3. Run the New-VBRNASPermissionSet cmdlet. Specify the following parameters:
- Specify the first value from the array returned to the $nasBackupPoint variable as the RestorePoint parameter.
- Specify the Owner parameter value.
- Provide the AllowSelected parameter.
- Specify the PermissionScope parameter.
- Save the result to the $permissions variable.

---

### Parameters
#### **AllowEveryone**
Defines that the permission set will allow access to the published SMB share to everyone. Note: If the DenyEveryone, AllowSelected, or AllowEveryone parameter is specified, the cmdlet will use the AllowEveryone parameter by default.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AllowSelected**
Defines that the permission set will allow access to the published SMB share to the limited number of users specified in the PermissionScope parameter. This parameter must be specified together with the PermissionScope parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **DenyEveryone**
Defines that the permission set will deny access to the published SMB share to everyone except its owner.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Owner**
Specifies a name of the account or group in the username or domain\username format. The cmdlet will use this parameter if the file share backup does not contain security information.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |False        |

#### **PermissionScope**
Specifies an array of users. The cmdlet will provide these users with the access to the published SMB share. This parameter must be specified together with the AllowSelected parameter.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **RestorePoint**
Specifies an array of restore points. The cmdlet will create a permission set with specific security settings for each of the specified restore points.  Accepts the VBRNASBackupRestorePoint object. To get this object, run the Get-VBRUnstructuredBackupRestorePoint cmdlet.

|Type                                   |Required|Position|PipelineInput                 |
|---------------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupRestorePoint[]]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackupRestorePoint[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNASPermissionSet[]

---

### Notes

---

### Syntax
```PowerShell
New-VBRNASPermissionSet [-RestorePoint] <VBRUnstructuredBackupRestorePoint[]> [-Owner] <String> [-AllowEveryone] [<CommonParameters>]
```
```PowerShell
New-VBRNASPermissionSet [-RestorePoint] <VBRUnstructuredBackupRestorePoint[]> [-Owner] <String> -AllowSelected -PermissionScope <String[]> [<CommonParameters>]
```
```PowerShell
New-VBRNASPermissionSet [-RestorePoint] <VBRUnstructuredBackupRestorePoint[]> [-Owner] <String> -DenyEveryone [<CommonParameters>]
```
