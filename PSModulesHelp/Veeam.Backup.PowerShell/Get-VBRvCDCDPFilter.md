Get-VBRvCDCDPFilter
-------------------

### Synopsis
Returns a list of Veeam I/O filters installed on an ESXi host.

---

### Description

This cmdlet returns a list of Veeam I/O filters installed on an ESXi host.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1

$server = Get-VBRServer
Get-VBRvCDCDPFilter -Server $server
This example shows how to get a list of Veeam I/O filters installed on an ESXi host.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
2. Run the Get-VBRvCDCDPFilter cmdlet. Set the $server variable as the Server parameter value.

---

### Parameters
#### **OrganizationVdc**
Specifies an array of organization VDCs for which you want to get the list of installed I/O filters.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[CVcdOrganizationVdcItem[]]`|false   |named   |False        |

#### **Server**
Specifies the ESXi host for which you want to get the list of installed I/O filters.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRvCDCDPFilter [-OrganizationVdc <CVcdOrganizationVdcItem[]>] -Server <CHost> [-Confirm] [-WhatIf] [<CommonParameters>]
```
