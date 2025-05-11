Get-NcFeatureUsage
------------------

### Synopsis
Returns feature usage information in ONTAP features.

---

### Description

Returns feature usage information in ONTAP features. The  feature usage information is reported on a per controller node basis.

---

### Related Links
* [Get-NcFeatureUsageSummary](Get-NcFeatureUsageSummary)

---

### Examples
> Example 1

```PowerShell
Get-NcFeatureUsage -FeatureName nfs
Get usage information on the NFS feature from all nodes of a cluster

FeatureName     : nfs
Node            : aparajir-vsim1
NcController    : 10.238.49.117
DateCollected   : 1414175400
DateCollectedDT : 10/25/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim1
SerialNumber    : 1-81-0000000000000004084280333
UsageStatus     : in_use
WeekNumber      : 2

FeatureName     : nfs
Node            : aparajir-vsim1
NcController    : 10.238.49.117
DateCollected   : 1413570600
DateCollectedDT : 10/18/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim1
SerialNumber    : 1-81-0000000000000004084280333
UsageStatus     : in_use
WeekNumber      : 1

FeatureName     : nfs
Node            : aparajir-vsim1
NcController    : 10.238.49.117
DateCollected   : 1414780200
DateCollectedDT : 11/1/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim1
SerialNumber    : 1-81-0000000000000004084280333
UsageStatus     : in_use
WeekNumber      : 3

FeatureName     : nfs
Node            : aparajir-vsim1
NcController    : 10.238.49.117
DateCollected   : 1415989801
DateCollectedDT : 11/15/2014 12:00:01 AM
FeatureMessage  :
Owner           : aparajir-vsim1
SerialNumber    : 1-81-0000000000000004084280333
UsageStatus     : not_used
WeekNumber      : 5

FeatureName     : nfs
Node            : aparajir-vsim1
NcController    : 10.238.49.117
DateCollected   : 1415385000
DateCollectedDT : 11/8/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim1
SerialNumber    : 1-81-0000000000000004084280333
UsageStatus     : in_use
WeekNumber      : 4

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1414175400
DateCollectedDT : 10/25/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : not_used
WeekNumber      : 2

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1413570600
DateCollectedDT : 10/18/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : not_used
WeekNumber      : 1

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1414780200
DateCollectedDT : 11/1/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : not_used
WeekNumber      : 3

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1415989800
DateCollectedDT : 11/15/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : in_use
WeekNumber      : 5

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1415385000
DateCollectedDT : 11/8/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : not_used
WeekNumber      : 4

```
> Example 2

```PowerShell
Get-NcFeatureUsage -FeatureName nfs -Node aparajir-vsim2
Get usage information on the NFS feature from one node of a cluster

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1414175400
DateCollectedDT : 10/25/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : not_used
WeekNumber      : 2

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1413570600
DateCollectedDT : 10/18/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : not_used
WeekNumber      : 1

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1414780200
DateCollectedDT : 11/1/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : not_used
WeekNumber      : 3

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1415989800
DateCollectedDT : 11/15/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : in_use
WeekNumber      : 5

FeatureName     : nfs
Node            : aparajir-vsim2
NcController    : 10.238.49.117
DateCollected   : 1415385000
DateCollectedDT : 11/8/2014 12:00:00 AM
FeatureMessage  :
Owner           : aparajir-vsim2
SerialNumber    : 1-81-0000000000000004084280334
UsageStatus     : not_used
WeekNumber      : 4

```

---

### Parameters
#### **Node**
The name of the node(s) from which you want feature usage information.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Nodes  |

#### **FeatureName**
The name of one or more features on which you want usage information.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Feature|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[UsageStateInfo]`|false   |named   |false        |

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
Can be used to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[UsageStateInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Feature.UsageStateInfo

---

### Notes
Category: feature
API: feature-usage-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcFeatureUsage [[-Node] <String[]>] [[-FeatureName] <String[]>] [-Attributes <UsageStateInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFeatureUsage -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcFeatureUsage -Query <UsageStateInfo> [-Attributes <UsageStateInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
