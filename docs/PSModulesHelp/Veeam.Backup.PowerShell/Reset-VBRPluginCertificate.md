Reset-VBRPluginCertificate
--------------------------

### Synopsis
Resets Veeam Plug-in SSL certificates.

---

### Description

This cmdlet resets SSL certificates for selected Veeam Plug-ins.

When you reset Veeam Plug-in certificates, all backup policies run by these Veeam Plug-ins stop. You can use this cmdlet for performing maintenance tasks on protected computers where the associated agents are installed.

Veeam Backup & Replication will regenerate a new SSL certificate automatically next time you run an application backup policy.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Get-VBRDiscoveredApplication](Get-VBRDiscoveredApplication)

---

### Examples
> Example Resetting SSL Certificates for Veeam Plug-in for Oracle RMAN Installed on Computers of Selected Protection Group

$group = Get-VBRProtectionGroup -Name "Database Servers"
$discovered = Get-VBRDiscoveredApplication -ProtectionGroup $group
Reset-VBRPluginCertificate -Type OracleRMAN -DiscoveredComputer $discovered
This example shows how to reset SSL certificates for Veeam Plug-in for Oracle RMAN installed on computers of a selected protection group.

Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredApplication cmdlet. Specify the ProtectionGroup parameter value. Save the result to the $discovered variable.
3. Run the Reset-VBRPluginCertificate cmdlet. Specify the Type parameter value. Set the $discovered variable as the DiscoveredComputer parameter value.

---

### Parameters
#### **DiscoveredComputer**
Specifies the array of discovered computers. The cmdlet will reset SSL certificates for Veeam Agents installed on these computers. NOTE: You can reset the SSL certificate only on discovered computers. Accepts the VBRDiscoveredComputer[] object. To get this object, run the Get-VBRDiscoveredComputer cmdlet.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputer[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Type**
Specifies the type of Veeam Plug-in to be installed on the protected computers:
* OracleRMAN: for Veeam Plug-in for Oracle RMAN.
* SAPHANA: for Veeam Plug-in for SAP HANA.
* SAPOnOracle: for Veeam Plug-in for SAP on Oracle.
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

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Reset-VBRPluginCertificate -DiscoveredComputer <VBRDiscoveredComputer[]> -Type {OracleRMAN | SAPHANA | SAPOnOracle} [-Confirm] [-WhatIf] [<CommonParameters>]
```
