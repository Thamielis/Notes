Install-VBRDiscoveredComputerAgent
----------------------------------

### Synopsis
Installs Veeam Agents on discovered computers.

---

### Description

This cmdlet installs Veeam Agents on discovered computers.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

* [New-VBRIndividualComputerCustomCredentials](New-VBRIndividualComputerCustomCredentials)

* [New-VBRIndividualComputerContainer](New-VBRIndividualComputerContainer)

* [Add-VBRProtectionGroup](Add-VBRProtectionGroup)

* [Rescan-VBREntity](Rescan-VBREntity)

---

### Examples
> Example 1. Installing Veeam Agents on Discovered Computers of Selected Protection Group

$group = Get-VBRProtectionGroup -Name "East Support"
$computers = Get-VBRDiscoveredComputer -ProtectionGroup $group
Install-VBRDiscoveredComputerAgent -DiscoveredComputer $computers
This example shows how to install Veeam Agents on discovered computers of a selected protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Save the result to the $computers variable.
3. Run the Install-VBRDiscoveredComputerAgent cmdlet. Set the $computers variable as the DiscoveredComputer parameter value.
> Example 2. Creating Protection Group and Installing Veeam Agents on Discovered Computers of This Group

$computers = @("172.19.51.53", "sup-v8931") | ForEach { New-VBRIndividualComputerCustomCredentials -HostName $_ -Credentials "support\jsmith" }
$compscope = New-VBRIndividualComputerContainer -CustomCredentials $computers
$group = Add-VBRProtectionGroup -Name "Support_East" -Container $compscope
Rescan-VBREntity -Entity $group -Wait
$discovered = Get-VBRDiscoveredComputer -ProtectionGroup $group
Install-VBRDiscoveredComputerAgent -DiscoveredComputer $discovered
This example shows how to create a protection group, manually discover computers of this group and install Veeam Agents on discovered computers of this group.
Perform the following steps:
1. Create a scope of computers for a protection group:
- Run the New-VBRIndividualComputerCustomCredentials cmdlet. Use the ForEach statement to apply the same credentials to multiple computers. Save the result to the $computers variable.
- Run the New-VBRIndividualComputerContainer cmdlet. Set the $computers variable as the CustomCredentialsContainer parameter value. Save the result to the $compscope variable.
2. Run the Add-VBRProtectionGroup cmdlet. Specify the Name parameter value. Set the $compscope variable as the Container parameter value. Save the result to the $group variable.
3. Run the Rescan-VBREntity cmdlet. Set the $group variable as the Entity parameter value. Provide the Wait parameter.
4. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Save the result to the $discovered variable.
5. Run the Install-VBRDiscoveredComputerAgent cmdlet. Set the $discovered variable as the DiscoveredComputer parameter value.

---

### Parameters
#### **DiscoveredComputer**
Specifies the array of discovered computers. The cmdlet will install Veeam Agents on these computers.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRDiscoveredComputer[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |True (ByPropertyName)|

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
Install-VBRDiscoveredComputerAgent -DiscoveredComputer <VBRDiscoveredComputer[]> [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
