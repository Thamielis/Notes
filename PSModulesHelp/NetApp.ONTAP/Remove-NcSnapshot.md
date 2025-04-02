Remove-NcSnapshot
-----------------

### Synopsis
Delete a snapshot on a specified volume.

---

### Description

Delete a snapshot on a specified volume.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [New-NcSnapshot](New-NcSnapshot)

* [Get-NcSnapshot](Get-NcSnapshot)

---

### Examples
> Example 1

```PowerShell
Remove-NcSnapshot vol2 snap1
Remove snapshot 'snap1' from volume 'vol2'.
```
> Example 2

```PowerShell
Get-NcSnapshot vol2 snap* | Remove-NcSnapshot
Remove all snapshots with names starting with 'snap' from volume 'vol2'.
```

---

### Parameters
#### **Volume**
Name of the volume on which the snapshot is to be deleted.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|TargetName|

#### **Snapshot**
Name of snapshot to be deleted on the specified volume.

|Type      |Required|Position|PipelineInput        |Aliases                           |
|----------|--------|--------|---------------------|----------------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|SnapName<br/>SnapshotName<br/>Name|

#### **Uuid**
The 128 bit unique snapshot identifier expressed in the form of UUID.  This field is optional and can appear together with 'snapshot' to uniquely identify a snapshot for deletion.  An example of an actual UUID is: 73a010ec-3d28-11df-84e8-123478563412

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|false   |named   |true (ByPropertyName)|SnapshotInstanceUUID|

#### **IgnoreOwners**
If specified, snapshot will be deleted even if some other processes are accessing it.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **InfiniteVolume**
Specify the InfiniteVolume parameter to indicate the volume is an Infinite Volume.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|IsInfiniteVolume|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: snapshot
API: snapshot-delete
Family: vserver

---

### Syntax
```PowerShell
Remove-NcSnapshot [-Volume] <String> [-Snapshot] <String> [-Uuid <String>] [-IgnoreOwners] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcSnapshot [-Volume] <String> [-Snapshot] <String> [-Uuid <String>] [-IgnoreOwners] -InfiniteVolume [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
