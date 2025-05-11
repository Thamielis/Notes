Add-VBRDiscoveredComputerConfigurationPolicy
--------------------------------------------

### Synopsis
Updates Veeam Agent settings on discovered computers.
IMPORTANT! Make sure to test this cmdlet in the lab before you run it in the production environment.

---

### Description

This cmdlet updates Veeam Agent settings on individual computers or protection groups using existing configuration options. New settings are applied after the rescan operation.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Get-VBRDiscoveredComputer](Get-VBRDiscoveredComputer)

* [New-VBRDiscoveredComputerConfigurationOption](New-VBRDiscoveredComputerConfigurationOption)

---

### Examples
> Updating Path to Temporary Folder Storing SQL Backup Logs on Windows Computers

$group = Get-VBRProtectionGroup -Name "Windows"
$computers = Get-VBRDiscoveredComputer -ProtectionGroup $group
$SQLLogpath = New-VBRDiscoveredComputerConfigurationOption -Name "SqlTempLogPath" -Value "D:\Temp"
$configuration_policy = Add-VBRDiscoveredComputerConfigurationPolicy -DiscoveredComputer $computers -AgentType Windows -ConfigurationOption $SQLLogpath
This example shows how to update the SqlTempLogPath registry value on Windows computers.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value. Save the result to the $computers variable.
3. Run the New-VBRDiscoveredComputerConfigurationOption cmdlet. Specify the Name and the Value parameter values. Save the result to the $SQLLogpath variable.
4. Run the Add-VBRDiscoveredComputerConfigurationPolicy cmdlet. Specify the following settings:
- Set the $computers variable as the DiscoveredComputer parameter value.
- Specify the AgentType parameter value.
- Set the $SQLLogpath variable as the ConfigurationOption parameter value.
Save the result to the $configuration_policy variable.

---

### Parameters
#### **AgentType**
Specifies the type of a Veeam Agent:
* Windows
* Linux
* Mac
* Unix
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[VBRAgentType]`|true    |named   |True (ByPropertyName)|

#### **ConfigurationOption**
Specifies the configuration option that you want to assign to discovered computers.

|Type                                          |Required|Position|PipelineInput        |
|----------------------------------------------|--------|--------|---------------------|
|`[VBRDiscoveredComputerConfigurationOption[]]`|true    |named   |True (ByPropertyName)|

#### **DiscoveredComputer**
Specifies an array of discovered computers. The cmdlet will assign the configuration option to these computers.

|Type                       |Required|Position|PipelineInput        |
|---------------------------|--------|--------|---------------------|
|`[VBRDiscoveredComputer[]]`|true    |named   |True (ByPropertyName)|

#### **ProtectionGroup**
Specifies an array of protection groups to which you want to assign the configuration option.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRProtectionGroup[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRProtectionGroup[]

Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputer[]

Veeam.Backup.PowerShell.Infos.VBRAgentType

Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputerConfigurationOption[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRDiscoveredComputerConfigurationPolicy -AgentType {Windows | Linux | Mac | Unix} -ConfigurationOption <VBRDiscoveredComputerConfigurationOption[]> -DiscoveredComputer <VBRDiscoveredComputer[]> 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Add-VBRDiscoveredComputerConfigurationPolicy -AgentType {Windows | Linux | Mac | Unix} -ConfigurationOption <VBRDiscoveredComputerConfigurationOption[]> -ProtectionGroup <VBRProtectionGroup[]> 
```
```PowerShell
[<CommonParameters>]
```
