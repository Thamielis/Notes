Remove-VBRFailoverPlan
----------------------

### Synopsis
Removes a selected failover plan or a cloud failover plan.

---

### Description

This cmdlet removes a selected failover plan from Veeam Backup & Replication console and database.

---

### Examples
> Example 1

Get-VBRFailoverPlan -Name "MS Exchange Group Failover" | Remove-VBRFailoverPlan
This command removes the MS Exchange Group Failover failover plan.

Perform the following steps:
1. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRFailoverPlan cmdlet.
> Example 2

$MSExchangeGroup = Get-VBRFailoverPlan -Name "MS Exchange Group Failover"
Remove-VBRFailoverPlan -FailoverPlan $MSExchangeGroup
This example shows how to remove the MS Exchange Group Failover failover plan.

Perform the following steps:
1. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value. Save the result to the $MSExchangeGroup variable.
2. Run the Remove-VBRFailoverPlan cmdlet. Set the $MSExchangeGroup variable as the FailoverPlan parameter value.

---

### Parameters
#### **FailoverPlan**
Specifies the array of failover plans you want to remove.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRFailoverPlan[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Remove-VBRFailoverPlan -FailoverPlan <VBRFailoverPlan[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
