Suspend-NcClusterImageUpdate
----------------------------

### Synopsis
Pauses a package update that is currently in progress.

---

### Description

Pauses a package update that is currently in progress.

The update will pause at the end of the current logical operation. Logical operations include:
 - After the cluster validation, or prerequisite update phase
 - After the update of each node

---

### Related Links
* [Resume-NcClusterImageUpdate](Resume-NcClusterImageUpdate)

* [Start-NcClusterImageUpdate](Start-NcClusterImageUpdate)

* [Stop-NcClusterImageUpdate](Stop-NcClusterImageUpdate)

---

### Examples
> Example 1

```PowerShell
Suspend-NcClusterImageUpdate
WARNING: Upgrade will be paused only after completion of the current logical operation

NcController  : 10.225.215.73
Duration      : 0 min, 2 sec
NduPhase      : validation
PhaseComments : 2 of 2 validated.
PhaseStatus   : completed

NcController  : 10.225.215.73
Duration      : Est: 77 min
NduPhase      : ontap_updates
PhaseComments : 0 of 2 updated.
PhaseStatus   : pause_pending

```

---

### Parameters
#### **PackageVersion**
Specify the package version(s) to cancel. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[String]`|false   |named   |false        |Version<br/>Package|

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
* DataONTAP.C.Types.ClusterImage.ClusterImageNduPhaseListInfo

---

### Notes
Category: cluster image
API: cluster-image-update-resume
Family: cluster

---

### Syntax
```PowerShell
Suspend-NcClusterImageUpdate [-PackageVersion <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
