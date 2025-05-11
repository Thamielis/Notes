Set-NcSnapshotReserve
---------------------

### Synopsis
Sets the size of the indicated volume's snapshot reserve to the specified percentage.

---

### Description

Sets the size of the indicated volume's snapshot reserve to the specified percentage.  Reserve space can be used only by snapshots and not by the active file system.

---

### Related Links
* [Get-NcSnapshotReserve](Get-NcSnapshotReserve)

---

### Examples
> Example 1

```PowerShell
Set-NcSnapshotReserve vol2 10
Set the snapshot reserve on volume 'vol2' to 10%.

State                              : online
TotalSize                          : 11811160064
Used                               : 5
Available                          : 11219546112
Dedupe                             : False
FilesUsed                          : 96
FilesTotal                         : 499987
Aggregate                          : aggr1
Vserver                            : vserver1
NcController                       : 10.61.172.155
Name                               : vol2

```
> Example 2

Get-NcVol | Set-NcSnapshotReserve -Percentage 5 | select Name
Set the snapshot reserve on all volumes to 5%.

Name
----
bigvol
georgeVol1
vol_test
vol1
vol2
vol2clone
vserver1vol0

---

### Parameters
#### **Volume**
Name of volume on which to set the snapshot space reserve.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|Target<br/>Name|

#### **Percentage**
Percentage to set.  Range [0-100].

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int32]`|true    |2       |true (ByPropertyName)|Reserve|

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
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: snapshot
API: snapshot-set-reserve
Family: vserver

---

### Syntax
```PowerShell
Set-NcSnapshotReserve [-Volume] <String> [-Percentage] <Int32> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
