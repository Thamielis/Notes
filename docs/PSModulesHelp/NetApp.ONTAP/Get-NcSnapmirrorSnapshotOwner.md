Get-NcSnapmirrorSnapshotOwner
-----------------------------

### Synopsis
Get owners used to preserve a Snapshot copy for a SnapMirror mirror-to-vault cascade configuration.

---

### Description

Get owners used to preserve a Snapshot copy for a SnapMirror mirror-to-vault cascade configuration.

---

### Related Links
* [Add-NcSnapmirrorSnapshotOwner](Add-NcSnapmirrorSnapshotOwner)

* [Remove-NcSnapmirrorSnapshotOwner](Remove-NcSnapmirrorSnapshotOwner)

---

### Examples
> Example 1

Get-NcSnapmirrorSnapshotOwner beam01 luns
Get all of the snapshot owners for the luns volume on vserver beam01.

NcController : 10.63.165.62
Vserver      : beam01
Volume       : luns
Snapshot     : snapmirror.f57fc6fe-81e3-11e2-86af-123478563412_2147485092.2013-02-28_204559
Owners       : {-}

---

### Parameters
#### **Vserver**
Vserver name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Volume**
Volume name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Snapshot**
Snapshot copy name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Snapmirror.SnapshotOwner

---

### Notes
Category: snapmirror
API: snapmirror-snapshot-owner-get,snapmirror-snapshot-owner-get-snapshots
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSnapmirrorSnapshotOwner [-Vserver] <String> [-Volume] <String> [[-Snapshot] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
