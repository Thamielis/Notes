Stop-VBRNASInstantRecovery
--------------------------

### Synopsis
Stops an instant restore of backups created by the file share backup job.

---

### Description

The cmdlet stops an instant restore of backups created by the file share backup job.

The process comprises the following steps:
1. Removing the shared folder.
2. Stopping the agents.
3. Updating information in the database.

---

### Related Links
* [Get-VBRNASInstantRecovery](Get-VBRNASInstantRecovery)

---

### Examples
> Stopping Instant Restore Session for NAS Backup

$nasInstantRecovery = Get-VBRNASInstantRecovery -NASBackupName "Daily SMB1 Backup" -NASServerName "ontap-2"
Stop-VBRNASInstantRecovery -InstantRecovery $nasInstantRecovery
This example shows how to stop the instant restore session for NAS backup.

Perform the following steps:
1. Run the Get-VBRNASInstantRecovery cmdlet. Specify the NASBackupName and NASServerName parameter values. Save the result to the $nasInstantRecovery variable.
2. Run the Stop-VBRNASInstantRecovery cmdlet. Set the $nasInstantRecovery variable as the InstantRecovery parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will immediately start the dismount procedure. If the parameter is not specified, the cmdlet will ask for the confirmation to start the dismount procedure for the instant restore session.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **InstantRecovery**
Specifies an array of instant restore sessions. The cmdlet will stop the instant recovery for each of the specified restore points. Accepts the VBRNASInstantRecovery object. To get this object, run the Get-VBRNASInstantRecovery cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRNASInstantRecovery]`|true    |0       |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Stop-VBRNASInstantRecovery [-InstantRecovery] <VBRNASInstantRecovery> [-Force] [-RunAsync] [<CommonParameters>]
```
