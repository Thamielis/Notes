Get-NcPerfCounter
-----------------

### Synopsis
Get information about the counters of an object.

---

### Description

Get information about the counters of an object.  This information is static and independent of any particular instance of the object. It includes counter names and descriptions, as well as properties which are necessary to to interpret counter values.

---

### Related Links
* [Get-NcPerfData](Get-NcPerfData)

* [Get-NcPerfInstance](Get-NcPerfInstance)

* [Get-NcPerfObject](Get-NcPerfObject)

---

### Examples
> Example 1

```PowerShell
Get-NcPerfCounter volume
Get the performance counters for the volume object.

NcController            : 10.60.189.172
AggregationStyle        :
BaseCounter             :
Desc                    : Number of asynchronous frees per second to the volume
Labels                  :
Name                    : asynchronous_frees
PrivilegeLevel          : diag
Properties              : rate
TranslationInputCounter :
Type                    :
Unit                    : per_sec

NcController            : 10.60.189.172
AggregationStyle        :
BaseCounter             : total_ops
Desc                    : Average latency in microseconds for the WAFL filesystem to process all the operations on the
                          volume; not including request processing or network communication time
Labels                  :
Name                    : avg_latency
PrivilegeLevel          : basic
Properties              : average
TranslationInputCounter :
Type                    :
Unit                    : microsec

NcController            : 10.60.189.172
AggregationStyle        :
BaseCounter             :
Desc                    : Total read accesses to bad blocks of fixable files in AFS through the container file with err
                          or handled by WAFL
Labels                  :
Name                    : bad_container_fixable_afs_blk_read_error_not_propagated
PrivilegeLevel          : diag
Properties              : raw
TranslationInputCounter :
Type                    :
Unit                    : none

```

---

### Parameters
#### **Name**
Name of the object to get information for.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Object |

#### **FilterData**
A string, representing filter-data, in the format of key=value supporting multiple key-value pairs via comma separation.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Perf.CounterInfo

---

### Notes
Category: perf
API: perf-object-counter-list-info
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcPerfCounter [-Name] <String> [[-FilterData] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
