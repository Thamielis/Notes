Get-NcMetroclusterNode
----------------------

### Synopsis
Get a list of MetroCluster node objects.

---

### Description

Get a list of MetroCluster node objects.

---

### Related Links
* [Get-NcMetroclusterNodeCheck](Get-NcMetroclusterNodeCheck)

---

### Examples
> Example 1

Get-NcMetroclusterNode
Get all of the MetroCluster nodes.

ClusterName: beam-mcc-01

NodeName                       State              DrClusterName              DrPartnerNodeName         
--------                       -----              -------------              -----------------         
beam-mcc-01-01                 configured         beam-mcc-02                beam-mcc-02-01            

   ClusterName: beam-mcc-02

NodeName                       State              DrClusterName              DrPartnerNodeName         
--------                       -----              -------------              -----------------         
beam-mcc-02-01                 configured         beam-mcc-01                beam-mcc-01-01

> Example 2

Get-NcMetroclusterNode -Query @{DrClusterName="beam-mcc-01"}
Query all of the MetroCluster nodes for the given cluster.

ClusterName: beam-mcc-02

NodeName                       State              DrClusterName              DrPartnerNodeName
--------                       -----              -------------              -----------------
beam-mcc-02-01                 configured         beam-mcc-01                beam-mcc-01-01

---

### Parameters
#### **GroupId**
One or more identifiers for the DR group the node belongs to.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases  |
|------------|--------|--------|---------------------|---------|
|`[UInt64[]]`|false   |1       |true (ByPropertyName)|DrGroupId|

#### **Cluster**
One or more cluster names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|ClusterName|

#### **Node**
One or more node names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |3       |true (ByPropertyName)|NodeName|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterNodeInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterNode -Template" to get the initially empty MetroclusterNodeInfo object.  If not specified, all data is returned for each object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[MetroclusterNodeInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterNodeInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterNodeInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterNode -Template" to get the initially empty MetroclusterNodeInfo object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[MetroclusterNodeInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterNodeInfo

---

### Notes
Category: metrocluster
API: metrocluster-node-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterNode [[-GroupId] <UInt64[]>] [[-Cluster] <String[]>] [[-Node] <String[]>] [-Attributes <MetroclusterNodeInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterNode -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterNode -Query <MetroclusterNodeInfo> [-Attributes <MetroclusterNodeInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
