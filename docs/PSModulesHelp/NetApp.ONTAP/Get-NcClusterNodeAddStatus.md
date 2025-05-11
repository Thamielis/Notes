Get-NcClusterNodeAddStatus
--------------------------

### Synopsis
Get Progress of Cluster Create or Node Add Operation

---

### Description

Get Progress of Cluster Create or Node Add Operation

---

### Parameters
#### **NodeUuid**
Node UUID

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **NodeName**
Node Name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[ClusterCreateAddNodeStatusInfo]`|false   |named   |false        |

#### **Controller**

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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[ClusterCreateAddNodeStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: cluster
API: cluster-add-node-status-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterNodeAddStatus [[-NodeUuid] <String[]>] [[-NodeName] <String[]>] [-Attributes <ClusterCreateAddNodeStatusInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterNodeAddStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterNodeAddStatus -Query <ClusterCreateAddNodeStatusInfo> [-Attributes <ClusterCreateAddNodeStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
