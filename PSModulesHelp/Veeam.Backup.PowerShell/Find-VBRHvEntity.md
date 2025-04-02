Find-VBRHvEntity
----------------

### Synopsis
Returns Hyper-V objects.

---

### Description

This cmdlet retutns an array of Hyper-V objects.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Getting all Hosts and VMs Available on Hyper-V

$server = Get-VBRServer -Name "HvHost"
Find-VBRHvEntity -Server $server -HostsAndVMs
This example shows how to get a list of all hosts and VMs available on the HvHost Hyper-V server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRHvEntity cmdlet. Set the $server variable as the Server parameter value. Provide the HostsAndVMs parameter.
> Example 2. Getting all Hosts Available on Hyper-V

$server = Get-VBRServer -Name "HvHost"
Find-VBRHvEntity -Server $server -Hosts
This example shows how to get a list of all hosts available on the "HvHost" Hyper-V server. Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRHvEntity cmdlet. Set the $server variable as the Server parameter value. Provide the Hosts parameter.
> Example 3. Getting all Hosts and Volumes Available on Hyper-V

$server = Get-VBRServer -Name "HvHost"
Find-VBRHvEntity -Server $server -HostsAndVolumes
This example shows how to get a list of all hosts and volumes available on the HvHost Hyper-V server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRHvEntity cmdlet. Set the $server variable as the Server parameter value. Provide the HostsAndVolumes parameter.
> Example 4. Getting all Hyper-V Tags

$server = Get-VBRServer -Name "HvHost"
Find-VBRHvEntity -Server $server -Tags
This example shows how to get a list of all tags available on the HvHost Hyper-V server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRHvEntity cmdlet. Set the $server variable as the Server parameter value. Provide the Tags parameter.

---

### Parameters
#### **Hosts**
Defines that the cmdlet will return an array of hosts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HostsAndVMs**
Defines that the cmdlet will return an array of hosts.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HostsAndVolumes**
Defines that the cmdlet will return an array of hosts and volumes.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies an array of entity names. The cmdlet will return entities with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies an array of Hyper-V hosts. The cmdlet will return entities created on these hosts.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Tags**
Defines that the cmdlet will return an array of tags.
Note: To specify the tag name, provide the Name parameter.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VMGroups**
Defines that the cmdlet will return an array of VM groups.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Common.CHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRHvEntity [-Hosts] [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRHvEntity [-HostsAndVMs] [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRHvEntity [-HostsAndVolumes] [-Name <String[]>] [-Server <CHost[]>] [<CommonParameters>]
```
```PowerShell
Find-VBRHvEntity [-Name <String[]>] [-Server <CHost[]>] [-Tags] [<CommonParameters>]
```
```PowerShell
Find-VBRHvEntity [-Name <String[]>] [-Server <CHost[]>] [-VMGroups] [<CommonParameters>]
```
