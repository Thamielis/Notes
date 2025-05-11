Start-NcClusterImageUpdate
--------------------------

### Synopsis
Validates and installs prerequisite component updates, and installs Data ONTAP to all  specified nodes within a cluster in a non-disruptive manner.

---

### Description

Validates and installs prerequisite component updates, and installs Data ONTAP to all  specified nodes within a cluster in a non-disruptive manner. 

Note: The package must already be downloaded using Start-NcClusterImagePackageDownload cmdlet

---

### Related Links
* [Suspend-NcClusterImageUpdate](Suspend-NcClusterImageUpdate)

* [Stop-NcClusterImageUpdate](Stop-NcClusterImageUpdate)

* [Start-NcClusterImagePackageDownload](Start-NcClusterImagePackageDownload)

* [Test-NcClusterImage](Test-NcClusterImage)

---

### Examples
> Example 1

Start-NcClusterImageUpdate Fullsteam__8.3.0
Upgrading package
Are you sure you want to start upgrate to package Fullsteam__8.3.0?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

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

---

### Parameters
#### **PackageVersion**
Specify the package version(s) to update to.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Version<br/>Package|

#### **Nodes**
Specify the nodes to be updated.

|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|NodeNames<br/>Node|

#### **StabilizeMinutes**
Specify the number of minutes needed to stabilize node before update.

|Type     |Required|Position|PipelineInput        |Aliases      |
|---------|--------|--------|---------------------|-------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|StabilizeTime|

#### **PauseAfter**
One or more pause options can be specified : all or none

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IgnoreValidationWarning**
Specify to allow the update to continue if warnings are encountered during validation phase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ForceRolling**
Specify to force a rolling upgrade on the cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EstimateOnly**
Specify to generate a report of the steps involved in the update process. THIS DOES NOT UPDATE the cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShowValidationDetails**
If the value is set to true, then all validation details will be shown in the output. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: cluster-image-update
Family: cluster

---

### Syntax
```PowerShell
Start-NcClusterImageUpdate [-PackageVersion] <String> [[-Nodes] <String[]>] [-StabilizeMinutes <Int64>] [-PauseAfter <String>] [-IgnoreValidationWarning] [-ForceRolling] [-EstimateOnly] 
```
```PowerShell
[-ShowValidationDetails <SwitchParameter>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
