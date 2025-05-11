Uninstall-VBRvCDCDPFilter
-------------------------

### Synopsis
Removes Veeam I/O filter from organization VDCs.

---

### Description

This cmdlet removes Veeam I/O filter from organization VDCs.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Example 1

$server = Get-VBRServer -Name "Cloud Server"
$organization = Find-VBRvCloudEntity -Server $server -OrganizationVdc
Uninstall-VBRvCDCDPFilter -OrganizationVdc $organization[2]
This example shows how to uninstall Veeam I/O filter from organization VDCs.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRvCloudEntity cmdlet. Specify the Server and OrganizationVdc parameters values. Save the result to the $organization variable.
3. Run the Uninstall-VBRvCDCDPFilter cmdlet. Set the $organization[2] variable as the OrganizationVdc parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will uninstall the I/O filter on VDC organizations without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **OrganizationVdc**
Specifies an array of organization VDCs from which you want to uninstall Veeam I/O filters.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[CVcdOrganizationVdcItem[]]`|true    |named   |False        |

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
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Uninstall-VBRvCDCDPFilter [-Force] -OrganizationVdc <CVcdOrganizationVdcItem[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
