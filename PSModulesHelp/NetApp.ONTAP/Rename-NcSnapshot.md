Rename-NcSnapshot
-----------------

### Synopsis
Rename a specified snapshot to a new name on a specified volume.

---

### Description

Rename a specified snapshot to a new name on a specified volume.

---

### Related Links
* [Get-NcSnapshot](Get-NcSnapshot)

* [New-NcSnapshot](New-NcSnapshot)

---

### Examples
> Example 1

Rename-NcSnapshot vol2 snap1 GoldenBackup1
Rename snapshot 'snap1' in volume 'vol2' to 'GoldenBackup1'.

Name                      Volume               Vserver
----                      ------               -------
GoldenBackup1             vol2                 vserver1

---

### Parameters
#### **Volume**
Name of the volume where the current snapshot and the new snapshot are located.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|TargetName|

#### **Snapshot**
Name of snapshot to be renamed.

|Type      |Required|Position|PipelineInput        |Aliases                           |
|----------|--------|--------|---------------------|----------------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|SnapName<br/>SnapshotName<br/>Name|

#### **NewName**
New name of snapshot as a result of the rename.

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
API: snapshot-rename
Family: vserver

---

### Syntax
```PowerShell
Rename-NcSnapshot [-Volume] <String> [-Snapshot] <String> [-NewName] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
