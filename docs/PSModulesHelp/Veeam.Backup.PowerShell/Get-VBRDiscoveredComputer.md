Get-VBRDiscoveredComputer
-------------------------

### Synopsis
Returns discovered computers.

---

### Description

This cmdlet returns discovered computers from all protection groups or from selected protection groups. Use an appropriate parameter set for each case.
Veeam Backup & Replication regularly performs discovery operations for computers in a protection group. During a discovery operation, Veeam Backup & Replication connects to computers and gathers information about them. After the discovery operation is complete, Veeam Backup & Replication recognizes processed computers as discovered.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Rescan-VBREntity](Rescan-VBREntity)

---

### Examples
> Example 1. Getting Discovered Computers of All Protection Groups

```PowerShell
Get-VBRDiscoveredComputer
This command returns discovered computers of all protection groups.
```
> Example 2. Getting Discovered Computers of Selected Protection Group

$group = Get-VBRProtectionGroup -Name "Support_East"
Get-VBRDiscoveredComputer -ProtectionGroup $group
This example shows how to get discovered computers of a selected protection group.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the $group variable as the ProtectionGroup parameter value.
> Example 3. Getting Active Directory Discovered Computers of Several Protection Groups

$groups = Get-VBRProtectionGroup -Name "Support_East", "Support_North"
Get-VBRDiscoveredComputer -Type ActiveDirectory -ProtectionGroup $groups
This example shows how to get Active Directory discovered computers of several protection groups.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $groups variable.
2. Run the Get-VBRDiscoveredComputer cmdlet. Set the ActiveDirectory option for the Type parameter. Set the $groups variable as the ProtectionGroup parameter value.

---

### Parameters
#### **ProtectionGroup**
Specifies the array of protection groups. The cmdlet will look for discovered computers in these groups.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRProtectionGroup[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Type**
Specifies the array types:
* Computer: standalone computers
* Cluster: computers that are part of a cluster
* ActiveDirectory: Active Directory computers
The cmdlet will return discovered computers of these types.
Valid Values:

* Computer
* Cluster
* ActiveDirectory

|Type                         |Required|Position|PipelineInput        |
|-----------------------------|--------|--------|---------------------|
|`[VBRDiscoveredEntityType[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRProtectionGroup[]

Veeam.Backup.PowerShell.Infos.VBRDiscoveredEntityType[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRDiscoveredComputer [-ProtectionGroup <VBRProtectionGroup[]>] [-Type {Computer | Cluster | ActiveDirectory}] [<CommonParameters>]
```
