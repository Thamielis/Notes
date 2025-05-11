Find-VBRViDatastoreCluster
--------------------------

### Synopsis
Looks for VMware datastore clusters.

---

### Description

This cmdlet returns a list of VMware datastore clusters.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViStoragePolicy](Find-VBRViStoragePolicy)

---

### Examples
> Example 1. Looking for VMware Datastores Clusters Connected to Specific ESXi Host

$server = Get-VBRServer -Type ESXi -Name "esx05.tech.local" 
Find-VBRViDatastoreCluster -Server $server
This example shows how to look for VMware datastore clusters on the esx05.tech.local host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViDatastoreCluster cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Looking for VMware Datastores Clusters Compatible with Specific Storage Policy Profiles

$server = Get-VBRServer -Type ESXi -Name "esx05.tech.local" 
$policy = Find-VBRViStoragePolicy -Server $server -Name "SP Virtual SAN Default"
Find-VBRViDatastoreCluster -StoragePolicy $policy -Name "vol2", "cluster0*"
This example shows how to get the list of the vol2 cluster datastores and cluster datastores which names start with cluster0*. These datastores are compatible with the SP Virtual SAN Default storage policy profile.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
2. Run the Find-VBRViStoragePolicy cmdlet. Specify the Server and Name parameter values. Save the result to the $policy variable.
3. Run the Find-VBRViDatastoreCluster cmdlet. Set the $policy variable as the StoragePolicy parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies an array of datastore cluster names. The cmdlet will return clusters with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies a host or cluster. The cmdlet will return the datastore clusters created on this host or cluster.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|true    |named   |True (ByPropertyName, ByValue)|

#### **StoragePolicy**
Specifies the VMware storage policy profile. The cmdlet will return datastores clusters compatible with this profile.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRViStoragePolicy]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Object

Veeam.Backup.PowerShell.Infos.VBRViStoragePolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Find-VBRViDatastoreCluster [-Name <String[]>] -Server <Object> [<CommonParameters>]
```
```PowerShell
Find-VBRViDatastoreCluster [-Name <String[]>] -StoragePolicy <VBRViStoragePolicy> [<CommonParameters>]
```
