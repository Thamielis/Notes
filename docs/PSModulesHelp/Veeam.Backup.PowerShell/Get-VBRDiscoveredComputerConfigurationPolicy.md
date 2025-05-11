Get-VBRDiscoveredComputerConfigurationPolicy
--------------------------------------------

### Synopsis
Returns current Veeam Agent settings.

---

### Description

This cmdlet returns the list of settings applied to discovered computers.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

---

### Examples
> Viewing Veeam Agent Settings for Protection Group

$group = Get-VBRProtectionGroup -Name "BackupServers"
Get-VBRDiscoveredComputerConfigurationPolicy -ProtectionGroup $group
This example shows how to return settings applied to computers that are members of the BackupServers protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputerConfigurationPolicy cmdlet. Set the $group variable as the ProtectionGroup parameter value.

---

### Parameters
#### **DiscoveredComputer**
Specifies an array of discovered computers. The cmdlet will return the list of settings applied to these computers.

|Type                     |Required|Position|PipelineInput        |
|-------------------------|--------|--------|---------------------|
|`[VBRDiscoveredComputer]`|true    |named   |True (ByPropertyName)|

#### **Id**
Specifies an ID of a configuration policy.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[Guid]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ProtectionGroup**
Specifies an array of protection groups. This cmdlet will return the list of settings applied to computers from these protection groups.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRProtectionGroup]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid

Veeam.Backup.PowerShell.Infos.VBRProtectionGroup

Veeam.Backup.PowerShell.Infos.VBRDiscoveredComputer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRDiscoveredComputerConfigurationPolicy -DiscoveredComputer <VBRDiscoveredComputer> [<CommonParameters>]
```
```PowerShell
Get-VBRDiscoveredComputerConfigurationPolicy -Id <Guid> [<CommonParameters>]
```
```PowerShell
Get-VBRDiscoveredComputerConfigurationPolicy -ProtectionGroup <VBRProtectionGroup> [<CommonParameters>]
```
