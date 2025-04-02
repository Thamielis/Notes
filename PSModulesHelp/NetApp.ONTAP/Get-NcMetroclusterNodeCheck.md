Get-NcMetroclusterNodeCheck
---------------------------

### Synopsis
Get a list of MetroCluster check node info objects.

---

### Description

Get a list of MetroCluster check node info objects.

---

### Related Links
* [Get-NcMetroclusterAggregateCheck](Get-NcMetroclusterAggregateCheck)

* [Get-NcMetroclusterAggregateEligibilityCheck](Get-NcMetroclusterAggregateEligibilityCheck)

* [Get-NcMetroclusterConfigReplicationCheck](Get-NcMetroclusterConfigReplicationCheck)

* [Get-NcMetroclusterCheck](Get-NcMetroclusterCheck)

* [Invoke-NcMetroclusterCheck](Invoke-NcMetroclusterCheck)

---

### Examples
> Example 1

Get-NcMetroclusterNodeCheck
Get the details of the MetroCluster node check.

NodeName: beam-mcc-01-01

Check                          Result             ClusterName                AdditionalInfo                            
-----                          ------             -----------                --------------                            
symmetric_ha_relationship      warning            beam-mcc-01                Partner not found. Check if node "beam-...
remote_dr_partner              ok                 beam-mcc-01                                                          
dr_mirroring_on                warning            beam-mcc-01                Node's DR mirroring is not active. Enab...
ha_mirroring_on                warning            beam-mcc-01                Node's HA mirroring is not active. Enab...
node_reachable                 ok                 beam-mcc-01                                                          
metrocluster_ready             ok                 beam-mcc-01                                                          
local_ha_partner               ok                 beam-mcc-01                                                          
storage_failover_enabled       warning            beam-mcc-01                Node's storage failover is disabled.  E...
has_intercluster_lif           ok                 beam-mcc-01                                                          
node_object_limit              ok                 beam-mcc-01                                                          
symmetric_dr_relationship      ok                 beam-mcc-01                                                          
remote_dr_auxiliary_partner    ok                 beam-mcc-01                                                          
symmetric_dr_auxiliary_rela... warning            beam-mcc-01                Partner not found. Check if node "beam-...

   NodeName: beam-mcc-02-01

Check                          Result             ClusterName                AdditionalInfo                            
-----                          ------             -----------                --------------                            
node_reachable                 ok                 beam-mcc-02                                                          
symmetric_ha_relationship      warning            beam-mcc-02                Partner not found. Check if node "beam-...
remote_dr_partner              ok                 beam-mcc-02                                                          
dr_mirroring_on                warning            beam-mcc-02                Node's DR mirroring is not active. Enab...
metrocluster_ready             ok                 beam-mcc-02                                                          
local_ha_partner               ok                 beam-mcc-02                                                          
ha_mirroring_on                warning            beam-mcc-02                Node's HA mirroring is not active. Enab...
storage_failover_enabled       warning            beam-mcc-02                Node's storage failover is disabled.  E...
has_intercluster_lif           ok                 beam-mcc-02                                                          
node_object_limit              ok                 beam-mcc-02                                                          
symmetric_dr_relationship      ok                 beam-mcc-02                                                          
remote_dr_auxiliary_partner    ok                 beam-mcc-02                                                          
symmetric_dr_auxiliary_rela... warning            beam-mcc-02                Partner not found. Check if node "beam-...

> Example 2

Get-NcMetroclusterNodeCheck -Query @{Result="warning"}
Get the details of the MetroCluster node check for checks that resulted in a "warning".

NodeName: beam-mcc-01-01

Check                          Result             ClusterName                AdditionalInfo                            
-----                          ------             -----------                --------------                            
dr_mirroring_on                warning            beam-mcc-01                Node's DR mirroring is not active. Enab...
symmetric_ha_relationship      warning            beam-mcc-01                Partner not found. Check if node "beam-...
ha_mirroring_on                warning            beam-mcc-01                Node's HA mirroring is not active. Enab...
storage_failover_enabled       warning            beam-mcc-01                Node's storage failover is disabled.  E...
symmetric_dr_auxiliary_rela... warning            beam-mcc-01                Partner not found. Check if node "beam-...

   NodeName: beam-mcc-02-01

Check                          Result             ClusterName                AdditionalInfo                            
-----                          ------             -----------                --------------                            
ha_mirroring_on                warning            beam-mcc-02                Node's HA mirroring is not active. Enab...
dr_mirroring_on                warning            beam-mcc-02                Node's DR mirroring is not active. Enab...
symmetric_ha_relationship      warning            beam-mcc-02                Partner not found. Check if node "beam-...
storage_failover_enabled       warning            beam-mcc-02                Node's storage failover is disabled.  E...
symmetric_dr_auxiliary_rela... warning            beam-mcc-02                Partner not found. Check if node "beam-...

---

### Parameters
#### **Cluster**
One or more clusters.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ClusterName|

#### **Node**
One or more nodes that were checked.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |2       |true (ByPropertyName)|NodeName|

#### **Check**
One or more items that were checked.  Data ONTAP wildcards are accepted.
Possible values: 
'node_reachable'                          - Is the node reachable,
'metrocluster_ready'                      - Ready for MetroCluster configuration,
'local_ha_partner'                        - HA partner in same cluster,
'ha_mirroring_on'                         - HA mirroring,
'symmetric_ha_relationship'               - Symmetric HA relationship,
'remote_dr_partner'                       - DR partner in peer cluster,
'dr_mirroring_on'                         - DR Mirroring,
'symmetric_dr_relationship'               - Symmetric DR relationship,
'remote_dr_auxiliary_partner'             - DR Auxiliary in peer cluster,
'symmetric_dr_auxiliary_relationship'     - Symmetric DR Auxiliary relationship,
'storage_failover_enabled'                - Is storage failover enabled,
'has_intercluster_lif'                    - Check if the node has an intercluster LIF,
'node_object_limit'                       - Is node object limit option turned on

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterCheckNodeInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterNodeCheck -Template" to get the initially empty MetroclusterCheckNodeInfo object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[MetroclusterCheckNodeInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterCheckNodeInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterCheckNodeInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterNodeCheck -Template" to get the initially empty MetroclusterCheckNodeInfo object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[MetroclusterCheckNodeInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterCheckNodeInfo

---

### Notes
Category: metrocluster
API: metrocluster-check-node-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterNodeCheck [[-Cluster] <String[]>] [[-Node] <String[]>] [[-Check] <String[]>] [-Attributes <MetroclusterCheckNodeInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterNodeCheck -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterNodeCheck -Query <MetroclusterCheckNodeInfo> [-Attributes <MetroclusterCheckNodeInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
