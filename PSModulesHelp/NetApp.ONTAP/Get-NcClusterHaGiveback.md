Get-NcClusterHaGiveback
-----------------------

### Synopsis
Get the giveback status of all the aggregates in the cluster which are taken over or were given back.

---

### Description

Get the giveback status of all the aggregates in the cluster which are taken over or were given back.

---

### Examples
> Example 1

Get-NcClusterHaGiveback
Get the aggregate giveback status.

Node                      Aggregate                 DestinationNode           AggrGivebackState
----                      ---------                 ---------------           -----------------
sfp-cmode-02-01                                                               sfo_am_nothing_to_gb
sfp-cmode-02-02                                                               sfo_am_nothing_to_gb

---

### Parameters
#### **Node**
One or more nodes performing the giveback.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Aggregate**
One or more aggregates.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CfAggregateGivebackInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterHaGiveback -Template" to get the initially empty CfAggregateGivebackInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CfAggregateGivebackInfo]`|false   |named   |false        |

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
Specify to get an empty CfAggregateGivebackInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CfAggregateGivebackInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterHaGiveback -Template" to get the initially empty CfAggregateGivebackInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CfAggregateGivebackInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cf.CfAggregateGivebackInfo

---

### Notes
Category: cf
API: cf-aggregate-giveback-status
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterHaGiveback [[-Node] <String[]>] [[-Aggregate] <String[]>] [-Attributes <CfAggregateGivebackInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterHaGiveback -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcClusterHaGiveback -Query <CfAggregateGivebackInfo> [-Attributes <CfAggregateGivebackInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
