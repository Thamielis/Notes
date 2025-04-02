Get-HP4Volume
-------------

### Synopsis
Returns HPE StoreVirtual volumes added to the backup infrastructure.

---

### Description

This cmdlet returns HPE StoreVirtual volumes added to the backup infrastructure.

TIP: Run the Get-HP4InfrastructureVolume cmdlet to get an array of volumes from HPE StoreVirtual storage systems.

Alias Get-VBRHPVolume

---

### Related Links
* [Get-HP4Storage](Get-HP4Storage)

* [Get-HP4Cluster](Get-HP4Cluster)

---

### Examples
> Example 1

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
Get-HP4Volume -Storage $storage
This example shows how to get all HPE StoreVirtual volumes added to the backup infrastructure.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Volume cmdlet. Set the $storage variable as the Storage parameter value.
> Example 2

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
$cluster = Get-HP4Cluster -Storage $storage -Name "HPE Cluster 01"
Get-HP4Volume -Cluster $cluster
This example shows how to get all an HPE StoreVirtual volumes on a cluster.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Cluster cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value. Save the result to the $cluster variable.
3. Run the Get-HP4Volume cmdlet. Set the $cluster variable as the Cluster parameter value.
> Example 3

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
$cluster = Get-HP4Cluster -Storage $storage -Name "HPE Cluster 01"
Get-HP4Volume -Cluster $cluster -Name "HPE Volume 01"
This example shows how to get an HPE StoreVirtual volume on a cluster.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Cluster cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value. Save the result to the $cluster variable.
3. Run the Get-HP4Volume cmdlet. Set the $cluster variable as the Cluster parameter value. Specify the Name parameter value.
> Example 4

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
Get-HP4Volume -Storage $storage -Name "HPE Volume 01"
This example shows how to get HPE StoreVirtual volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Volume cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value.

---

### Parameters
#### **Cluster**
Specifies an array of clusters.
The cmdlet will return volumes on these clusters.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[CHpP4kCluster[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Storage**
Specifies an array of storage systems.
The cmdlet will return volumes of these storage systems.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[CHpP4kGroup[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.HpP4k.CHpP4kCluster[]

Veeam.Backup.SanPlugin.HpP4k.CHpP4kGroup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-HP4Volume [-Cluster <CHpP4kCluster[]>] [-Name <String[]>] [-Storage <CHpP4kGroup[]>] [<CommonParameters>]
```
