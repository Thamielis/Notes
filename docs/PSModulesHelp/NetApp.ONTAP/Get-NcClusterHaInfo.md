Get-NcClusterHaInfo
-------------------

### Synopsis
Get a list of cf objects.

---

### Description

Get a list of cf objects.

---

### Related Links
* [Update-NcClusterHa](Update-NcClusterHa)

---

### Examples
> Example 1

Get-NcClusterHaInfo -Node sfp-cmode-02-01
Get the storage failover info for the given node.

Node                 PartnerName          NodeState          TakeOverEnabled  TakeoverState    GivebackState
----                 -----------          ---------          ---------------  -------------    -------------
sfp-cmode-02-01      sfp-cmode-02-02      connected                True       not_in_takeover  nothing_to_gb

> Example 2

Get-NcClusterHaInfo -Query @{NodeState="connected"}
Get storage failover info for all nodes that are in the connected state.

Node                 PartnerName          NodeState          TakeOverEnabled  TakeoverState    GivebackState
----                 -----------          ---------          ---------------  -------------    -------------
sfp-cmode-02-01      sfp-cmode-02-02      connected                True       not_in_takeover  nothing_to_gb
sfp-cmode-02-02      sfp-cmode-02-01      connected                True       not_in_takeover  nothing_to_gb

---

### Parameters
#### **Node**
One or more nodes performing the giveback.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a StorageFailoverInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterHaInfo -Template" to get the initially empty StorageFailoverInfo object.  If not specified, all data is returned for each object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[StorageFailoverInfo]`|false   |named   |false        |

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
Specify to get an empty StorageFailoverInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a StorageFailoverInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterHaInfo -Template" to get the initially empty StorageFailoverInfo object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[StorageFailoverInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Cf.StorageFailoverInfo

---

### Notes
Category: cf
API: cf-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterHaInfo [[-Node] <String[]>] [-Attributes <StorageFailoverInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterHaInfo -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcClusterHaInfo -Query <StorageFailoverInfo> [-Attributes <StorageFailoverInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
