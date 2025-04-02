Get-NcClusterHaTakeover
-----------------------

### Synopsis
Get the takeover status of a node.

---

### Description

Get the takeover status of a node and the takeover status of all its partner aggregates, for all nodes in a cluster.

---

### Examples
> Example 1

Get-NcClusterHaTakeover
Get the takeover status.

Node                      Aggregate                 AggregateTakeoverStatus   NodeTakeoverStatus
----                      ---------                 -----------------------   ------------------
sfp-cmode-02-01           -                         -                         Takeover not attempted.
sfp-cmode-02-02           -                         -                         Takeover not attempted.

---

### Parameters
#### **Node**
One or more nodes to get takeover status.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Aggregate**
One or more aggregates.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a TakeoverStatus object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterHaTakeover -Template" to get the initially empty TakeoverStatus object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[TakeoverStatus]`|false   |named   |false        |

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
Specify to get an empty TakeoverStatus object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a TakeoverStatus object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterHaTakeover -Template" to get the initially empty TakeoverStatus object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[TakeoverStatus]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cf.TakeoverStatus

---

### Notes
Category: cf
API: cf-takeover-status
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterHaTakeover [[-Node] <String[]>] [[-Aggregate] <String[]>] [-Attributes <TakeoverStatus>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterHaTakeover -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcClusterHaTakeover -Query <TakeoverStatus> [-Attributes <TakeoverStatus>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
