Get-VBRAdvancedLatencyOptions
-----------------------------

### Synopsis
Returns latency settings for a specific datastore.

---

### Description

This cmdlet returns latency settings for a specific datastore.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Get-VBRHvServerVolume](Get-VBRHvServerVolume)

---

### Examples
> Example 1. Getting Latency Settings for all Datastores

Get-VBRAdvancedLatencyOptions
DatastoreId     LatencyLimitMs ThrottlingIOLimitMs Id
-----------     -------------- ------------------- --
datastore-45443            999                 999 34879a65-415b-4243-a195-d7ea52af79dc
datastore-45474            790                 530 c0a6feb4-a289-4f93-8301-dc7b273f224e
datastore-45474            500                 430 270ab173-2903-4cf4-80a6-4bd2256bebf5
This command returns latency settings for all datastores added to your backup infrastructure.
The cmdlet output will contain the following details on the datastore latency settings: DatastoreId, LatencyLimitMs, ThrottlingIOLimitMs.
> Example 2. Getting Latency Settings for VMware Datastore

$server = Get-VBRServer -Name esx06.tech.local
$datastore = Find-VBRViDatastore -Server $server
Get-VBRAdvancedLatencyOptions -ViDatastore $datastore
DatastoreId     LatencyLimitMs ThrottlingIOLimitMs Id
-----------     -------------- ------------------- --
datastore-45443            999                 999 34879a65-415b-4243-a195-d7ea52af79dc
This example shows how to get latency settings of the datastore-45443 VMware datastore that is located on the esx06.tech.local ESXi host.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Find-VBRViDatastore cmdlet. Set the $server variable as the Server parameter value. Save the result to the $datastore variable.
3. Run the Get-VBRAdvancedLatencyOptions cmdlet. Set the $datastore variable as the ViDatastore parameter value.
The cmdlet output will contain the following details on the datastore latency settings: DatastoreId, LatencyLimitMs, ThrottlingIOLimitMs.
> Example 3. Getting Latency Settings for Hyper-V Datastores

$server = Get-VBRServer -Name hyperv09.tech.local
$volume = Get-VBRHvServerVolume -Server $server
Get-VBRAdvancedLatencyOptions -HvVolume $volume
DatastoreId     LatencyLimitMs ThrottlingIOLimitMs Id
-----------     -------------- ------------------- --
datastore-45474            500                 430 270ab173-2903-4cf4-80a6-4bd2256bebf5
Get latency settings of the datastore-45474 Hyper-V datastores that is located on the hyperv09.tech.local volume.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerVolume cmdlet. Set the $server variable as the Server parameter value. Save the result to the $volume variable.
3. Run the Get-VBRAdvancedLatencyOptions cmdlet. Set the $volume variable as the HvVolume parameter value.
The cmdlet output will contain the following details on the datastore latency settings: DatastoreId, LatencyLimitMs, ThrottlingIOLimitMs.

---

### Parameters
#### **HvVolume**
Specifies the following types of datastores:
* Microsoft Hyper-V
* Microsoft SMB3 servers
The cmdlet will return the latency settings for these datastores.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRHvServerVolumeObject]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ViDatastore**
Specifies the VMware datastores. The cmdlet will return the latency settings for these datastores.

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
Get-VBRAdvancedLatencyOptions -HvVolume <VBRHvServerVolumeObject> [<CommonParameters>]
```
```PowerShell
Get-VBRAdvancedLatencyOptions -ViDatastore <VBRViDatastore> [<CommonParameters>]
```
