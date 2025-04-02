Get-NcClusterImageUpdateProgressOverview
----------------------------------------

### Synopsis
Get information on a node's image update progress

---

### Description

Get information on a node's image update progress

---

### Related Links
* [Get-NcClusterImageUpdateProgress](Get-NcClusterImageUpdateProgress)

* [Start-NcClusterImageUpdate](Start-NcClusterImageUpdate)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterImageUpdateProgressOverview
NcController                      : 10.238.49.117
CompletedNodeCount                : 
NduNodeUpdateList                 : 
NodeEstimatedDuration             : 
OverallElapsedDuration            : 0
OverallEstimatedDuration          : 0
OverallStatus                     : 
PackageVersion                    : 
PausedNodeCount                   : 
PhaseComments                     : 
TotalNodeCount                    : 
CompletedNodeCountSpecified       : False
NodeEstimatedDurationSpecified    : False
OverallElapsedDurationSpecified   : True
OverallEstimatedDurationSpecified : True
PausedNodeCountSpecified          : False
TotalNodeCountSpecified           : False

```

---

### Parameters
#### **DesiredAttributes**
Specifies the attributes that should be returned.

|Type              |Required|Position|PipelineInput|Aliases   |
|------------------|--------|--------|-------------|----------|
|`[NaSerializable]`|false   |named   |false        |Attributes|

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

#### **NodeName**
Name of the node for which update progress is to be retrieved

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |named   |true (ByPropertyName)|Node   |

#### **TemplateForClusterWideInfo**
Specifies to get an empty object that can be filled and input through the DesiredAttributes parameter for a cluster wide query.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **TemplateForNodeSpecificInfo**
Specifies to get an empty object that can be filled and input through the DesiredAttributes parameter for a node specific query.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterImage.NduProgressInfo

---

### Notes
Category: Cluster Image
API: cluster-image-node-update-progress-info,cluster-image-update-progress-info,
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterImageUpdateProgressOverview [-DesiredAttributes <NaSerializable>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateProgressOverview -NodeName <String> [-DesiredAttributes <NaSerializable>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateProgressOverview [-DesiredAttributes <NaSerializable>] -TemplateForClusterWideInfo [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterImageUpdateProgressOverview [-DesiredAttributes <NaSerializable>] -TemplateForNodeSpecificInfo [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
