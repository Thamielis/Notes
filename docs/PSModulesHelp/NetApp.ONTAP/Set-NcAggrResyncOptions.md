Set-NcAggrResyncOptions
-----------------------

### Synopsis
Modify aggregate resynchronization options for a node in the cluster

---

### Description

Modify aggregate resynchronization options for a node in the cluster

---

### Examples
> Example 1

Set-NcAggrResyncOptions -Node sapanj-vsim3 -MaxConcurrentResyncsAllowed 2
Modify aggregate resynchronization options for a node sapanj-vsim3.

MaxConcurrentResyncsAllowed NcController                  Node                          MaxConcurrentResyncsAllowedSp
                                                                                                                ecified
  --------------------------- ------------                  ----                          -----------------------------
                            2 10.238.73.251                 sapanj-vsim3                                           True

---

### Parameters
#### **Node**
Name of the node for which the resynchronization option is defined

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **MaxConcurrentResyncsAllowed**
The number of aggregates, owned by the specified node, that are allowed to resync at a time.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Aggr.AggrResyncOptionsInfo

---

### Notes
Category: aggr
API: aggr-resync-options-set
Family: cluster

---

### Syntax
```PowerShell
Set-NcAggrResyncOptions [-Node] <String> [-MaxConcurrentResyncsAllowed] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
