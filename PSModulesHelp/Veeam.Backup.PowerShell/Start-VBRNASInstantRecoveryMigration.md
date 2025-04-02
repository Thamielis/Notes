Start-VBRNASInstantRecoveryMigration
------------------------------------

### Synopsis
Starts migration to production for the running instant file share recovery session.

---

### Description

This cmdlet starts migration to production for the running instant file share recovery session. It supports migration to the original or different location.

---

### Related Links
* [Get-VBRNASInstantRecovery](Get-VBRNASInstantRecovery)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

* [New-VBRNASInstantRecoveryMigrationSwitchOverOptions](New-VBRNASInstantRecoveryMigrationSwitchOverOptions)

---

### Examples
> Example 1. Starting File Share Migration to Original Location

$nasInstantRecovery = Get-VBRNASInstantRecovery -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
$switchover = New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Auto
Write-Output "Start File Share Migration."
Write-Output $nasInstantRecovery
Start-VBRNASInstantRecoveryMigration -InstantRecovery $nasInstantRecovery -SwitchOverOptions $switchover
This command starts the file share migration to the original location. Perform the following steps:
1. Run the Get-VBRNASInstantRecovery cmdlet. Specify the Id parameter value. Save the result to the $nasInstantRecovery variable.
2. Run the New-VBRNASInstantRecoveryMigrationSwitchOverOptions cmdlet. Specify the Auto parameter. Save the result to the $switchover variable.
3. Run the Write-Output cmdlet. Specify the output wording.
4. Run the Write-Output cmdlet. Provide the $nasInstantRecovery variable.
5. Run the Start-VBRNASInstantRecoveryMigration cmdlet. Set the $nasInstantRecovery variable as the InstantRecovery parameter value and the $switchover variable as the SwitchOverOptions parameter value.
> Example 2. Starting File Share Migration to Different Location

$nasInstantRecovery = Get-VBRNASInstantRecovery -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
$nasServer = Sync-VBRUnstructuredBackupState -Name "\\server\original_folder"
$switchover = New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Auto
Write-Output "Start File Share Migration."
Write-Output $nasInstantRecovery
Start-VBRNASInstantRecoveryMigration -InstantRecovery $nasInstantRecovery -NASServer $nasServer -Path "\\server\original_folder\new_folder" -SwitchOverOptions $switchover
This command starts the file share migration to the original location.
Perform the following steps:
1. Run the Get-VBRNASInstantRecovery cmdlet. Specify the Id parameter value. Save the result to the $nasInstantRecovery variable.
2. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter. Save the result to the $nasServer variable.
3. Run the New-VBRNASInstantRecoveryMigrationSwitchOverOptions cmdlet. Specify the Auto parameter. Save the result to the $switchover variable.
4. Run the Write-Output cmdlet. Specify the output wording.
5. Run the Write-Output cmdlet. Provide the $nasInstantRecovery variable.
6. Run the Start-VBRNASInstantRecoveryMigration cmdlet. Specify the following settings:
- Set the $nasInstantRecovery variable as the InstantRecovery parameter value.
- Set the $nasServer variable as the NASServer parameter value.
- Specify the Path parameter value.
- Set the $switchover variable as the SwitchOverOptions parameter value.

---

### Parameters
#### **InstantRecovery**
Specifies an instant recovery session. The cmdlet will start migration to production for this session.
Accepts the VBRNASInstantRecovery object. To get this object, run the Get-VBRNASInstantRecovery cmdlet.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRNASInstantRecovery]`|true    |0       |True (ByPropertyName, ByValue)|

#### **NASServer**
Specifies a server where the mounted file share will be migrated to production.
This parameter is specified for the migration to a different location type.
Accepts the VBRUnstructuredServer object. To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRUnstructuredServer]`|true    |1       |False        |

#### **Path**
Specifies a path at the NASServer where the mounted file share will be migrated to production.
This parameter is specified for the migration to a different location type.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **ReplaceAll**
Enables the Replace All option.
If you provide this parameter, the cmdlet will restore the whole file share and overwrite the existing files with the restored files.
Otherwise, the cmdlet will overwrite the existing files only if they are older than the restored files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines  that the command returns immediately without waiting for the task to complete.
Note: If the switchover is started with option Manual or Scheduled, the cmdlet will wait endlessly or for a long time. Before starting waiting, the cmdlet will display a warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SwitchOverOptions**
Specifies switchover options for the specified instant recovery session. The cmdlet will start migration to production for the session with the specified switchover options.
Accepts the VBRNASInstantRecoveryMigrationSwitchOverOptions object. To create this object, run the New-VBRNASInstantRecoveryMigrationSwitchOverOptions cmdlet.

|Type                                               |Required|Position|PipelineInput |
|---------------------------------------------------|--------|--------|--------------|
|`[VBRNASInstantRecoveryMigrationSwitchOverOptions]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASInstantRecovery

Veeam.Backup.PowerShell.Infos.VBRNASInstantRecoveryMigrationSwitchOverOptions

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNASInstantRecoveryMigration

---

### Notes

---

### Syntax
```PowerShell
Start-VBRNASInstantRecoveryMigration [-InstantRecovery] <VBRNASInstantRecovery> [-NASServer] <VBRUnstructuredServer> [-Path] <String> [-ReplaceAll] [-RunAsync] -SwitchOverOptions 
```
```PowerShell
<VBRNASInstantRecoveryMigrationSwitchOverOptions> [<CommonParameters>]
```
