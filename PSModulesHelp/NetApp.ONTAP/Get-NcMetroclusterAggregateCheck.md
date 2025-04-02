Get-NcMetroclusterAggregateCheck
--------------------------------

### Synopsis
Get a list of MetroCluster check aggregate info objects.

---

### Description

Get a list of MetroCluster check aggregate info objects.

---

### Related Links
* [Get-NcMetroclusterCheck](Get-NcMetroclusterCheck)

* [Get-NcMetroclusterConfigReplicationCheck](Get-NcMetroclusterConfigReplicationCheck)

* [Get-NcMetroclusterNodeCheck](Get-NcMetroclusterNodeCheck)

* [Get-NcMetroclusterAggregateEligibilityCheck](Get-NcMetroclusterAggregateEligibilityCheck)

* [Invoke-NcMetroclusterCheck](Invoke-NcMetroclusterCheck)

---

### Examples
> Example 1

Get-NcMetroclusterAggregateCheck
Get the details of the MetroCluster checks for all aggregates.

Aggregate: aggr1_mcc1

Check                          Result             ClusterName                NodeName                                  
-----                          ------             -----------                --------                                  
mirroring_status               ok                 beam-mcc-01                beam-mcc-01-01                            

   Aggregate: aggr0_mcc1

Check                          Result             ClusterName                NodeName                                  
-----                          ------             -----------                --------                                  
disk_pool_allocation           ok                 beam-mcc-01                beam-mcc-01-01                            
mirroring_status               ok                 beam-mcc-01                beam-mcc-01-01                            

   Aggregate: aggr2_mcc1

Check                          Result             ClusterName                NodeName                                  
-----                          ------             -----------                --------                                  
disk_pool_allocation           ok                 beam-mcc-01                beam-mcc-01-01                            
mirroring_status               ok                 beam-mcc-01                beam-mcc-01-01                            

   Aggregate: aggr1_mcc1

Check                          Result             ClusterName                NodeName                                  
-----                          ------             -----------                --------                                  
disk_pool_allocation           ok                 beam-mcc-01                beam-mcc-01-01                            

   Aggregate: aggr1_mcc2

Check                          Result             ClusterName                NodeName                                  
-----                          ------             -----------                --------                                  
mirroring_status               ok                 beam-mcc-02                beam-mcc-02-01                            

   Aggregate: aggr0_mcc2

Check                          Result             ClusterName                NodeName                                  
-----                          ------             -----------                --------                                  
disk_pool_allocation           ok                 beam-mcc-02                beam-mcc-02-01                            
mirroring_status               ok                 beam-mcc-02                beam-mcc-02-01                            

   Aggregate: aggr2_mcc2

Check                          Result             ClusterName                NodeName                                  
-----                          ------             -----------                --------                                  
disk_pool_allocation           ok                 beam-mcc-02                beam-mcc-02-01                            
mirroring_status               ok                 beam-mcc-02                beam-mcc-02-01                            

   Aggregate: aggr1_mcc2

Check                          Result             ClusterName                NodeName                                  
-----                          ------             -----------                --------                                  
disk_pool_allocation           ok                 beam-mcc-02                beam-mcc-02-01

> Example 2

```PowerShell
Get-NcMetroclusterAggregateCheck -Query @{Result="warning"}
Get the details of the MetroCluster aggregate check for all checks that have the "warning" result.
```

---

### Parameters
#### **Cluster**
One or more clusters.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ClusterName|

#### **Node**
One or more nodes containing aggregates that were checked.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |2       |true (ByPropertyName)|NodeName|

#### **Aggregate**
One or more names of the aggregates that were checked.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Check**
One or more items that were checked.  Data ONTAP wildcards are accepted.
Possible values:
'mirroring_status'         - Mirroring status,
'disk_pool_allocation'     - Disk pool allocation

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterCheckAggregateInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterAggregateCheck -Template" to get the initially empty MetroclusterCheckAggregateInfo object.  If not specified, all data is returned for each object.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[MetroclusterCheckAggregateInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterCheckAggregateInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterCheckAggregateInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterAggregateCheck -Template" to get the initially empty MetroclusterCheckAggregateInfo object.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[MetroclusterCheckAggregateInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterCheckAggregateInfo

---

### Notes
Category: metrocluster
API: metrocluster-check-aggregate-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterAggregateCheck [[-Cluster] <String[]>] [[-Node] <String[]>] [[-Aggregate] <String[]>] [[-Check] <String[]>] [-Attributes <MetroclusterCheckAggregateInfo>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterAggregateCheck -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterAggregateCheck -Query <MetroclusterCheckAggregateInfo> [-Attributes <MetroclusterCheckAggregateInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
