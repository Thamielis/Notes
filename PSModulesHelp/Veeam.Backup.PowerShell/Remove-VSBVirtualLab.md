Remove-VSBVirtualLab
--------------------

### Synopsis
Removes a specified VMware virtual lab.

---

### Description

This cmdlet removes VMware virtual labs.

You can remove virtual labs from the Veeam Backup & Replication console or from ESX(i) hosts. To remove virtual labs from ESX(i) hosts, use the FromHost parameter.

If you remove a virtual lab from the Veeam Backup & Replication console, you can add it back by running Connect-VSBHvVirtualLab.

---

### Related Links
* [Get-VSBVirtualLab](Get-VSBVirtualLab)

---

### Examples
> Example 1

$vlab = Get-VSBVirtualLab -Name "Virtual Lab"
Remove-VSBVirtualLab -VirtualLab $vlab
This example shows how to remove a virtual lab from the Veeam Backup & Replication console.

You will need to perform the following steps:   1.Run Get-VSBVirtualLab to get the virtual lab you want to remove. Save the result to the $vlab variable.   2.Run Remove-VSBVirtualLab with the $vlab variable.
> Example 2

```PowerShell
$vlab = Get-VSBVirtualLab -Name "Virtual Lab"
Remove-VSBVirtualLab -VirtualLab $vlab -FromHost
This example shows how to remove a virtual lab from the ESX(i) host.

You will need to perform the following steps:   1.Run Get-VSBVirtualLab to get the virtual lab you want to remove. Save the result to the $vlab variable.   2.Run Remove-VSBVirtualLab with the $vlab variable and the FromHost parameter.
```

---

### Parameters
#### **FromHost**
Indicates that the cmdlet will remove virtual labs from ESX(i) hosts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VirtualLab**
Specifies the array of virtual lab names. The cmdlet will remove these virtual labs.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CViSbVirtualLab[]]`|false   |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.SureBackup.CViSbVirtualLab[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VSBVirtualLab [[-VirtualLab] <CViSbVirtualLab[]>] [-FromHost] [-Confirm] [-WhatIf] [<CommonParameters>]
```
