New-VBRNASInstantRecoveryMigrationSwitchOverOptions
---------------------------------------------------

### Synopsis
Defines the switchover parameter that can be used when starting the file share migration session or for changing settings of an already running file share migration session.

---

### Description

This cmdlet defines the switchover parameter that can be used when starting the file share migration session or for changing settings of an already running file share migration session. You can use this cmdlet to define settings for performing a switchover in the automatic, manual or scheduled mode.

---

### Related Links
* [Switch-VBRNASInstantRecoveryMigration](Switch-VBRNASInstantRecoveryMigration)

---

### Examples
> Example 1. Creating Automatic Switchover Options for Migration of Instant Restore for NAS Backups

$switchover = New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Auto
Write-Output "Create automatic options for migration of instant restore for NAS backups."
Write-Output $switchover
This example shows how to define settings for performing a switchover in the automatic mode.

Perform the following steps:
1. Run the New-VBRNASInstantRecoveryMigrationSwitchOverOptions cmdlet. Provide the Auto parameter. Save the result to the $switchover variable.
2. Run the Write-Output cmdlet. Specify the output wording.
3. Run the Write-Output cmdlet. Provide the $switchover variable.
> Example 2. Creating Manual Switchover Options for Migration of Instant Restore for NAS Backups

$switchover = New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Manual
Write-Output "Create manual options for migration of instant restore for NAS backups."
Write-Output $switchover
This example shows how to define settings for performing a switchover in the automatic mode.

Perform the following steps:
1. Run the New-VBRNASInstantRecoveryMigrationSwitchOverOptions cmdlet. Provide the Manual parameter. Save the result to the $switchover variable.
2. Run the Write-Output cmdlet. Specify the output wording.
3. Run the Write-Output cmdlet. Provide the $switchover variable.
> Example 3. Creating Scheduled Switchover Options for Migration of Instant Restore for NAS Backups

$switchover = New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Scheduled -SwitchingTimeUtc "2020-11-24 13:00:00"
Write-Output "Create scheduled options for migration of instant restore for NAS backups."
Write-Output $switchover
This example shows how to define settings for performing a switchover in the scheduled mode.

Perform the following steps:
1. Run the New-VBRNASInstantRecoveryMigrationSwitchOverOptions cmdlet. Provide the Scheduled parameter. Specify the SwitchingTimeUtc parameter value. Save the result to the $switchover variable.
2. Run the Write-Output cmdlet. Specify the output wording.
3. Run the Write-Output cmdlet. Provide the $switchover variable.

---

### Parameters
#### **Auto**
Defines that the switchover will be performed in the Automatic mode.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Manual**
Defines that the switchover will be performed in the Manual mode.
Use the Switch-VBRNASInstantRecoveryMigration cmdlet to start the switchover in the Manual mode.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Scheduled**
Defines that the switchover will be performed in the Scheduled mode.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **SwitchingTimeUtc**
For the Scheduled switchover option, specifies data and time when the switchover will take place.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNASInstantRecoveryMigrationSwitchOverOptions

---

### Notes

---

### Syntax
```PowerShell
New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Auto [<CommonParameters>]
```
```PowerShell
New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Manual [<CommonParameters>]
```
```PowerShell
New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Scheduled -SwitchingTimeUtc <DateTime> [<CommonParameters>]
```
