New-VBRNASInstantRecoveryMountOptions
-------------------------------------

### Synopsis
Creates a mapping configuration for instant restore of NAS backups.

---

### Description

This cmdlet creates a mapping configuration for instant restore of NAS backups.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredBackupRestorePoint](Get-VBRUnstructuredBackupRestorePoint)

---

### Examples
> Example 1. Creating Automatic Mount Options for Instant Restore of File Share Backup

```PowerShell
$automaticMapping = New-VBRNASInstantRecoveryMountOptions -Automatic
This command creates a set of automatic mount options for instant restore of file share backups.
```
> Example 2. Creating Manual Mount Options for Instant Restore of File Share Backup

$backup = Get-VBRUnstructuredBackup -Name "Daily SMB1 Backup"
$nasBackupPoint = Get-VBRUnstructuredBackupRestorePoint -NASBackup $backup
$manualMapping = New-VBRNASInstantRecoveryMountOptions -RestorePoint $nasBackupPoint[0] -MountServer "172.16.20.3"
This example shows how to create a set of manually configured mount options for instant restore of file share backups.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredBackupRestorePoint cmdlet. Set the $backup variable as the NASBackup parameter value. Save the result to the $nasBackupPoint variable.
3. Run the New-VBRNASInstantRecoveryMountOptions cmdlet. Specify the following parameters:
- Specify the first value from the array returned to the $nasBackupPoint variable as the RestorePoint parameter.
- Specify the MountServer parameter value.
- Save the result to the $manualMapping variable.

---

### Parameters
#### **Automatic**
Defines that the cmdlet will create a mapping configuration with automatically selecting a mount server to be used for instant restore of NAS backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **MountServer**
Specifies the target mount server. The cmdlet will create a mapping configuration with a specific host with the mount service to be used for instant restore of NAS backups. Accepts the CHost object.  To get this object, run the Get-VBRServer cmdlet.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|true    |named   |False        |

#### **RestorePoint**
Specifies an array of restore points. The cmdlet will create a mapping configuration for instant restore to the specified restore points. Accepts the VVBRUnstructuredBackupRestorePoint[] object.  To get this object, run the Get-VBRUnstructuredBackupRestorePoint cmdlet.

|Type                                   |Required|Position|PipelineInput                 |
|---------------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupRestorePoint[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackupRestorePoint[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNASInstantRecoveryMountOptions

---

### Notes

---

### Syntax
```PowerShell
New-VBRNASInstantRecoveryMountOptions -Automatic [<CommonParameters>]
```
```PowerShell
New-VBRNASInstantRecoveryMountOptions -MountServer <CHost[]> -RestorePoint <VBRUnstructuredBackupRestorePoint[]> [<CommonParameters>]
```
