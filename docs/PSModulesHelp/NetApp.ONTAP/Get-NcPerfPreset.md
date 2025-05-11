Get-NcPerfPreset
----------------

### Synopsis
Get performance presets.

---

### Description

Get performance presets.

---

### Related Links
* [New-NcPerfPreset](New-NcPerfPreset)

* [Set-NcPerfPreset](Set-NcPerfPreset)

* [Remove-NcPerfPreset](Remove-NcPerfPreset)

---

### Examples
> Example 1

Get-NcPerfPreset
Get all of the performance presets.

Preset               Privilege     IsReadOnly   IsArchiveEnabled  Comment
------               ---------     ----------   ----------------  -------
asup-event           diagnostic       True           False        The event-based AutoSupport Data ONTAP Performance...
asup-hourly          diagnostic       True            True        The hourly AutoSupport Data ONTAP Performance Arch...
default              diagnostic       True            True        The default Data ONTAP Performance Archive preset ...
diagnostic           diagnostic       True           False        The diagnostic Data ONTAP Performance Archive pres...

> Example 2

$q = Get-NcPerfPreset -Template
$q.IsArchiveEnabled = $true
Get-NcPerfPreset -Query $q
Get all of the performance presets that have archival enabled.

Preset               Privilege     IsReadOnly   IsArchiveEnabled  Comment
------               ---------     ----------   ----------------  -------
asup-hourly          diagnostic       True            True        The hourly AutoSupport Data ONTAP Performance Arch...
default              diagnostic       True            True        The default Data ONTAP Performance Archive preset ...

> Example 3

Get-NcPerfPreset default -Detailed
Get detailed information about the default performance preset.

ExpirationLengthMinutes   :
ExpirationLength          :
ExpirationEndDate         :
ExpirationEndDateDT       :
PresetDetails             : {aggregate:5s, aggregate:5m, aggregate:config, audit_ng:5s...}
Comment                   : The default Data ONTAP Performance Archive preset configuration. This preset configuration
                            includes essential counters to assist in general troubleshooting of system performance.
GenerationId              : 0
IsArchiveEnabled          : True
IsReadOnly                : True
Preset                    : default
Privilege                 : diagnostic
Uuid                      : 87af64db-706a-11e2-9600-123478563412
GenerationIdSpecified     : True
IsArchiveEnabledSpecified : True
IsReadOnlySpecified       : True

---

### Parameters
#### **Name**
Name of one or more presets.  Data ONTAP wildcards are accepted if the Detailed switch is not present.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Preset |

#### **Attributes**
For improved scalability in large clusters, provide an PresetInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcPerfPreset -Template" to get the initially empty PresetInfo object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PresetInfo]`|false   |named   |false        |

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

#### **Detailed**
If specified, get more detailed information about the performance presets.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Template**
Specify to get an empty PresetInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an PresetInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcPerfPreset -Template" to get the initially empty PresetInfo object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[PresetInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Perf.PresetInfo

---

### Notes
Category: perf
API: perf-preset-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcPerfPreset [[-Name] <String[]>] [-Attributes <PresetInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcPerfPreset [[-Name] <String[]>] -Detailed [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcPerfPreset -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcPerfPreset -Query <PresetInfo> [-Attributes <PresetInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
