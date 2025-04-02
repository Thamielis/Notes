Remove-VBRCDPProxy
------------------

### Synopsis
Removes VMware CDP proxies from the backup infrastructure.

---

### Description

This cmdlet removes VMware CDP proxies from the backup infrastructure.

---

### Related Links
* [Get-VBRCDPProxy](Get-VBRCDPProxy)

---

### Examples
> Removing VMware CDP Proxies from Backup Infrastructure

$proxy = Get-VBRCDPProxy
Remove-VBRCDPProxy -Proxy $proxy
This example shows how to remove several VMware CDP Proxies from the backup infrastructure.

Perform the following steps:
1. Run the Get-VBRCDPProxy cmdlet. Save the result to the $proxy variable.
2. Run the Remove-VBRCDPProxy cmdlet. Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will remove a VMware CDP proxy without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Proxy**
Specifies an array of VMware CDP proxies.
The cmdlet will remove these proxies from the backup infrastructure.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRCDPProxy[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCDPProxy[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCDPProxy [-Force] -Proxy <VBRCDPProxy[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
