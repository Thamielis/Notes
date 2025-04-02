Remove-VBRViProxy
-----------------

### Synopsis
Removes a VMware backup proxy from the backup infrastructure.

---

### Description

This cmdlet removes the specified VMware backup proxy from the backup infrastructure.
When you remove a backup proxy, Veeam Backup & Replication unassigns the proxy role from the server, so it is no longer used as a backup proxy. The actual server remains added to the backup infrastructure.
Note: You cannot remove a backup proxy that is explicitly selected in any backup, replication or VM copy job. To remove such a proxy, you need to delete all job references to it first.
Run the Disable-VBRViProxy cmdlet to disable a VMware backup proxy.

---

### Related Links
* [Get-VBRViProxy](Get-VBRViProxy)

---

### Examples
> Example 1. Removing VMware Backup Proxy [Using Pipeline]

Get-VBRViProxy -Name "LocalProxy"| Remove-VBRViProxy
This example shows how to remove VMware backup proxy named LocalProxy.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRViProxy cmdlet.
> Example 2. Removing VMware Backup Proxy [Using Variable]

$proxy = Get-VBRViProxy -Name "LocalProxy"
Remove-VBRViProxy -Proxy $proxy
This example shows how to remove the VMware backup proxy named LocalProxy.
Perform the following steps:
1. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy variable.
2. Run the Remove-VBRViProxy cmdlet. Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **Proxy**
Specifies an array of VMware proxies you want to remove.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CViProxy[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.CViProxy[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRViProxy -Proxy <CViProxy[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
