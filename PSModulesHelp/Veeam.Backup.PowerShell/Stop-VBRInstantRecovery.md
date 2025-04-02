Stop-VBRInstantRecovery
-----------------------

### Synopsis
Stops running Instant Recovery sessions.

---

### Description

This cmdlet stops publishing a workload within Instant Recovery processes (including Instant Recovery for first class disks, file shares and so on).
With instant recovery technology, Veeam Backup & Replication starts a workload directly from a backup, incremental or full, without copying it to production storage. You need to finalize the successful instant recovery by either migrating the recovered workload to production or by stopping publishing the recovered workload.

---

### Examples
> Example 1

Get-VBRInstantRecovery | Select -Last 1 | Stop-VBRInstantRecovery
This command stops the last instant recovery session. The needed session object is obtained with Get-VBRInstantRecovery, selected by order and piped down.

Perform the following steps:
1. Run the Get-VBRInstantRecovery cmdlet. Select the last instant recovery session.
2. Pipe the cmdlet output to the Stop-VBRInstantRecovery cmdlet.
> Example 2

$RecoverySession = Get-VBRInstantRecovery -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
Stop-VBRInstantRecovery -InstantRecovery $RecoverySession
Perform the following steps:
1. Run the Get-VBRInstantRecovery cmdlet. Specify the Id parameter value. Save the result to the $RecoverySession variable.
2. Run the Stop-VBRInstantRecovery cmdlet. Set the $RecoverySession variable as the InstantRecovery parameter value.

---

### Parameters
#### **InstantRecovery**
Specifies the running instant VM recovery process that you want to stop.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[InstantRecovery[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.InstantRecovery[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRInstantRecovery [-InstantRecovery] <InstantRecovery[]> [-RunAsync] [<CommonParameters>]
```
