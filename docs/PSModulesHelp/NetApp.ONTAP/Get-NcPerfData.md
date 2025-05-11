Get-NcPerfData
--------------

### Synopsis
Get a list of current counter values of instances of an object.

---

### Description

Get a list of current counter values of instances of an object. This will return the values of all specified counters and instances of the specified object with one call.

---

### Related Links
* [Get-NcPerfCounter](Get-NcPerfCounter)

* [Get-NcPerfInstance](Get-NcPerfInstance)

* [Get-NcPerfObject](Get-NcPerfObject)

---

### Examples
> Example 1

Get-NcPerfData -Name volume -Instance luns -Counter avg_latency, total_ops
Get the volume perf counters avg_latency and total_ops for the volume "luns".

NcController : 10.60.189.172
Aggregation  : DataONTAP.C.Types.Perf.AggregationData
Counters     : {avg_latency, total_ops}
Name         : luns
Uuid         : f4cce431-574d-11e1-a865-123478563412

---

### Parameters
#### **Name**
Name of the object to get counter values for.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Object |

#### **Instance**
List of instance names for which to get counter values. This element can be used to limit data collection to a specified subset of the instances of the object.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|true    |named   |true (ByPropertyName)|Instances|

#### **Counter**
List of counters whose values will be retrieved. This element can be used to limit data collection to a specified subset of the counters of instances of the object.  If this element is absent, values of all counters will be retrieved.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Counters|

#### **PrivilegeLevel**
Name of the privilege level. Possible values: "basic", "admin", "advanced", "diag". If the element is absent, the default privilege of the object will be used.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FilterData**
A string, representing filter-data, in the format of key=value supporting multiple key-value pairs via comma separation.  The applied filter is a combination of ANDing the key-value pairs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SampleId**
Name of the sample.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Max**
Maximum number of instances.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |Aliases    |
|---------|--------|--------|---------------------|-----------|
|`[Int32]`|false   |named   |true (ByPropertyName)|MaxInstance|

#### **SortKey**
Counter used for sorting instances.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SortOrder**
Sort order. Possible values are 'ascending' and 'descending'.
This parameter is available in ONTAP 8.4 and later.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **InstanceUuid**
List of instance UUIDs for which to get counter values. This element can be used to limit data collection to a specified subset of the instances of the object.

|Type        |Required|Position|PipelineInput        |Aliases               |
|------------|--------|--------|---------------------|----------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|InstanceUuids<br/>Uuid|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Perf.InstanceData

---

### Notes
Category: perf
API: perf-object-get-instances
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcPerfData [-Name] <String> -Instance <String[]> [-Counter <String[]>] [-PrivilegeLevel <String>] [-FilterData <String>] [-SampleId <String>] [-Max <Int32>] [-SortKey <String>] 
```
```PowerShell
[-SortOrder <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcPerfData [-Name] <String> -InstanceUuid <String[]> [-Counter <String[]>] [-PrivilegeLevel <String>] [-FilterData <String>] [-SampleId <String>] [-Max <Int32>] [-SortKey <String>] 
```
```PowerShell
[-SortOrder <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
