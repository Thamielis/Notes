Stop-VBRInstantRecoveryMigration
--------------------------------

### Synopsis
Stops running migration sessions launched during Instant Recovery.

---

### Description

This cmdlet stops migration sessions launched during Instant Recovery (including Instant Recovery for first class disks, file shares and so on).

---

### Related Links
* [Get-VBRInstantRecoveryMigration](Get-VBRInstantRecoveryMigration)

---

### Examples
> Example 1

$session = Get-VBRInstantRecoveryMigration
Stop-VBRInstantRecoveryMigration -Migration $session[3]
This example shows how to stop a running migration session launched during Instant Recovery.

Perform the following steps:
1. Run the Get-VBRInstantRecoveryMigration cmdlet. Save the result to the $session variable.
The Get-VBRInstantRecoveryMigration cmdlet will return an array of migration sessions. Mind the ordinal number of the necessary migration session (in our example, it is the fourth migration session in the array).
2. Run the Stop-VBRInstantRecoveryMigration cmdlet. Set the $session[3] variable as the Migration parameter value.

---

### Parameters
#### **Migration**
Specifies an array of IDs of the migration sessions that you want to stop.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[InstantRecoveryMigration[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.InstantRecoveryMigration[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRInstantRecoveryMigration [-Migration] <InstantRecoveryMigration[]> [-RunAsync] [<CommonParameters>]
```
