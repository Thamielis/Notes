Remove-VSBHvVirtualLab
----------------------

### Synopsis
Removes a Hyper-V virtual lab.
Note: This cmdlet is deprecated and will be marked as obsolete in the future. It is recommended to re-write your scripts using the cmdlet.

---

### Description

This cmdlet removes Hyper-V virtual labs.
You can remove virtual labs from the Veeam Backup & Replication console or from Hyper-V hosts. To remove virtual labs from Hyper-V hosts, use the FromHost parameter.
If you remove a virtual lab from the Veeam Backup & Replication console, you can add it back by running the Connect-VSBHvVirtualLab cmdlet.

---

### Related Links
* [Get-VSBHvVirtualLab](Get-VSBHvVirtualLab)

---

### Examples
> Example 1. Removing Virtual Lab from Console

$vlab = Get-VSBHvVirtualLab -Name "Virtual Lab 01"
Remove-VSBHvVirtualLab -VirtualLab $vlab
This example shows how to remove a virtual lab from the Veeam Backup & Replication console.
Perform the following steps:
1. Run the Get-VSBHvVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $vlab variable.
2. Run the Remove-VSBHvVirtualLab cmdlet. Set the $vlab variable as the VirtualLab parameter value.
> Example 2. Removing Virtual Lab from Hyper-V Host

$vlab = Get-VSBHvVirtualLab -Name "Virtual Lab 01"
Remove-VSBHvVirtualLab -VirtualLab $vlab -FromHost
This example shows how to remove a virtual lab from the Hyper-V host.
Perform the following steps:
1. Run the Get-VSBHvVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $vlab variable.
2. Run the Remove-VSBHvVirtualLab cmdlet. Set the $vlab variable as the VirtualLab parameter value. Provide the FromHost parameter.

---

### Parameters
#### **FromHost**
Defines that the cmdlet will remove virtual labs from Hyper-V hosts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VirtualLab**
Specifies the array of virtual lab names. The cmdlet will remove these virtual labs.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CHvSbVirtualLab[]]`|false   |0       |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.HyperV.VirtualLab.CHvSbVirtualLab[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VSBHvVirtualLab [[-VirtualLab] <CHvSbVirtualLab[]>] [-FromHost] [-Confirm] [-WhatIf] [<CommonParameters>]
```
