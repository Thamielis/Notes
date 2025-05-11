New-NcSnapshotPolicy
--------------------

### Synopsis
Create a new snapshot scheduling policy.

---

### Description

Create a new snapshot scheduling policy.

---

### Related Links
* [Get-NcSnapshotPolicy](Get-NcSnapshotPolicy)

* [Remove-NcSnapshotPolicy](Remove-NcSnapshotPolicy)

---

### Examples
> Example 1

New-NcSnapshotPolicy weeklyBackup weekly 26 -Comment "Six months of weekly backups"
Create a new snapshot policy that retains 26 weeks of weekly snapshots.

Policy               Enabled SnapshotPolicySchedules
------               ------- -----------------------
weeklyBackup          True   {weekly (26)}

---

### Parameters
#### **Name**
The name of the snapshot scheduling policy which has to be created.  This cmdlet creates a snapshot policy and adds a schedule to it.  The maximum length of this string is 256 characters.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Policy |

#### **Schedule**
First schedule to be added inside the policy.  At least one schedule has to be added to create a policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Count**
Retention count for the snapshots created by the first schedule.  The count of all the snapshots to be retained for this policy cannot be more than 255.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |3       |false        |

#### **Prefix**
Snapshot name prefix for the first schedule.  Prefix name should be unique within the policy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Enabled**
Status of the snapshot policy indicating whether the policy will be enabled or disabled.  If set to true, the policy will be enabled.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Comment**
A human readable description associated with the snapshot policy.  The maximum length of this field can be 255 characters.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SnapmirrorLabel**
Label for SnapMirror Operations. Maximum length of this field is 31 characters.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Svm**
Existing SVM in which to create the Snapshot copy policy.To instantiate the Svm please create object using New-Object DataONTAP.C.Types.Snapshot.Svm. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput        |
|----------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Snapshot.Svm]`|false   |named   |true (ByPropertyName)|

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
API: snapshot-policy-create
Family: cluster, vserver

---

### Syntax
```PowerShell
New-NcSnapshotPolicy [-Name] <String> [-Schedule] <String> [-Count] <Int32> [-Prefix <String>] [-Enabled <Boolean>] [-Comment <String>] [-SnapmirrorLabel <String>] [-Svm 
```
```PowerShell
<DataONTAP.C.Types.Snapshot.Svm>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
