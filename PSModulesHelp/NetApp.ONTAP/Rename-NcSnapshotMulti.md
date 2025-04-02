Rename-NcSnapshotMulti
----------------------

### Synopsis
Rename Snapshot copies with a specific name to a new name across multiple volumes.

---

### Description

Rename Snapshot copies with a specific name to a new name across multiple volumes. The cmdlet processes all the specified volumes even if rename fails on one or more volumes.

---

### Related Links
* [New-NcSnapshotMulti](New-NcSnapshotMulti)

* [Remove-NcSnapshotMulti](Remove-NcSnapshotMulti)

---

### Examples
> Example 1

Rename-NcSnapshotMulti -Volumes luns, luns_clone -Snapshot backup.2 -NewName backup.1
Rename the snapshot on multiple volumes.

Name                      Volume               Vserver                   Created      Total Cumulative Dependency
----                      ------               -------                   -------      ----- ---------- ----------
backup.1                  luns                 beam01                  2/26/2013   316.0 KB   316.0 KB
backup.1                  luns_clone           beam01                  2/26/2013   308.0 KB   308.0 KB

---

### Parameters
#### **Volumes**
Names of the volumes across which the snapshot is to be renamed.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|true    |1       |true (ByPropertyName)|TargetName|

#### **Snapshot**
The current snapshot name.

|Type      |Required|Position|PipelineInput        |Aliases                           |
|----------|--------|--------|---------------------|----------------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|SnapName<br/>SnapshotName<br/>Name|

#### **NewName**
The new snapshot name.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |3       |true (ByPropertyName)|NewSnapName|

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
* DataONTAP.C.Types.Snapshot.SnapshotInfo

---

### Notes
Category: snapshot
API: snapshot-multirename
Family: vserver

---

### Syntax
```PowerShell
Rename-NcSnapshotMulti [-Volumes] <String[]> [-Snapshot] <String> [-NewName] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
