Uninstall-VBRCDPFilter
----------------------

### Synopsis
Removes Veeam I/O filter from VMware clusters.

---

### Description

This cmdlet removes Veeam I/O filters from VMware clusters.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Removing I/O Filters from VMware Clusters

$server = Get-VBRServer -Name "vCenterServer"
$cluster = Find-VBRViEntity -Server $server -HostsAndClusters -Name "CDPCluster"
Uninstall-VBRCDPFilter -CDPCluster $cluster
This example shows how to remove a I/O filter from the CDPCluster VMware cluster. The cmdlet will also remove the I/O filter from the CDPHost VMware host.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Server, HostsAndClusters and Name parameters. Save the result to the $cluster variable.
3. Run the Uninstall-VBRCDPFilter cmdlet. Set the $cluster variable as the CDPCluster parameter value.

---

### Parameters
#### **CDPCluster**
Specifies an array of VMware clusters from which you want to remove a Veeam I/O filter.
Accepts the  CViClusterItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViClusterItem[]]`|true    |named   |False        |

#### **Force**
Defines that the cmdlet will remove I/O filters from VMware clusters without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Uninstall-VBRCDPFilter -CDPCluster <CViClusterItem[]> [-Force] [<CommonParameters>]
```
