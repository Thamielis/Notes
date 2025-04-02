Set-NcSnapshot
--------------

### Synopsis
Modify the attributes of a snapshot.

---

### Description

Modify the attributes of a snapshot.

---

### Related Links
* [Get-NcSnapshot](Get-NcSnapshot)

* [Update-NcSnapshot](Update-NcSnapshot)

---

### Examples
> Example 1

set-ncsnapshot -Vserver beam01 -Volume luns -Snapshot backup.0 -SnapmirrorLabel monthly
Set the snapmirror label for the snapshot.

Name                      Volume               Vserver                   Created      Total Cumulative Dependency
----                      ------               -------                   -------      ----- ---------- ----------
backup.0                  luns                 beam01                  2/20/2013    56.0 KB    56.0 KB

---

### Parameters
#### **Snapshot**
Name of the snapshot to be edited.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Volume**
Volume name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Vserver**
Name of the vserver to which this volume belongs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **SnapmirrorLabel**
A human readable SnapMirror Label attached with the snapshot.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **Comment**
A comment associated with the Snapshot copy. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
API: snapshot-modify-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Set-NcSnapshot [-Snapshot] <String> [-Volume] <String> [-Vserver] <String> [-SnapmirrorLabel] <String> [-Comment <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
