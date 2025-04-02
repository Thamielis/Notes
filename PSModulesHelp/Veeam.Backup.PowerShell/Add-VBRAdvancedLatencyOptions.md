Add-VBRAdvancedLatencyOptions
-----------------------------

### Synopsis
Defines latency settings for a specific datastore.

---

### Description

This creates the VBRAdvancedLatencyOptions object that defines latency settings for a specific datastore.

---

### Related Links
* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerVolume](Get-VBRHvServerVolume)

---

### Examples
> Example 1. Defining Latency Settings for VMware Datastore

$server = Get-VBRServer -Name esx06.tech.local
$datastore = Find-VBRViDatastore -Server $server
Add-VBRAdvancedLatencyOptions -ViDatastore $datastore -LatencyLimitMs 50
This example shows how to set the I/O latency limit of new tasks that are targeted at the VMware datastore to 50 ms.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViDatastore cmdlet. Set the $server variable as the Server parameter value. Save the result to the $datastore variable.
3. Run the Add-VBRAdvancedLatencyOptions cmdlet. Set the $datastore variable as the ViDatastore parameter value. Specify the LatencyLimitMs parameter value.
> Example 2. Defining Latency Settings for Hyper-V Datastores

$server = Get-VBRServer -Name hyperv09.tech.local
$volume = Get-VBRHvServerVolume -Server $server
Add-VBRAdvancedLatencyOptions -HvVolume $volume -ThrottlingIOLimitMs 40
This example shows how to set the I/O latency speed limit to 40 ms for The Hyper-V datastore.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerVolume cmdlet. Set the $server variable as the Server parameter value. Save the result to the $volume variable.
3. Run the Add-VBRAdvancedLatencyOptions cmdlet. Set the $volume variable as the HvVolume parameter value. Specify the ThrottlingIOLimitMs parameter value.

---

### Parameters
#### **HvVolume**
Specifies the following types of datastores:
* Microsoft Hyper-V
* Microsoft SMB3 servers
The cmdlet will define latency settings for these datastores.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRHvServerVolumeObject]`|true    |named   |True (ByPropertyName, ByValue)|

#### **LatencyLimitMs**
Specifies the I/O latency limit at which Veeam Backup & Replication will not assign new tasks that are targeted at the datastore.
Default: 20 ms.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ThrottlingIOLimitMs**
Specifies the I/O latency speed limit. When Veeam Backup & Replication reaches this limit, it will decrease the speed at which it either gets data from a datastore or writes data to it.
Default: 30 ms

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ViDatastore**
Specifies the VMware datastores. The cmdlet will define latency settings for these datastores.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRViDatastore]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViDatastore

Veeam.Backup.PowerShell.Infos.VBRHvServerVolumeObject

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAdvancedLatencyOptions -HvVolume <VBRHvServerVolumeObject> [-LatencyLimitMs <Int32>] [-ThrottlingIOLimitMs <Int32>] [<CommonParameters>]
```
```PowerShell
Add-VBRAdvancedLatencyOptions [-LatencyLimitMs <Int32>] [-ThrottlingIOLimitMs <Int32>] -ViDatastore <VBRViDatastore> [<CommonParameters>]
```
