Remove-NcJobIntervalSchedule
----------------------------

### Synopsis
Delete a single interval job schedule entry.

---

### Description

Delete a single interval job schedule entry.  The entry must not be in use.

---

### Related Links
* [Get-NcJobIntervalSchedule](Get-NcJobIntervalSchedule)

* [Add-NcJobIntervalSchedule](Add-NcJobIntervalSchedule)

* [Set-NcJobIntervalSchedule](Set-NcJobIntervalSchedule)

---

### Examples
> Example 1

```PowerShell
Remove-NcJobIntervalSchedule interval1
Delete interval schedule 'interval1'.
```

---

### Parameters
#### **Name**
The name of the interval job schedule to destroy.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|JobScheduleName|

#### **JobScheduleCluster**
The cluster owner of the job schedule. Defaults to the local cluster. In a Metrocluster configuration, the partner cluster can be specified.
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* 

---

### Notes
Category: job
API: job-schedule-interval-destroy
Family: cluster

---

### Syntax
```PowerShell
Remove-NcJobIntervalSchedule [-Name] <String> [-JobScheduleCluster <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
