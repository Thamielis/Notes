Get-NcClusterImageUpdateHistory
-------------------------------

### Synopsis
Get history records of update operations on this cluster

---

### Description

Get history records of update operations on this cluster

---

### Related Links
* [Start-NcClusterImageUpdate](Start-NcClusterImageUpdate)

* [Start-NcClusterImagePackageDownload](Start-NcClusterImagePackageDownload)

* [Get-NcClusterImagePackage](Get-NcClusterImagePackage)

* [Get-NcClusterImageUpdateLog](Get-NcClusterImageUpdateLog)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterImageUpdateHistory
CompletionTime  : 1403155555
ComponentId     : f3250-215-73-75-02
ComponentName   : Node
NcController    : 10.225.215.73
PackageVersion  : Fullsteam__8.3.0
PreviousVersion : Fullsteam__8.3.0
StartTime       : 1403155115
UpdatedVersion  : 8.3RC1
UpdateStatus    : canceled

CompletionTime  : 1403155555
ComponentId     : f3250-215-73-75-01
ComponentName   : Node
NcController    : 10.225.215.73
PackageVersion  : Fullsteam__8.3.0
PreviousVersion : Fullsteam__8.3.0
StartTime       : 1403155115
UpdatedVersion  : 8.3RC1
UpdateStatus    : canceled

```

---

### Parameters
#### **PackageVersion**
Restrict results to specific package versions.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Version<br/>Package|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterUpdateHistoryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  
Use "Get-NcClusterImageUpdateHistory -Template" to get the initially empty ClusterUpdateHistoryInfo object.  If not specified, all data is returned for each object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[ClusterUpdateHistoryInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **UpdateStatus**
Restrict results to updates with specific status: successful, cancelled or back_out .

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Status |

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
Specify to get an empty ClusterUpdateHistoryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterUpdateHistoryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterImageUpdateHistory -Template" to get the initially empty ClusterUpdateHistoryInfo object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[ClusterUpdateHistoryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterImage.ClusterUpdateHistoryInfo

---

### Notes
Category: cluster image
API: cluster-image-update-history-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterImageUpdateHistory [[-PackageVersion] <String[]>] [-Attributes <ClusterUpdateHistoryInfo>] [-Controller <NcController[]>] [-UpdateStatus <String[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateHistory -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateHistory -Query <ClusterUpdateHistoryInfo> [-Attributes <ClusterUpdateHistoryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
