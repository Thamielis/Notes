Get-NcPerfArchiveConfig
-----------------------

### Synopsis
Get the current Performance Archive configuration.

---

### Description

Get the current Performance Archive configuration.

---

### Related Links
* [Set-NcPerfArchiveConfig](Set-NcPerfArchiveConfig)

---

### Examples
> Example 1

```PowerShell
Get-NcPerfArchiveConfig
Get the performance archive configuration.

DatastoreFileRotation          : 15
DatastoreMaxPercent            : 10
DatastoreMaxRetention          : 28
DatastoreMaxRetentionTS        : 28.00:00:00
IsEnabled                      : True
NcController                   : 10.63.165.62
Version                        : 8.2.0

```

---

### Parameters
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
* DataONTAP.C.Types.Perf.ArchiveConfigInfo

---

### Notes
Category: perf
API: perf-archive-config-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcPerfArchiveConfig [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
