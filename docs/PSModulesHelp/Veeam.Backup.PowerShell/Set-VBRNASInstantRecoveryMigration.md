Set-VBRNASInstantRecoveryMigration
----------------------------------

### Synopsis
Modifies switchover parameters for the specified session of migration to production during the instant file share recovery.

---

### Description

This cmdlet modifies switchover parameters for the specified session of migration to production during the instant file share recovery.

---

### Related Links
* [Get-VBRNASInstantRecovery](Get-VBRNASInstantRecovery)

* [Get-VBRNASInstantRecoveryMigration](Get-VBRNASInstantRecoveryMigration)

* [New-VBRNASInstantRecoveryMigrationSwitchOverOptions](New-VBRNASInstantRecoveryMigrationSwitchOverOptions)

---

### Examples
> Example 1

$nasInstantRecovery = Get-VBRNASInstantRecovery -Id "42696B53-6FEC-4148-9354-AA9E4B52DED9"
$migration = Get-VBRNASInstantRecoveryMigration -InstantRecovery $nasInstantRecovery
$switchover = New-VBRNASInstantRecoveryMigrationSwitchOverOptions -Scheduled -SwitchingTimeUtc "2020-11-24 13:00:00"
Set-VBRNASInstantRecoveryMigration -InstantRecoveryMigration $migration -SwitchOverOptions $switchover
Write-Output "Set new switchover for migration sessions of instant restore for NAS backups."
This example shows how to set new switchover options for migration session Instant Restore for NAS Backups.

Perform the following steps:
1. Run the Get-VBRNASInstantRecovery cmdlet. Specify the Id parameter value. Save the result to the $nasInstantRecovery variable.
2. Run the Get-VBRNASInstantRecoveryMigration cmdlet. Set the $nasInstantRecovery variable as the InstantRecovery parameter value. Save the result to the $migration variable.
3. Run the New-VBRNASInstantRecoveryMigrationSwitchOverOptions cmdlet. Provide the Scheduled parameter. Specify the SwitchingTimeUtc parameter value. Save the result to the $switchover variable.
4. Run the Set-VBRNASInstantRecoveryMigration cmdlet. Set the $migration variable as the InstantRecoveryMigration parameter value. Set the $switchover variable as the SwitchOverOptions parameter value.

---

### Parameters
#### **InstantRecoveryMigration**
Specifies an active session of migration to production during the instant file share recovery. Accepts the VBRNASInstantRecoveryMigration object. To get this object, run the Get-VBRNASInstantRecoveryMigration cmdlet.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRNASInstantRecoveryMigration]`|true    |0       |False        |

#### **SwitchOverOptions**
Defines new switchover options for the specified session of migration to production during the instant file share recovery. Accepts the VBRNASInstantRecoveryMigrationSwitchOverOptions object. To create this object, run the New-VBRNASInstantRecoveryMigrationSwitchOverOptions cmdlet.

|Type                                               |Required|Position|PipelineInput|
|---------------------------------------------------|--------|--------|-------------|
|`[VBRNASInstantRecoveryMigrationSwitchOverOptions]`|true    |1       |False        |

---

### Inputs
None

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRNASInstantRecoveryMigration [-InstantRecoveryMigration] <VBRNASInstantRecoveryMigration> [-SwitchOverOptions] <VBRNASInstantRecoveryMigrationSwitchOverOptions> [<CommonParameters>]
```
