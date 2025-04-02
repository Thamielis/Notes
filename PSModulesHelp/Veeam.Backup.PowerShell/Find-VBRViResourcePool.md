Find-VBRViResourcePool
----------------------

### Synopsis
Returns VMware resource pools.

---

### Description

This cmdlet returns resource pools on a selected ESXi host.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Looking for all Resource Pools on Specific ESXi Host

$server = Get-VBRServer -Type ESXi -Name "esx05.tech.local"
Find-VBRViResourcePool -Server $server
This example shows how to get a list of resource pools on the esx05.tech.local ESXi hosts.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViResourcePool cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Looking for Specific Resource Pool on Specific ESXi Host

$server = Get-VBRServer -Type ESXi -Name "esx05.tech.local"
Find-VBRViResourcePool -Server $server -Name "ResourcePool_05"
This example shows how to get the RP_05 resource pool on the esx05.tech.local ESXi hosts.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViResourcePool cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the array of resource pool names. The cmdlet will return resource pools with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies the ESXi host. The cmdlet will return resource pools created on this host.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

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
Find-VBRViResourcePool [-Name <String[]>] -Server <CHost> [<CommonParameters>]
```
