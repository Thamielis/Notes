Remove-NcSnapshotMulti
----------------------

### Synopsis
Delete the snapshot from the given flexible volumes.

---

### Description

Delete the snapshot from the given flexible volumes.  All the volumes should be online when this cmdlet is invoked. It will only delete snapshots on Read-Write volumes. The cmdlet processes all the specified volumes even if remove fails on one or more volumes.

---

### Related Links
* [New-NcSnapshotMulti](New-NcSnapshotMulti)

* [Rename-NcSnapshotMulti](Rename-NcSnapshotMulti)

---

### Examples
> Example 1

```PowerShell
Remove-NcSnapshotMulti -Volumes luns, luns_clone -Snapshot backup.1
Remove the snapshot from the given volumes.
```

---

### Parameters
#### **Volumes**
Names of the volumes across which the snapshot is to be deleted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|true    |1       |true (ByPropertyName)|TargetName|

#### **Snapshot**
Name of the snapshot to be deleted.

|Type      |Required|Position|PipelineInput        |Aliases                           |
|----------|--------|--------|---------------------|----------------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|SnapName<br/>SnapshotName<br/>Name|

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: snapshot
API: snapshot-multidelete
Family: vserver

---

### Syntax
```PowerShell
Remove-NcSnapshotMulti [-Volumes] <String[]> [-Snapshot] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
