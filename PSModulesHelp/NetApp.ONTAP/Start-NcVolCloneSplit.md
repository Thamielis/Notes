Start-NcVolCloneSplit
---------------------

### Synopsis
Begin the process by which the given clone is split off from its underlying parent volume and snapshot.

---

### Description

Begin the process by which the given clone is split off from its underlying parent volume and snapshot.  New storage is allocated for the clone that is distinct from its parent. This process may take some time and proceeds in the background.  Use Get-NcVolCloneSplit to view the operation's progress.  Both clone and parent volumes remain available during the process of splitting them apart.  Upon completion, the snapshot on which the clone was based will be unlocked in the parent volume.  Any snapshots in the clone are removed at the end of processing.  Use Stop-NcVolCloneSplit to stop this process.

A job is created to perform the split operation. The job id of the job is returned in the cmdlet response. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcVolCloneSplit](Get-NcVolCloneSplit)

* [Stop-NcVolCloneSplit](Stop-NcVolCloneSplit)

---

### Examples
> Example 1

```PowerShell
Start-NcVolCloneSplit vol2clone
Split volume clone 'vol2clone' from its parent volume.

NcController : 10.61.172.155
Status       : in_progress
JobId        : 564
ErrorCode    :
ErrorMessage :

```

---

### Parameters
#### **Name**
The name of the volume clone to split from its parent.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

#### **MatchParentStorageTier**
Specifies whether the FlexClone volume splits the data blocks by matching its parent storage tier.This option is applicable only if the tiering policy and the tiering minimum cooling days of the parent volume and the FlexClone volume are the same.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: volume
API: volume-clone-split-start
Family: vserver

---

### Syntax
```PowerShell
Start-NcVolCloneSplit [-Name] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [-MatchParentStorageTier <Boolean>] [<CommonParameters>]
```
