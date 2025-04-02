Get-VBRNASInstantRecoveryMigration
----------------------------------

### Synopsis
Returns active sessions of migration to production during the instant file share recovery.

---

### Description

This cmdlet returns active sessions of migration to production during the instant file share recovery.

---

### Related Links
* [Get-VBRNASInstantRecovery](Get-VBRNASInstantRecovery)

---

### Examples
> Example 1. Getting All Active Migration Sessions for Instant Restore for NAS Backup

$migrations = Get-VBRNASInstantRecoveryMigration
Write-Output "Get migration sessions of instant restore for NAS backups."
Write-Output $migrations
This example shows how to get all active migration sessions for instant restore for NAS backup sessions.

Perform the following steps:
1. Run the Get-VBRNASInstantRecoveryMigration cmdlet. Save the result to the $migrations variable.
2. Run the Write-Output cmdlet. Specify the output wording.
3. Run the Write-Output cmdlet. Provide the $migrations variable.
> Example 2. Getting Migration Sessios for Instant Restore for NAS Backup by IDs

$migrations = Get-VBRNASInstantRecoveryMigration -Id ("49664A5F-9C55-4A1F-8E6A-1CD5705A684B", "42696B53-6FEC-4148-9354-AA9E4B52DED9")
Write-Output "Get migration sessions of instant restore for NAS backups."
Write-Output $migrations
This example shows how to get migration to production sessions with certain IDs.

Perform the following steps:
1. Run the Get-VBRNASInstantRecoveryMigration cmdlet. Save the result to the $migrations variable.
2. Run the Write-Output cmdlet. Specify the output wording.
3. Run the Write-Output cmdlet. Provide the $migrations variable.
> Example 3. Getting Migration Sessions for Specified Instant Restore for NAS Backups Sessions

$nasInstantRecoveries = Get-VBRNASInstantRecovery
$migrations = Get-VBRNASInstantRecoveryMigration -InstantRecovery $nasInstantRecoveries
Write-Output "Get migration sessions of instant restore for NAS backups."
Write-Output $migrations
This example shows how to get migration to production sessions for certain instant restore sessions.

Perform the following steps:
1. Run the Get-VBRNASInstantRecoveryMigration cmdlet. Save the result to the $migrations variable.
2. Run the Get-VBRNASInstantRecoveryMigration cmdlet. Set the $nasInstantRecoveries variable as the InstantRecovery parameter value.
3. Run the Write-Output cmdlet. Specify the output wording.
4. Run the Write-Output cmdlet. Provide the $migrations variable.

---

### Parameters
#### **All**
Defines that the cmdlet will return all active sessions of migration to production for NAS instant recovery.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Id**
Specifies an array of IDs for migration sessions. The cmdlet will return sessions with these IDs. If the session with the specified ID is not found, the cmdlet will return an error.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

#### **InstantRecovery**
Specifies an array of instant recovery sessions with the started sessions of migration to production. Accepts the VBRNASInstantRecovery[] object. To get this object, run the Get-VBRNASInstantRecovery cmdlet.

|Type                       |Required|Position|PipelineInput        |
|---------------------------|--------|--------|---------------------|
|`[VBRNASInstantRecovery[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

Veeam.Backup.PowerShell.Infos.VBRNASInstantRecovery[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNASInstantRecoveryMigration

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNASInstantRecoveryMigration [-All] [<CommonParameters>]
```
```PowerShell
Get-VBRNASInstantRecoveryMigration [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRNASInstantRecoveryMigration [-InstantRecovery <VBRNASInstantRecovery[]>] [<CommonParameters>]
```
