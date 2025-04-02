Get-VBRViVirtualSwitch
----------------------

### Synopsis
Returns VMware virtual switches.

---

### Description

This cmdlet returns VMware virtual switches that are created on a ESXi host or cluster.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Example 1. Getting Switches Created on Selected Host

$server = Get-VBRServer -Type ESXi -Name "ESXiHost"
Get-VBRViVirtualSwitch -Server $server
This example shows how to get switches created on the host named ESXiHost.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and the Name parameter values. Save it to the $server variable.
2. Run the Get-VBRViVirtualSwitch cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Getting Switches Created on Selected VMware Cluster

$cluster = Find-VBRViEntity -Server ESXiHost -HostsAndClusters -Name vSAN
Get-VBRViVirtualSwitch -Server $cluster
This example shows how to get switches created on the VMware cluster named vSAN.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Server parameter value. Provide the HostsAndClusters parameter. Specify the Name parameter value. Save it to the $cluster variable.
2. Run the Get-VBRViVirtualSwitch cmdlet. Set the $cluster variable as the Server parameter value.

---

### Parameters
#### **Server**
Specifies the ESX or ESXi host or cluster. The cmdlet will return the virtual switches created on this host or cluster. Accepts the Object[] object.  Run the Get-VBRServer cmdlet to get this object.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Object[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRViVirtualSwitch -Server <Object[]> [<CommonParameters>]
```
