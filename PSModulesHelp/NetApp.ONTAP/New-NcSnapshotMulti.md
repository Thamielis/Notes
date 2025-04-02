New-NcSnapshotMulti
-------------------

### Synopsis
Create a snapshot with the specific name on each of the specified volumes.

---

### Description

Create a snapshot with the specific name, on each of the specified volumes.  It is the caller's responsibility to ensure that the data in the snapshots across all volumes is consistent, by quiescing I/O to these volumes (or the LUNs of interest in these volumes), across the call to this API.  If an error occurs, it is possible that some snapshots may have been created.  Unless NoCleanup is specified, the API will attempt to delete these snapshots (but snapshot deletion may fail).  Otherwise, it is the user's responsibility to delete them.

---

### Related Links
* [Test-NcSnapshotMulti](Test-NcSnapshotMulti)

* [Get-NcSnapshot](Get-NcSnapshot)

---

### Examples
> Example 1

```PowerShell
New-NaSnapshotMulti vol1,vol2 snap1
Create a snapshot 'snap1' on volumes 'vol1' and 'vol2'.
```

---

### Parameters
#### **Volumes**
Names of the volumes across which the snapshot is to be created.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|Name<br/>Volume|

#### **SnapName**
Name of the snapshot to be created.  The maximum string length is 256 characters.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **NoCleanup**
When the API fails, some snapshots may have been created for some volumes.  By default, the API will attempt to delete these snapshots.  Note that newly created snapshots cannot be deleted right away until the snapshots are on-disk, which may take up to 10 secs.  When NoCleanup is specified, newly created snapshots are not deleted and users may delete them later as needed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GetSnapshots**
Specify to output the resulting snapshot objects instead of the multicreate result object.

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapshot.SnapshotMultiResult

---

### Notes
Category: snapshot
API: snapshot-multicreate
Family: vserver

---

### Syntax
```PowerShell
New-NcSnapshotMulti [-Volumes] <String[]> [-SnapName] <String> [-NoCleanup] [-GetSnapshots] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
