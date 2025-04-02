New-NcConsistencyGroup
----------------------

### Synopsis
Starts the checkpoint cycle for externally synchronized checkpoints in the controller.

---

### Description

Starts the checkpoint cycle for externally synchronized checkpoints in the controller. This operation fences the specified volumes and returns a consistency group ID if successful. If the command succeeds, the call starts a snap create operation in these volumes.  In that case, this operation SHOULD be followed by a call to Save-NcConsistencyGroup.

---

### Related Links
* [Save-NcConsistencyGroup](Save-NcConsistencyGroup)

---

### Examples
> Example 1

New-NcConsistencyGroup -Snapshot s2_cg -Volumes aparajir_vol1,arc_san1 -Timeout relaxed -VserverContext primary1
Creating a consistency group with relaxed timeouts

NcController                                                                                         ConsistencyGroupID
------------                                                                                         ------------------
10.63.1.234                                                                                                   530204279

> Example 2

New-NcConsistencyGroup -Snapshot s1_cg -Volumes aparajir_vol1,arc_san1 -UserTimeout 100 -VserverContext primary1 -Immediate
Immediately commit a cg

PS >

On success, no output is displayed

> Example 3

```PowerShell
New-NcConsistencyGroup -Snapshot s2_cg -Volumes aparajir_vol1,arc_san1 -UserTimeout 100 -VserverContext primary1 | Save-NcConsistencyGroup -Verbose
Pipe the result to Save-NcConsistencyGroup. Effect is same as specifying the Immediate switch.

VERBOSE: Committing snapshots for consistency group 97188234.
VERBOSE: Consistency Group 97188234 committed

```

---

### Parameters
#### **Snapshot**
The provided name for the snapshot created in each volume. This name is the unique identifier by which the calling agent identifies the snapshots that constitute a checkpoint.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Volumes**
An array of volumes in this filer that is part of this CG operation

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **SnapmirrorLabel**
A human readable SnapMirror label to be attached with the consistency group snapshot copies. Maximum size - 31 characters

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Immediate**
Specify to commit the snapshots for this consistency group immediately.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Timeout**
Timeout selector. Possible values are 'urgent':5s 'medium':7s and 'relaxed':20s. The default value is medium

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **UserTimeout**
User specified timeout value in seconds. Range is [5,120]

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cg.ConsistencyGroupInfo

---

### Notes
Category: consistency group
API: cg-start, cg-commit, 
Family: vserver

---

### Syntax
```PowerShell
New-NcConsistencyGroup [-Snapshot] <String> [-Volumes] <String[]> [-SnapmirrorLabel <String>] [-Immediate] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcConsistencyGroup [-Snapshot] <String> [-Volumes] <String[]> [-SnapmirrorLabel <String>] [-Timeout] <String> [-Immediate] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcConsistencyGroup [-Snapshot] <String> [-Volumes] <String[]> [-SnapmirrorLabel <String>] -UserTimeout <Int32> [-Immediate] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
