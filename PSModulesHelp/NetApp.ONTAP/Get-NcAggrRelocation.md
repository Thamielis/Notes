Get-NcAggrRelocation
--------------------

### Synopsis
Get aggregate relocation status.

---

### Description

Get aggregate relocation status.

---

### Related Links
* [Move-NcAggr](Move-NcAggr)

---

### Examples
> Example 1

Get-NcAggrRelocation
Get all of the aggregate relocations currently occurring in the current cluster.

Aggregate                 SourceNode                Destination               RelocationStatus
---------                 ----------                -----------               ----------------
aggr1                     sfp-cmode-02-01           sfp-cmode-02-02           Done

---

### Parameters
#### **Name**
One or more aggregate names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Aggregate|

#### **SourceNode**
One or more source node names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **DestinationNode**
One or more destination node names.  DAta ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an AggrRelocationInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAggrRelocation -Template" to get the initially empty  AggrRelocationInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[AggrRelocationInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty AggrRelocationInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an AggrRelocationInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggrRelocation -Template" to get the initially empty AggrRelocationInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[AggrRelocationInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrRelocationInfo

---

### Notes
Category: aggr
API: aggr-relocation-status
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrRelocation [[-Name] <String[]>] [[-SourceNode] <String[]>] [[-DestinationNode] <String[]>] [-Attributes <AggrRelocationInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrRelocation -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAggrRelocation -Query <AggrRelocationInfo> [-Attributes <AggrRelocationInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
