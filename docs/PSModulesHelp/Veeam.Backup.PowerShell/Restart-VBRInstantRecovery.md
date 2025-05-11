Restart-VBRInstantRecovery
--------------------------

### Synopsis
Restarts a failed Hyper-V Instant Recovery session.

---

### Description

This cmdlet restarts a failed Hyper-V Instant Recovery session started with Start-VBRHvInstantRecovery.
Run Get-VBRInstantRecovery to get the status of the Instant Recovery session.

---

### Examples
> Example 1

Get-VBRInstantRecovery | Select -Last 1 | Restart-VBRInstantRecovery
This command restarts the last instant recovery session.

Perform the following steps:
1. Run the Get-VBRInstantRecovery cmdlet. Select the last instant recovery session.
2. Pipe the cmdlet output to the Restart-VBRInstantRecovery cmdlet.
> Example 2

$RecoverySession = Get-VBRInstantRecovery -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
Restart-VBRInstantRecovery -InstantRecovery $RecoverySession
This command restarts a specific instant recovery session.

Perform the following steps:
1. Run the Get-VBRInstantRecovery cmdlet. Specify the Id parameter value. Save the result to the $RecoverySession variable.
2. Run the Restart-VBRInstantRecovery cmdlet. Set the $RecoverySession variable as the InstantRecovery parameter value.

---

### Parameters
#### **InstantRecovery**
Specifies the array of the instant recovery sessions.
The cmdlet will restart these sessions.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[InstantRecovery[]]`|true    |0       |True (ByPropertyName, ByValue)|

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
Restart-VBRInstantRecovery [-InstantRecovery] <InstantRecovery[]> [<CommonParameters>]
```
