Reset-VBRAgentCertificate
-------------------------

### Synopsis
Resets Veeam Agents SSL certificates.

---

### Description

This cmdlet resets SSL certificates for selected Veeam Agents.
When you reset Veeam Agents certificates, all backup jobs run by these agents stop. You can use this cmdlet for performing Maintenance tasks on protected computers where the associated agents are installed.
Veeam Backup & Replication will regenerate a new Veeam Agent certificate automatically next time you run a Veeam Agent backup job.

---

### Related Links
* [Get-VBRProtection](Get-VBRProtection)

* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

---

### Examples
> Example 1. Resetting SSL Certificates for Veeam Agents on Computers of Selected Protection Group

$group = Get-VBRProtectionGroup -Name "East Support"
$discovered = Get-VBRDiscoveredComputer -ProtectionGroup $group
Reset-VBRAgentCertificate -DiscoveredComputer $discovered
This example shows how to reset SSL certificates for Veeam Agents installed on computers of a selected protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Save the result to the $discovered variable.
3. Run the Reset-VBRAgentCertificate cmdlet. Set the $discovered variable as the DiscoveredComputer parameter value.
> Example 2. Resetting SSL Certificate for Veeam Agent Installed on Selected Computer

$group = Get-VBRProtectionGroup -Name "East Support"
$comp = Get-VBRDiscoveredComputer -ProtectionGroup $group | where {$_.name -eq "support1.east.local"}
Reset-VBRAgentCertificate -DiscoveredComputer $comp
This example shows how to reset the SSL certificate for Veeam Agent installed on a selected computer.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Use the Where-Object method to get the discovered computer. Save the result to the $comp variable.
3. Run the Reset-VBRAgentCertificate cmdlet. Set the $comp variable as the DiscoveredComputer parameter value.

---

### Parameters
#### **DiscoveredComputer**
Specifies the array of discovered computers. The cmdlet will reset SSL certificates for Veeam Agents installed on these computers.
Note: You can reset the SSL certificate only on discovered computers.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputer[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Reset-VBRAgentCertificate -DiscoveredComputer <VBRDiscoveredComputer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
