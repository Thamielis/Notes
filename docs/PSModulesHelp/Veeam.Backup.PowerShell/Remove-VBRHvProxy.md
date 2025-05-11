Remove-VBRHvProxy
-----------------

### Synopsis
Removes the Hyper-V backup proxy from the backup infrastructure.

---

### Description

This cmdlet allows you to remove the specified Hyper-V backup proxy from the backup infrastructure.
When you remove a backup proxy, Veeam Backup & Replication unassigns the proxy role from the server, so it is no longer used as a backup proxy. The actual server remains added to the backup infrastructure.
Note: You cannot remove a backup proxy that is explicitly selected in any backup, replication or VM copy job. To remove such a proxy, you need to delete all job references to it first.

---

### Related Links
* [Get-VBRHvProxy](Get-VBRHvProxy)

---

### Examples
> Example 1. Removing Hyper-V Backup Proxy [Using Pipeline]

Get-VBRHvProxy -Name "LocalProxy"| Remove-VBRHvProxy
This example shows how to remove the Hyper-V backup proxy named LocalProxy.
Perform the following steps:
1. Run the Get-VBRHvProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Pipe the cmdlet output to the Remove-VBRHvProxy cmdlet.
> Example 2. Removing Hyper-V Backup Proxy [Using Variable]

$proxy = Get-VBRHvProxy -Name "LocalProxy"
Remove-VBRHvProxy -Proxy $proxy
This example shows how to remove the Hyper-V backup proxy named LocalProxy.
Perform the following steps:
1. Run the Get-VBRHvProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Remove-VBRHvProxy cmdlet. Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **Proxy**
Specifies an array of the Hyper-V proxies you want to remove.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CHvProxy[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.CHvProxy[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRHvProxy -Proxy <CHvProxy[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
