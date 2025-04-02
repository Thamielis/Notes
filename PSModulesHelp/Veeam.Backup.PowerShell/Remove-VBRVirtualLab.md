Remove-VBRVirtualLab
--------------------

### Synopsis
Removes virtual labs from Veeam Backup & Replication.

---

### Description

This cmdlet removes virtual labs from Veeam Backup & Replication.

---

### Related Links
* [Get-VBRVirtualLab](Get-VBRVirtualLab)

---

### Examples
> Example 1. Removing Virtual Lab from Veeam Backup & Replication

$lab = Get-VBRVirtualLab -Name "Exchange 01"
Remove-VBRVirtualLab -VirtualLab $lab
This example shows how to remove the Exchange 01 virtual lab from Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the Remove-VBRVirtualLab cmdlet. Set the $lab variable as the VirtualLab parameter value.
> Example 2. Removing Virtual Lab from Veeam Backup & Replication and VMware Infrastructure

$lab = Get-VBRVirtualLab -Name "SQL07"
Remove-VBRVirtualLab -VirtualLab $lab -FromHost
This example shows how to remove the SQL07 virtual lab from Veeam Backup & Replication and the VMware infrastructure.
Perform the following steps:
1. Run the Get-VBRVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
2. Run the Remove-VBRVirtualLab cmdlet. Set the $lab variable as the VirtualLab parameter value. Provide the FromHost parameter.

---

### Parameters
#### **FromHost**
Defines that the cmdlet will remove virtual lab from Veeam Backup & Replication and VMware infrastructure.
If you specify this parameter, the cmdlet will remove a virtual lab from both Veeam Backup & Replication and VMware infrastructures. Otherwise, the cmdlet will remove the virtual lab from the VMware infrastructure only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VirtualLab**
Specifies a virtual lab. The cmdlet will remove this virtual lab from the Veeam Backup & Replication infrastructure.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRVirtualLab[]]`|true    |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRVirtualLab[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRVirtualLab [-VirtualLab] <VBRVirtualLab[]> [-FromHost] [-Confirm] [-WhatIf] [<CommonParameters>]
```
