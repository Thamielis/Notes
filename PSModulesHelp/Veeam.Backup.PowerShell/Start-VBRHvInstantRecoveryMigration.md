Start-VBRHvInstantRecoveryMigration
-----------------------------------

### Synopsis
Performs migration of instantly recovered VMs to a Hyper-V host.

---

### Description

This cmdlet migrates a recovered VM to the production host. You finalize the instant recovery of the VM initiated with the Start-VBRHvInstantRecovery cmdlet by migrating the VM to production.
Run the Stop-VBRInstantRecovery cmdelt to terminate the recovery session by unpublishing the VM.

---

### Related Links
* [get-help Start-VBRHvInstantRecovery](get-help Start-VBRHvInstantRecovery)

* [get-help Stop-VBRInstantRecovery](get-help Stop-VBRInstantRecovery)

---

### Examples
> Example 1

Get-VBRInstantRecovery | Start-VBRHvInstantRecoveryMigration
This example shows how to finalize the current instant recovery session.

Perform the following steps:
1. Run the Get-VBRInstantRecovery cmdlet.
2. Pipe the cmdlet output to the Start-VBRHvInstantRecoveryMigration cmdlet.
> Example 2

$HvInstantRecovery = Get-VBRInstantRecovery
Start-VBRHvInstantRecoveryMigration -InstantRecovery $HvInstantRecovery
This example shows how to finalize the current instant recovery session.

Perform the following steps:
1. Run the Get-VBRInstantRecovery cmdlet. Save the result to the $HvInstantRecovery variable.
2. Run the Start-VBRHvInstantRecoveryMigration cmdlet. Set the $HvInstantRecovery variable as the InstantRecovery parameter value.

---

### Parameters
#### **InstantRecovery**
Specifies the array of instant recovery sessions.
The cmdlet will migrate the VMs recovered with these sessions to the Hyper-V host.

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
Start-VBRHvInstantRecoveryMigration [-InstantRecovery] <InstantRecovery[]> [<CommonParameters>]
```
