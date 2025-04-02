Disable-VBRCDPProxy
-------------------

### Synopsis
Disables VMware CDP proxies.

---

### Description

This cmdlet disables VMware CDP proxies.
Run the Enable-VBRCDPProxy cmdlet to enable VMware CDP proxies

---

### Related Links
* [Get-VBRCDPProxy](Get-VBRCDPProxy)

---

### Examples
> Disabling VMware CDP Proxies

$proxy = Get-VBRCDPProxy
Disable-VBRCDPProxy -Proxy $proxy
This example shows how to disable VMware CDP proxies.

Perform the following steps:
1. Run the Get-VBRCDPProxy cmdlet. Save the result to the $proxy variable.
2. Run the Disable-VBRCDPProxy cmdlet. Set the $proxy variable as the Proxy parameter value.

---

### Parameters
#### **Proxy**
Specifies an array of VMware CDP proxies.
The cmdlet will disable these proxies.

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
Disable-VBRCDPProxy -Proxy <VBRCDPProxy[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
