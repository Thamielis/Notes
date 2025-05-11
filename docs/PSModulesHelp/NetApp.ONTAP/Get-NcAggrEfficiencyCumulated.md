Get-NcAggrEfficiencyCumulated
-----------------------------

### Synopsis
Display the cumulated efficiency ratio for the specified aggregates

---

### Description

Display the cumulated efficiency ratio for the specified aggregates

---

### Examples
> Example 1

```PowerShell
PS E:\Debug> $a = Get-NcAggrEfficiencyCumulated
PS E:\Debug> $a.AggrEfficiencyCumulatedInfo
AggrEfficiencyCumulatedAdditionalDetailsInfo    : DataONTAP.C.Types.Aggr.AggrEfficiencyCumulatedAdditionalDetailsInfo
AggrEfficiencyCumulatedAggrInfo                 : DataONTAP.C.Types.Aggr.AggrEfficiencyCumulatedAggrInfo
AggrEfficiencyCumulatedSnapshotAndFlexcloneInfo : DataONTAP.C.Types.Aggr.AggrEfficiencyCumulatedSnapshotAndFlexcloneInf
                                                  o
AggrEfficiencyCumulatedVolumeInfo               : DataONTAP.C.Types.Aggr.AggrEfficiencyCumulatedVolumeInfo
AggrEfficiencyTotalCumulatedInfo                : DataONTAP.C.Types.Aggr.AggrEfficiencyTotalCumulatedInfo
NcController                                    :

```

---

### Parameters
#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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
* DataONTAP.C.Types.Aggr.AggrEfficiencyCumulatedInfo

---

### Notes
Category: aggr
API: aggr-efficiency-cumulated-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrEfficiencyCumulated [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
