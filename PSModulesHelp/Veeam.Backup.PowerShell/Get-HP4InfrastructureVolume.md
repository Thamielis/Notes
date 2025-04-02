Get-HP4InfrastructureVolume
---------------------------

### Synopsis
Returns volumes of HPE StoreVirtual storage systems.

---

### Description

This cmdlet returns an array of volumes of HPE StoreVirtual storage systems.
The cmdlet will return storage volumes, even if they are not added to your backup infrastructure.

TIP: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Related Links
* [Get-HP4Storage](Get-HP4Storage)

* [Get-HP4Cluster](Get-HP4Cluster)

---

### Examples
> Example 1

```PowerShell
Get-HP4InfrastructureVolume
This command returns all volumes added to HPE StoreVirtual storage systems.
```
> Example 2

```PowerShell
Get-HP4InfrastructureVolume -Name "Volume1", "Volume2"
This command returns specific HPE StoreVirtual storage volumes.
```
> Example 3

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
$cluster = Get-HP4Cluster -Storage $storage -Name "HPE Cluster 01"
Get-HP4InfrastructureVolume -Cluster $cluster
This example shows how to get the array of all volumes added to the specific HPE StoreVirtual cluster.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Cluster cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value. Save the result to the $cluster variable.
3. Run the Get-HP4InfrastructureVolume cmdlet. Set the $cluster variable as the Cluster parameter value.

---

### Parameters
#### **Cluster**
Specifies an array of clusters.
The cmdlet will return the volumes of these clusters.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[CHpP4kCluster[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names.
The cmdlet will return the volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Storage**
Specifies an array of storage systems.
The cmdlet will return the volumes of these storage systems.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CHpP4kGroup]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.HpP4k.CHpP4kCluster[]

Veeam.Backup.SanPlugin.HpP4k.CHpP4kGroup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-HP4InfrastructureVolume [-Cluster <CHpP4kCluster[]>] [-Name <String[]>] [-Storage <CHpP4kGroup>] [<CommonParameters>]
```
