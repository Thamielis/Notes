Switch-VBRNASInstantRecoveryMigration
-------------------------------------

### Synopsis
Starts the manual switchover for completing the migration to production after you perform the instant file share recovery.

---

### Description

This cmdlet starts the manual switchover for completing the migration to production after you perform the instant file share recovery.

During migration to production, Veeam Backup & Replication moves to the production site not only content of the initial file share, but also incremental changes made by users in the mounted file share. When incremental changes are being moved, the mounted share is not available to users. This stage is called a switchover. The switchover may take some time, so ensure you properly plan when it is performed.

---

### Related Links
* [Get-VBRNASInstantRecoveryMigration](Get-VBRNASInstantRecoveryMigration)

---

### Examples
> Example - Starting Manual Switchover

$nasInstantRecovery = Get-VBRNASInstantRecovery -Id "42696B53-6FEC-4148-9354-AA9E4B52DED9"
$migration = Get-VBRNASInstantRecoveryMigration -InstantRecovery $nasInstantRecovery
Write-Output "Start manual switchover for migration sessions of instant restore for NAS backups."
Switch-VBRNASInstantRecoveryMigration -InstantRecoveryMigration $migration
This example shows how to start the manual switchover for completing the migration to production during the instant file share recovery session with the certain ID.

Perform the following steps:
1. Run the Get-VBRNASInstantRecovery cmdlet. Specify the Id parameter. Save the result to the $nasInstantRecovery variable.
2. Run the Get-VBRNASInstantRecoveryMigration cmdlet. Specify the InstantRecovery parameter. Save the result to the $migration variable.
3. Run the Write-Output cmdlet. Specify the output wording.
4. Run the Switch-VBRNASInstantRecoveryMigration cmdlet. Set the $migration as the InstantRecoveryMigration parameter value.

---

### Parameters
#### **InstantRecoveryMigration**
Specifies an instant recovery migration session. Accepts the VBRNASInstantRecoveryMigration object. To get this object, run the Get-VBRNASInstantRecoveryMigration cmdlet.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRNASInstantRecoveryMigration]`|true    |0       |False        |

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
Switch-VBRNASInstantRecoveryMigration [-InstantRecoveryMigration] <VBRNASInstantRecoveryMigration> [<CommonParameters>]
```
