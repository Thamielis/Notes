Set-NcSnapshotPolicySchedule
----------------------------

### Synopsis
Modify a snapshot policy.

---

### Description

Modify a snapshot policy.

---

### Related Links
* [Get-NcSnapshotPolicy](Get-NcSnapshotPolicy)

* [Add-NcSnapshotPolicySchedule](Add-NcSnapshotPolicySchedule)

* [Remove-NcSnapshotPolicySchedule](Remove-NcSnapshotPolicySchedule)

---

### Examples
> Example 1

Set-NcSnapshotPolicySchedule weeklyBackup weekly 52
Set the snapshot schedule policy 'weeklyBackup' to retain 52 weekly snapshots.

Policy               Enabled SnapshotPolicySchedules
------               ------- -----------------------
weeklyBackup          False  {weekly (52)}

---

### Parameters
#### **Name**
The snapshot scheduling policy to modify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Policy |

#### **Schedule**
The name of a schedule to be modified.  Maximum length of this field can be 255 characters.  The schedule name may be any one of the reserved schedules like 'hourly', 'weekly' or 'daily' or it may be a user created schedule.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Count**
The new retention count for the schedule.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |3       |false        |

#### **SnapmirrorLabel**
The new SnapMirror Label for the schedule. This label will be used to define vaulting policies at a vault destination. If an empty label is specified, the existing label will be deleted. The maximum length of this field is 31 characters.

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
API: snapshot-policy-modify-schedule
Family: cluster, vserver

---

### Syntax
```PowerShell
Set-NcSnapshotPolicySchedule [-Name] <String> [-Schedule] <String> [-Count] <Int32> [-SnapmirrorLabel <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
