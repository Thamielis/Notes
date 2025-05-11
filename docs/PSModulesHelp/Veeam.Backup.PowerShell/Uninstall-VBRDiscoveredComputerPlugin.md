Uninstall-VBRDiscoveredComputerPlugin
-------------------------------------

### Synopsis
Removes Veeam Plug-in from a specific protected computer.

---

### Description

This cmdlet removes Veeam Plug-ins from a specific protected computer.

---

### Related Links
* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

---

### Examples
> Removing Veeam Plug-in from Protected Computers

$group = Get-VBRProtectionGroup -Name "Database Servers"
$computers = Get-VBRDiscoveredComputer -ProtectionGroup $group
Uninstall-VBRDiscoveredComputerPlugin -DiscoveredComputer $computers -Type OracleRMAN
This example shows how to remove Veeam Plug-in for Oracle RMAN from protected computers that are added to the specified protection group.

Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Save the result to the $computers variable.
3. Run the Uninstall-VBRDiscoveredComputerPlugin cmdlet. Set the $computers variable as the DiscoveredComputer parameter value. Use the Type parameter to specify the application type.

---

### Parameters
#### **DiscoveredComputer**
Specifies an array of computers. The cmdlet will remove Veeam Plug-in from these computers. Accepts the VBRDiscoveredComputer[] object. To get this object, run the Get-VBRDiscoveredComputer cmdlet.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputer[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

#### **Type**
Specifies the type of Veeam Plug-in to be installed on the protected computers:
* OracleRMAN: for Veeam Plug-in for Oracle RMAN.
* SAPHANA: for Veeam Plug-in for SAP HANA.
* SAPOnOracle: for Veeam Plug-in for SAP on Oracle.
The cmdlet will return discovered computers with applications of these types.
Valid Values:

* OracleRMAN
* SAPHANA
* SAPOnOracle

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRApplicationType]`|true    |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputer[]

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Uninstall-VBRDiscoveredComputerPlugin -DiscoveredComputer <VBRDiscoveredComputer[]> [-RunAsync] -Type {OracleRMAN | SAPHANA | SAPOnOracle} [-Confirm] [-WhatIf] [<CommonParameters>]
```
