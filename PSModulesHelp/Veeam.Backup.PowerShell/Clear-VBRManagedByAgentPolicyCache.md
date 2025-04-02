Clear-VBRManagedByAgentPolicyCache
----------------------------------

### Synopsis
Removes cache from the protected computers.

---

### Description

This cmdlet removes backup cache from protected computers.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

---

### Examples
> Removing Backup Cache from Protected Computers

$policy = Get-VBRComputerBackupJob -Name "WinSrv2049"
Clear-VBRManagedByAgentPolicyCache -Policy $policy
This example shows how to remove backup cache from protected computers that are processed by the WinSrv2049 Veeam Agent backup policy.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $policy variable.
2. Run the Clear-VBRManagedByAgentPolicyCache cmdlet. Set the $policy variable as the Policy parameter value.

---

### Parameters
#### **Policy**
Specifies a Veeam Agent backup policy. The cmdlet will remove backup cache from computers that are processed by this policy.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRComputerBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Clear-VBRManagedByAgentPolicyCache [-Policy] <VBRComputerBackupJob[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
