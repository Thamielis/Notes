Set-NcPerfArchiveConfig
-----------------------

### Synopsis
Modify the current Performance Archive configuration.

---

### Description

Modify the current Performance Archive configuration.

---

### Related Links
* [Get-NcPerfArchiveConfig](Get-NcPerfArchiveConfig)

---

### Examples
> Example 1

```PowerShell
Set-NcPerfArchiveConfig -Enable -DatastoreMaxRetention 30 -DatastoreMaxPercent 8 -DatastoreFileRotation 12
Set the performance archive configuration.

DatastoreFileRotation          : 12
DatastoreMaxPercent            : 8
DatastoreMaxRetention          : 30
DatastoreMaxRetentionTS        : 30.00:00:00
IsEnabled                      : True
NcController                   : 10.63.165.62
Version                        : 8.2.0

```

---

### Parameters
#### **Enable**
If specified, enable the performance archive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Disable**
If specified, disable the performance archive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DatastoreMaxRetention**
Number of days to retain performance archive data.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **DatastoreMaxPercent**
Maximum percentage of root volume used for performance archive data.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **DatastoreFileRotation**
Minutes between performance archive data file rotations.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **PerfstatSamplingPeriod**
Minutes Between Perfstat Collection. Range: [0..60]

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **OpmFileRotation**
Minutes Between OPM Data File Rotations

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int16]`|false   |named   |true (ByPropertyName)|

#### **PerfstatDuration**
Minutes after Which Perfstat Collection Is Stopped.
This parameter is available in ONTAP 9.1 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **AsupFileRotation**
Minutes Between ASUP Data File Rotations
This parameter is available in ONTAP 9.2 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **AsupMaxRetention**
Days to Retain ASUP Archive Data.
This parameter is available in ONTAP 9.2 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Perf.ArchiveConfigInfo

---

### Notes
Category: perf
API: perf-archive-config-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcPerfArchiveConfig [-Enable] [-Disable] [-DatastoreMaxRetention <Int32>] [-DatastoreMaxPercent <Int32>] [-DatastoreFileRotation <Int32>] [-PerfstatSamplingPeriod <Int32>] 
```
```PowerShell
[-OpmFileRotation <Int16>] [-PerfstatDuration <Int32>] [-AsupFileRotation <Int32>] [-AsupMaxRetention <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
