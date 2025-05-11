Get-HP4Cluster
--------------

### Synopsis
Returns HPE StoreVirtual storage clusters.

---

### Description

This cmdlet returns HPE StoreVirtual storage clusters. You can get the list of all storage clusters in your storage system, or narrow down the output by the cluster name or a specific storage.

Alias Get-VBRHPCluster

---

### Examples
> Example 1

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
Get-HP4Cluster -Storage $storage
This example shows how to get all clusters in the HPE StoreVirtual storage.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Cluster cmdlet. Set the $storage variable as the Storage parameter value.
> Example 2

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
Get-HP4Cluster -Storage $storage -Name "HPE Cluster 01"
This example shows how to get a cluster by name.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Cluster cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the array of storage cluster names.
The cmdlet will return the clusters with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Storage**
Specifies the array of the storage systems.
The cmdlet will return the clusters on these storage systems.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[CHpP4kGroup[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.HpP4k.CHpP4kGroup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-HP4Cluster [-Name <String[]>] [-Storage <CHpP4kGroup[]>] [<CommonParameters>]
```
