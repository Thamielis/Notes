Set-NcSnapshotPolicy
--------------------

### Synopsis
Modify a snapshot scheduling policy.

---

### Description

Modify a snapshot scheduling policy.

---

### Related Links
* [Get-NcSnapshotPolicy](Get-NcSnapshotPolicy)

* [Set-NcSnapshotPolicySchedule](Set-NcSnapshotPolicySchedule)

---

### Examples
> Example 1

Set-NcSnapshotPolicy weeklyBackup -Enabled $false
Disable the snapshot schedule policy 'weeklyBackup'.

Policy               Enabled SnapshotPolicySchedules
------               ------- -----------------------
weeklyBackup          False  {weekly (26)}

> Example 2

Set-NcSnapshotPolicy test -Comment "Comment goes here"
Sets a comment for a particular snapshot policy. This option is available only on ONTAP 8.3 or later.

Policy               Enabled SnapshotPolicySchedules
------               ------- -----------------------
test                  True   {weekly (3)}

PS > Get-NcSnapshotPolicy test | select Policy,Comment

Policy                                                      Comment
------                                                      -------
test                                                        Comment goes here

---

### Parameters
#### **Name**
The name of the snapshot scheduling policy to modify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Policy |

#### **Enabled**
Status of the snapshot policy indicating whether the policy will be enabled or disabled.  If set to true, the policy will be enabled.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Comment**
A human readable comment attached to a snapshot policy. Can be maximum of 256 characters long.
This parameter is available only on ONTAP 8.3 or later

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

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
API: snapshot-policy-modify
Family: cluster,vserver

---

### Syntax
```PowerShell
Set-NcSnapshotPolicy [-Name] <String> [-Enabled <Boolean>] [-Comment <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
