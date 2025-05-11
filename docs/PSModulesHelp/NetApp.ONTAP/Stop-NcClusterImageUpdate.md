Stop-NcClusterImageUpdate
-------------------------

### Synopsis
Cancel a package update that is currently in progress.

---

### Description

Cancel a package update that is currently in progress. The update will stop and be canceled at the end of the current logical operation. 
Logical operations are:	
  - After the cluster validation, or prerequisite update phase
  - After the update of each HA pair
  - Immediately, if the update is currently paused

After the successful completion of this command the update will be removed from the package update queue.  The cancellation will be logged in the update history.

---

### Related Links
* [Start-NcClusterImageUpdate](Start-NcClusterImageUpdate)

* [Resume-NcClusterImageUpdate](Resume-NcClusterImageUpdate)

* [Suspend-NcClusterImageUpdate](Suspend-NcClusterImageUpdate)

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
Category: Cluster Image
API: cluster-image-update-cancel
Family: cluster

---

### Syntax
```PowerShell
Stop-NcClusterImageUpdate [-PackageVersion <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
