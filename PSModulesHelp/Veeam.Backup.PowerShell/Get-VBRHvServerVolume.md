Get-VBRHvServerVolume
---------------------

### Synopsis
Returns volume-specific settings for Microsoft Hyper-V hosts.

---

### Description

This cmdlet returns volume-specific settings for Microsoft Hyper-V hosts.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Getting Volume Settings for Microsoft HyperV Hosts

$server = Get-VBRServer -Name hyperv09.tech.local
Get-VBRHvServerVolume -Server $server
Id           : 5f11f8e1-f10e-43a0-b1ea-b7307c97331a
ServerId     : 0216cada-ed31-4c33-bdfe-b3b24beda391
MountPoint   : C:\
Type         : Local
VssProvider  : Veeam.Backup.PowerShell.Infos.VSSProviderObject
MaxSnapshots : 5

Id           : 3e1c1860-9632-4b9a-adb1-b70297c9669e
ServerId     : 617fb448-6aac-47cb-a94c-893eef8dc224
MountPoint   : D:\
Type         : Local
VssProvider  : Veeam.Backup.PowerShell.Infos.VSSProviderObject
MaxSnapshots : 4
This example shows how to get volume settings for Microsoft Hyper-V hosts.
The cmdlet output will contain the following settings Id, ServerId, MountPoint, Type, VssProvider and MaxSnapshots.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRHvServerVolume cmdlet. Set the $server variable as the Server parameter value.

---

### Parameters
#### **MountPoint**
Specifies a mount point of a Microsoft Hyper-V host. The cmdlet will return a Microsoft Hyper-V host with the specified mount point.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Server**
Specifies a Microsoft Hyper-V host added to the backup infrastructure. The cmdlet will return the volume-specific settings of this Microsoft Hyper-V host.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Type**
Specifies a type of volume that is added to a Microsoft Hyper-V host.
The cmdlet will return Microsoft Hyper-V hosts with the specified types of volumes of the specified types:
* Csv
* Cluster
* Local
* ScaleOut
* LocalShare
Valid Values:

* Csv
* Cluster
* Local
* ScaleOut
* LocalShare

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[EVBRHvVolumeType[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **VolumeId**
Specifies an ID of the volume that is added to a Microsoft Hyper-V host.
The cmdlet will return Microsoft Hyper-V host with the specified volume ID.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[Guid]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

Veeam.Backup.PowerShell.Infos.EVBRHvVolumeType[]

System.String

System.Guid

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRHvServerVolume [-MountPoint <String>] -Server <CHost> [-Type {Csv | Cluster | Local | ScaleOut | LocalShare}] [-VolumeId <Guid>] [<CommonParameters>]
```
