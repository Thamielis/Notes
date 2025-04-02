Get-NcPerfPresetDetailInfo
--------------------------

### Synopsis
Get a perf PresetDetailInfo object.

---

### Description

Get a perf PresetDetailInfo object.  Use with New-NcPerfPreset.

---

### Related Links
* [New-NcPerfPreset](New-NcPerfPreset)

---

### Examples
> Example 1

$presetDetails = @()
$presetDetails += Get-NcPerfPresetDetailInfo -Object volume -Counter read_data, write_data -SamplePeriod 5m
$presetDetails += Get-NcPerfPresetDetailInfo -Object volume -Counter write_ops, write_latency, read_ops, read_latency -SamplePeriod 1m
New-NcPerfPreset -Name powershell_volume -Comment "Collect perf data for volumes." -Detail $presetDetails
Create a new performance preset for volume perf data.

Preset               Privilege     IsReadOnly   IsArchiveEnabled  Comment
------               ---------     ----------   ----------------  -------
powershell_volume    diagnostic      False           False        Collect perf data for volumes.

---

### Parameters
#### **Object**
Performance object.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Counter**
Set of counter names.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

#### **SamplePeriod**
Performance archive sample period.  Possible Values: none, 1s, 5s, 10s, 30s, 1m, 5m, 10m, 30m, 1h, 6h, 12h, 1d, 1w, config
Valid Values:

* none
* 1s
* 5s
* 10s
* 30s
* 1m
* 5m
* 10m
* 30m
* 1h
* 6h
* 12h
* 1d
* 1w
* config

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Filter**
Instance filters.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Perf.PresetDetailInfo

---

### Notes
Category: perf
Family: cluster

---

### Syntax
```PowerShell
Get-NcPerfPresetDetailInfo [-Object] <String> [-Counter] <String[]> [-SamplePeriod <String>] [-Filter <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
