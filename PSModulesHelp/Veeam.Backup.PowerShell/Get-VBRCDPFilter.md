Get-VBRCDPFilter
----------------

### Synopsis
Returns a list of Veeam I/O filters that are installed on VMware clusters.

---

### Description

This cmdlet returns a list of Veeam I/O filters that are installed on VMware clusters.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Getting I/O Filters Installed on VMware Clusters

$server = Get-VBRServer -Name "vCenterServer"
$cluster = Find-VBRViEntity -Server $server -HostsAndClusters -Name "CDPCluster"
Get-VBRCDPFilter -Cluster $cluster
This example shows how to get I/O filters that are installed on the CDPCluster VMware cluster.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Server, HostsAndClusters and Name parameters. Save the result to the $cluster variable.
3. Run the Get-VBRCDPFilter cmdlet. Set the $cluster variable as the Cluster parameter value.

---

### Parameters
#### **Cluster**
Specifies an array of VMware clusters. The cmdlet will return Veeam I/O filters that are installed on these VMware clusters.
Accepts the  CViClusterItem[] object. To get this object, run the Find-VBRViEntity cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[CViClusterItem[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Infrastructure.CViClusterItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCDPFilter [-Cluster <CViClusterItem[]>] [<CommonParameters>]
```
