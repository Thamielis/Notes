Get-NcSnapshotReserve
---------------------

### Synopsis
Gets the percentage of disk space that is reserved for snapshots.

---

### Description

Gets the percentage of disk space that is reserved for snapshots in the indicated volume.  If no volume is specified, this will return the percentage of disk space reserved for snapshots for each of the volumes in the system.  Reserve space can be used only by snapshots and not by the active file system.

---

### Related Links
* [Set-NcSnapshotReserve](Set-NcSnapshotReserve)

---

### Examples
> Example 1

Get-NcSnapshotReserve
Get the snapshot reserve for all volumes.

Volume                    Vserver                    Size Percentage
------                    -------                    ---- ----------
bigvol                    vserver1                 5.0 GB         5%
georgeVol1                vserver1                 1.0 MB         5%
vol1                      vserver1                 1.0 GB         5%
vol2                      vserver1               563.2 MB         5%
vol2clone                 vserver1               563.2 MB         5%
vol_test                  vserver1                 1.0 MB         5%
vserver1vol0              vserver1                 1.0 MB         5%

---

### Parameters
#### **Volume**
Volume to query for percentage of space reserved for snapshots.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|false   |1       |true (ByPropertyName)|TargetName<br/>Name|

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
* DataONTAP.C.Types.Snapshot.SnapshotReserveDetailInfo

---

### Notes
Category: snapshot
API: snapshot-reserve-list-info
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSnapshotReserve [[-Volume] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
