Set-VBRHvServerVolume
---------------------

### Synopsis
Modifies volume-specific settings for Microsoft Hyper-V hosts.

---

### Description

This cmdlet modifies volume-specific settings for Microsoft Hyper-V hosts. This cmdlet modifies an existing VMware replication job.
To modify settings, you need to specify new values for the necessary parameters. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRHvServerVolume](Get-VBRHvServerVolume)

---

### Examples
> Example 1. Modifying VSS Provider Settings

$server = Get-VBRServer -Name hyperv09.tech.local
$volume = Get-VBRHvServerVolume -Server $server
$provider = Get-VBRHvVssProvider -Server $server -Name "Microsoft File Share Shadow Copy provider"
Set-VBRHvServerVolume -Volume $volume -VSSProvider $provider
This example shows how to modify volume-specific settings and set a VSS provider for a volume located on the Microsoft Hyper-V host.
Veeam Backup & Replication will use the Microsoft File Share Shadow Copy provider to create VSS snapshots of the volume.
Perform the following steps:
1. Get the volume settings:
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
b. Run the Get-VBRHvServerVolume cmdlet. Set the $server variable as the Server parameter value. Save the result to the $volume variable.
2. Run the Get-VBRHvVssProvider cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value. Save the result to the $provider variable.
3. Run the Set-VBRHvServerVolume cmdlet. Set the $volume variable as the Volume parameter value. Set the $provider variable as the VSSProvider parameter value.
> Example 2. Modifying Number of Snapshots

$server = Get-VBRServer -Name hyperv09.tech.local
$volume = Get-VBRHvServerVolume -Server $server
Set-VBRHvServerVolume -Volume $volume -MaxSnapshots 3
This example shows how to modify volume-specific settings and set a number of snapshots that you can store simultaneously on one volume.
Veeam Backup & Replication will store a maximum 3 snapshots on the volume.
Perform the following steps:
1. Get the volume settings:
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
b. Run the Get-VBRHvServerVolume cmdlet. Set the $server variable as the Server parameter value. Save the result to the $volume variable.
2. Run the Set-VBRHvServerVolume cmdlet. Set the $volume variable as the Volume parameter value. Specify the MaxSnapshots parameter value.

---

### Parameters
#### **MaxSnapshots**
Specifies a number of snapshots that you can store simultaneously for one volume. The cmdlet will set the specified number of snapshots for the volume.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Int32]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Volume**
Specifies an array of volume-specific settings for Microsoft Hyper-V hosts. The cmdlet will modify these settings.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRHvServerVolumeObject[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **VSSProvider**
Specifies the VSS provider for a volume. The cmdlet will set this VSS provider to take a VSS snapshot of the volume.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VSSProviderObject]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRHvServerVolumeObject[]

Veeam.Backup.PowerShell.Infos.VSSProviderObject

System.Int32

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvServerVolume [-MaxSnapshots <Int32>] -Volume <VBRHvServerVolumeObject[]> [-VSSProvider <VSSProviderObject>] [<CommonParameters>]
```
