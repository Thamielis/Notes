Add-NcSnapshotPolicySchedule
----------------------------

### Synopsis
Add a new schedule to a snapshot policy.

---

### Description

Add a new schedule to a snapshot policy.

---

### Related Links
* [Get-NcSnapshotPolicy](Get-NcSnapshotPolicy)

* [Remove-NcSnapshotPolicySchedule](Remove-NcSnapshotPolicySchedule)

* [Set-NcSnapshotPolicySchedule](Set-NcSnapshotPolicySchedule)

---

### Examples
> Example 1

Add-NcSnapshotPolicySchedule weeklyBackup daily 6
Add six daily snapshots to the weekly backup snapshot policy.

Policy               Enabled SnapshotPolicySchedules
------               ------- -----------------------
weeklyBackup          False  {weekly (26), daily (6)}

---

### Parameters
#### **Name**
The name of the snapshot scheduling policy to modify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Policy |

#### **Schedule**
The name of a new schedule to be added to the snapshot policy.  Maximum length of this field can be 255 characters.  The schedule name may be any one of the reserved schedules like 'hourly', 'weekly' or 'daily' or it may be a user created schedule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Count**
The maximum number of snapshots to be retained for the schedule.  The count of all the snapshots for to be retained for this policy cannot be more than 255.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |3       |false        |

#### **Prefix**
The snapshot name prefix for the schedule.  This field should be unique within the policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SnapmirrorLabel**
The SnapMirror Label for the schedule. This label will be used to define vaulting policies at a vault destination. Maximum length of this field is 31 characters

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
* DataONTAP.C.Types.Snapshot.SnapshotPolicyInfo

---

### Notes
Category: snapshot
API: snapshot-policy-add-schedule
Family: cluster, vserver

---

### Syntax
```PowerShell
Add-NcSnapshotPolicySchedule [-Name] <String> [-Schedule] <String> [-Count] <Int32> [-Prefix <String>] [-SnapmirrorLabel <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
