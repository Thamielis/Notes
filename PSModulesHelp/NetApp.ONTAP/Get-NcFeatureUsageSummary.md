Get-NcFeatureUsageSummary
-------------------------

### Synopsis
Returns feature usage summary information in ONTAP  features.

---

### Description

Returns feature usage summary information in ONTAP  features. The feature usage information is reported on a per  controller node basis.

---

### Related Links
* [Get-NcFeatureUsage](Get-NcFeatureUsage)

---

### Examples
> Example 1

```PowerShell
Get-NcFeatureUsageSummary -FeatureName nfs
Get usage summary of the nfs feature from all nodes in a cluster

FeatureName                : nfs
LastUsedTime               : 1415989800
LastUsedTimeDT             : 11/15/2014 12:00:00 AM
NcController               : 10.238.49.117
Owner                      : aparajir-vsim2
SerialNumber               : 1-81-0000000000000004084280334
WeeksConfigured            : 0
WeeksInUse                 : 1
WeeksNotAvailable          : 0
WeeksNotUsed               : 4
WeeksConfiguredSpecified   : True
WeeksInUseSpecified        : True
WeeksNotAvailableSpecified : True
WeeksNotUsedSpecified      : True

FeatureName                : nfs
LastUsedTime               : 1415385000
LastUsedTimeDT             : 11/8/2014 12:00:00 AM
NcController               : 10.238.49.117
Owner                      : aparajir-vsim1
SerialNumber               : 1-81-0000000000000004084280333
WeeksConfigured            : 0
WeeksInUse                 : 4
WeeksNotAvailable          : 0
WeeksNotUsed               : 1
WeeksConfiguredSpecified   : True
WeeksInUseSpecified        : True
WeeksNotAvailableSpecified : True
WeeksNotUsedSpecified      : True

```

---

### Parameters
#### **Owner**
Name of the controller node.

|Type        |Required|Position|PipelineInput        |Aliases       |
|------------|--------|--------|---------------------|--------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Node<br/>Nodes|

#### **FeatureName**
The name of one or more features on which you want usage information.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Feature|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[UsageSummaryInfo]`|false   |named   |false        |

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
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[UsageSummaryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Feature.UsageSummaryInfo

---

### Notes
Category: feature
API: feature-usage-summary-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcFeatureUsageSummary [[-Owner] <String[]>] [[-FeatureName] <String[]>] [-Attributes <UsageSummaryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFeatureUsageSummary -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFeatureUsageSummary -Query <UsageSummaryInfo> [-Attributes <UsageSummaryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
