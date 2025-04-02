Get-NcClusterImageUpdateProgress
--------------------------------

### Synopsis
Get the status of all phases of update that is in progress.

---

### Description

Get the status of all phases of update that is in progress.

---

### Related Links
* [Start-NcClusterImageUpdate](Start-NcClusterImageUpdate)

* [Get-NcClusterImageUpdateLog](Get-NcClusterImageUpdateLog)

* [Get-NcClusterImageUpdateHistory](Get-NcClusterImageUpdateHistory)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterImageUpdateProgress
Duration      : 8 min, 28 sec
NcController  : 10.225.215.73
NduPhase      : ontap_updates
PhaseComments : 0 of 2 updated.
PhaseStatus   : canceled

Duration      : 0 min, 2 sec
NcController  : 10.225.215.73
NduPhase      : validation
PhaseComments : 2 of 2 validated.
PhaseStatus   : completed

```

---

### Parameters
#### **NduPhase**
Restrict results to updates in a particular NDU phase.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |1       |true (ByValue)|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterImageNduPhaseListInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  
Use "Get-NcClusterImageUpdateLog -Template" to get the initially empty ClusterImageNduPhaseListInfo object.  If not specified, all data is returned for each object. This parameter is supported with Ontapi only.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ClusterImageNduPhaseListInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty ClusterImageNduPhaseListInfo object for use with advanced queries involving the Query attribute. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterImageNduPhaseListInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterImageUpdateLog -Template" to get the initially empty ClusterImageNduPhaseListInfo object. This parameter is supported with Ontapi only.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ClusterImageNduPhaseListInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterImage.ClusterImageNduPhaseListInfo

---

### Notes
Category: cluster image
API: cluster-image-update-progress-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterImageUpdateProgress [[-NduPhase] <String[]>] [-Attributes <ClusterImageNduPhaseListInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateProgress [[-NduPhase] <String[]>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateProgress [[-NduPhase] <String[]>] -Query <ClusterImageNduPhaseListInfo> [-Attributes <ClusterImageNduPhaseListInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
