Install-VBRCDPFilter
--------------------

### Synopsis
Installs I/O filters on VMware clusters.

---

### Description

This cmdlet installs I/O filters on VMware clusters.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Installing I/O Filter to VMware Cluster

$server = Get-VBRServer -Name "vCenterServer"
$cluster = Find-VBRViEntity -Server $server -HostsAndClusters -Name "CDPCluster"
Install-VBRCDPFilter -CDPCluster $cluster
This example shows how to install a I/O filter on the CDPCluster VMware cluster. The cmdlet will install the same version of the I/O filter on the CDPHost VMware host.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Server, HostsAndClusters and Name parameters. Save the result to the $cluster variable.
3. Run the Install-VBRCDPFilter cmdlet. Set the $cluster variable as the CDPCluster parameter value.

---

### Parameters
#### **CDPCluster**
Specifies an array of VMware clusters on which you want to install a I/O filter.
Accepts the  CViClusterItem[] object.
To get this object, run the Find-VBRViEntity cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViClusterItem[]]`|true    |named   |False        |

#### **Force**
Defines that the cmdlet will install a I/O filter on a VMware cluster without showing warnings in the PowerShell console.

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
Install-VBRCDPFilter -CDPCluster <CViClusterItem[]> [-Force] [<CommonParameters>]
```
