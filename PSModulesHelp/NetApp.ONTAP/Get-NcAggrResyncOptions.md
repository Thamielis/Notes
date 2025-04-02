Get-NcAggrResyncOptions
-----------------------

### Synopsis
Get aggregate resynchronization options for a node in the cluster

---

### Description

Get aggregate resynchronization options for a node in the cluster.

---

### Examples
> Example 1

Get-NcAggrResyncOptions -Node sapanj-vsim3
Get aggregate resynchronization options for node sapanj-vsim3

MaxConcurrentResyncsAllowed NcController                  Node                          MaxConcurrentResyncsAllowedSp
                                                                                                                ecified
  --------------------------- ------------                  ----                          -----------------------------
                          200 10.238.73.251                 sapanj-vsim3                                           True

---

### Parameters
#### **Node**
Name of the node for which the resynchronization option is defined.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Attributes**
For improved scalability in large clusters, provide an AggrResyncOptionInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAggrResyncOption -Template" to get the initially empty  AggrResyncOptionInfoobject.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[AggrResyncOptionsInfo]`|false   |named   |false        |

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
Specify to get an empty AggrResyncOptionsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an AggrResyncOptionsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggrResyncOptions-Template" to get the initially empty AggrResyncOptionsInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[AggrResyncOptionsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrResyncOptionsInfo

---

### Notes
Category: aggr
API: aggr-resync-options-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrResyncOptions [[-Node] <String[]>] [-Attributes <AggrResyncOptionsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrResyncOptions -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAggrResyncOptions -Query <AggrResyncOptionsInfo> [-Attributes <AggrResyncOptionsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
