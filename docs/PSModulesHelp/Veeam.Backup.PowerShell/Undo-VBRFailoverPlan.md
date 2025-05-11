Undo-VBRFailoverPlan
--------------------

### Synopsis
Undoes the failover by failover plan.

---

### Description

This cmdlet undoes the failover process. Undoing failover switches the workload back to source VMs. All changes that were made to the replicas during failover are discarded.
To switch back to the production VM and synchronize the changes made to the replica while failover, start failback process. Run the Start-VBRViReplicaFailback or the Start-VBRHvReplicaFailback cmdlet to fail back to the VMware or Hyper-V production VM. Note that failback is not a group process and must be performed for each VM individually.

---

### Examples
> Example 1

Get-VBRFailoverPlan -Name "MS Exchange Group Failover" | Undo-VBRFailoverPlan
This command undoes the failover process by the MS Exchange Group Failover failover plan.

Perform the following steps:
1. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Undo-VBRFailoverPlan cmdlet.
> Example 2

$MSExchangeGroup = Get-VBRFailoverPlan -Name "MS Exchange Group Failover"
Undo-VBRFailoverPlan -FailoverPlan $MSExchangeGroup
This command undoes the failover process by the MS Exchange Group Failover failover plan.

Perform the following steps:
1. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value. Save the result to the $MSExchangeGroup variable.
2. Run the Undo-VBRFailoverPlan cmdlet. Set the $MSExchangeGroup variable as the FailoverPlan parameter value.
> Example 3

Get-VBRFailoverPlan -Name "MS Exchange Group Failover", "SQLServers Group Failover" | Undo-VBRFailoverPlan -Wait
This command undoes failover processes by the MS Exchange Group Failover and SQLServers Group Failover failover plans. The VM groups are processed one by one.

Perform the following steps:
1. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Undo-VBRFailoverPlan cmdlet. Provide the Wait parameter.

---

### Parameters
#### **FailoverPlan**
Specifies the array of failover plans you want to undo.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRFailoverPlan[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Wait**
Use this parameter to manage undoing multiple failover processes.
If you provide this parameter, the next undo failover process will wait for the previous to end.

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
Veeam.Backup.PowerShell.Infos.VBRFailoverPlan[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Undo-VBRFailoverPlan -FailoverPlan <VBRFailoverPlan[]> [-Wait] [-Confirm] [-WhatIf] [<CommonParameters>]
```
