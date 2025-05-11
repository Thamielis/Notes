Remove-NcSnapshotPolicySchedule
-------------------------------

### Synopsis
Remove a schedule from a snapshot policy.

---

### Description

Remove a schedule from a snapshot policy.

---

### Related Links
* [Get-NcSnapshotPolicy](Get-NcSnapshotPolicy)

* [Add-NcSnapshotPolicySchedule](Add-NcSnapshotPolicySchedule)

* [Set-NcSnapshotPolicySchedule](Set-NcSnapshotPolicySchedule)

---

### Examples
> Example 1

Remove-NcSnapshotPolicySchedule weeklyBackup daily
Remove the daily snapshots from the snapshot schedule policy 'weeklyBackup'.

Policy               Enabled SnapshotPolicySchedules
------               ------- -----------------------
weeklyBackup          False  {weekly (26)}

---

### Parameters
#### **Name**
The name of the snapshot scheduling policy to modify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Policy |

#### **Schedule**
The name of a schedule which will be removed from the snapshot policy.  Maximum length of this field can be 255 characters.  The schedule name may be any one of the reserved schedules like 'hourly', 'weekly' or 'daily' or it may be a user created schedule.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
API: snapshot-policy-remove-schedule
Family: cluster,vserver

---

### Syntax
```PowerShell
Remove-NcSnapshotPolicySchedule [-Name] <String> [-Schedule] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
