Resume-NcClusterImageUpdate
---------------------------

### Synopsis
Resumes a package  update that is currently paused.

---

### Description

Resumes a package  update that is currently paused.  The current paused update will resume from the last successful operation completed.

---

### Related Links
* [Start-NcClusterImageUpdate](Start-NcClusterImageUpdate)

* [Suspend-NcClusterImageUpdate](Suspend-NcClusterImageUpdate)

* [Stop-NcClusterImageUpdate](Stop-NcClusterImageUpdate)

* [Start-NcClusterImagePackageDownload](Start-NcClusterImagePackageDownload)

* [Get-NcClusterImagePackage](Get-NcClusterImagePackage)

---

### Examples
> Example 1

```PowerShell
Resume-NcClusterImageUpdate
NcController  : 10.225.215.73
Duration      : 0 min, 2 sec
NduPhase      : validation
PhaseComments : 2 of 2 validated.
PhaseStatus   : completed

NcController  : 10.225.215.73
Duration      : Est: 77 min
NduPhase      : ontap_updates
PhaseComments : 0 of 2 updated.
PhaseStatus   : in_progress

```

---

### Parameters
#### **IgnorePostUpdateChecksFailures**
Ignore post-update-check phase failures, if any

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Resume-NcClusterImageUpdate [-IgnorePostUpdateChecksFailures] [-PackageVersion <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
