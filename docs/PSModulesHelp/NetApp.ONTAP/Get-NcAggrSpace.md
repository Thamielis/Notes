Get-NcAggrSpace
---------------

### Synopsis
Display a list of aggregates and a breakup of their used space.

---

### Description

Display a list of aggregates and a breakup of their used space. 

This information parameter is available when the aggregate is online. Some fields are expensive to compute, and if the system is under load, the information may not be returned.  Use the Attributes parameter to retrieve only the required fields.

---

### Examples
> Example 1

```PowerShell
Get-NcAggrSpace -Attributes @{VolumeFootprints="";SnapSizeTotal="";PhysicalUsed=""}
Retrieve the breakdown of the aggregate space for all the aggregates in the cluster, retrieving only the desired fields.

Aggregate                                    : aggr1
AggregateMetadata                            :
AggregateMetadataPercent                     :
AggregateSize                                :
NcController                                 : 10.63.10.37
PercentSnapshotSpace                         :
PhysicalUsed                                 : 299008
PhysicalUsedPercent                          :
SnapshotReserveUnusable                      :
SnapshotReserveUnusablePercent               :
SnapSizeTotal                                : 0
UsedIncludingSnapshotReserve                 :
UsedIncludingSnapshotReservePercent          :
VolumeFootprints                             : 0
VolumeFootprintsPercent                      :

Aggregate                                    : aggr0
AggregateMetadata                            :
AggregateMetadataPercent                     :
AggregateSize                                :
NcController                                 : 10.63.10.37
PercentSnapshotSpace                         :
PhysicalUsed                                 : 358334464
PhysicalUsedPercent                          :
SnapshotReserveUnusable                      :
SnapshotReserveUnusablePercent               :
SnapSizeTotal                                : 170541056
UsedIncludingSnapshotReserve                 :
UsedIncludingSnapshotReservePercent          :
VolumeFootprints                             : 3102482432
VolumeFootprintsPercent                      :

```

---

### Parameters
#### **Name**
The name of one or more aggregates to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|AggregateName|

#### **Attributes**
For improved scalability in large clusters, provide a SpaceInformation object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAggrSpace -Template" to get the initially empty SpaceInformation object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[SpaceInformation]`|false   |named   |false        |

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
Specify to get an empty SpaceInformation object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SpaceInformation object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggrSpace -Template" to get the initially empty SpaceInformation object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[SpaceInformation]`|true    |2       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.SpaceInformation

---

### Notes
Category: aggr
API: aggr-space-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrSpace [[-Name] <String[]>] [-Attributes <SpaceInformation>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggrSpace -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAggrSpace [-Query] <SpaceInformation> [-Attributes <SpaceInformation>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
