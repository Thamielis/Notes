Get-VBRInstantRecoveryMigration
-------------------------------

### Synopsis
Returns running migration sessions launched during Instant Recovery.

---

### Description

This cmdlet returns migration sessions launched during Instant Recovery (including Instant Recovery for first class disks, file shares and so on) and running at the moment.
If you do not specify cmdlet parameters, the cmdlet will return all running migration sessions launched during Instant Recovery.

---

### Examples
> Example 1

$nasInstantRecovery = Get-VBRNASInstantRecovery -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
$session = Start-VBRNASInstantRecoveryMigration -InstantRecovery $nasInstantRecovery
$migrationsession = Get-VBRInstantRecoveryMigration -Id $session.Id
This example shows how to get the migration session.

Perform the following steps:
1. Run the Get-VBRNASInstantRecovery cmdlet. Specify the Id parameter value. Save the result to the $nasInstantRecovery variable.
2. Run the Start-VBRNASInstantRecoveryMigration cmdlet. Set the $nasInstantRecovery variable as the InstantRecovery parameter value. Save the result to the $session variable.
3. Run the Get-VBRInstantRecoveryMigration cmdlet. Set the Id property of the $session variable as the Id parameter value. Save the result to the $migrationsession variable.

---

### Parameters
#### **Id**
Specifies IDs of migration sessions that you want to return.
Tip: You can find the session ID in an object returned by the cmdlet that launched the migration session.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.InstantRecoveryMigration[]

---

### Notes

---

### Syntax
```PowerShell
Get-VBRInstantRecoveryMigration [-Id <Guid[]>] [<CommonParameters>]
```
