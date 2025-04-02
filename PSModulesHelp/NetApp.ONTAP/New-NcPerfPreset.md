New-NcPerfPreset
----------------

### Synopsis
Create a single Performance Preset configuration and all of its details.

---

### Description

Create a single Performance Preset configuration and all of its details.

---

### Related Links
* [Get-NcPerfPreset](Get-NcPerfPreset)

* [Get-NcPerfPresetDetailInfo](Get-NcPerfPresetDetailInfo)

* [Set-NcPerfPreset](Set-NcPerfPreset)

* [Remove-NcPerfPreset](Remove-NcPerfPreset)

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
#### **Name**
Name of the performance preset.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Preset |

#### **Comment**
Preset description.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Privilege**
Privilege level.  Possible values: admin, advanced, diagnostic.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Archived**
If specified, enable performance preset archival.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExpirationLengthMinutes**
Default expiration time in minutes until the performance preset will be automatically disabled.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Detail**
Details of the performance preset.  Use Get-NcPerfPresetDetailInfo to build PresetDetailInfo objects.

|Type                  |Required|Position|PipelineInput        |
|----------------------|--------|--------|---------------------|
|`[PresetDetailInfo[]]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Perf.PresetInfo

---

### Notes
Category: perf
API: perf-preset-create
Family: cluster

---

### Syntax
```PowerShell
New-NcPerfPreset [-Name] <String> [-Comment <String>] [-Privilege <String>] [-Archived] [-ExpirationLengthMinutes <Int32>] [-Detail <PresetDetailInfo[]>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
