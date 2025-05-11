Get-NcMetroclusterOperation
---------------------------

### Synopsis
Get a list of MetroCluster operations and their details.

---

### Description

Get a list of MetroCluster operations and their details.

---

### Related Links
* [Get-NcMetroclusterProgress](Get-NcMetroclusterProgress)

---

### Examples
> Example 1

Get-NcMetroclusterOperation
Get the details of all the MetroCluster operations in the cluster.

ClusterName: beam-mcc-01

NodeName                   Operation      State          StartTimeDT                EndTimeDT
--------                   ---------      -----          -----------                ---------
beam-mcc-01-01             configure      failed         4/22/2014 9:41:36 AM       4/22/2014 9:41:36 AM
beam-mcc-01-01             configure      failed         4/22/2014 10:06:36 AM      4/22/2014 10:06:36 AM
beam-mcc-01-01             configure      failed         4/22/2014 10:09:08 AM      4/22/2014 10:10:19 AM
beam-mcc-01-01             configure      failed         4/23/2014 9:13:14 AM       4/23/2014 9:13:26 AM

> Example 2

Get-NcMetroclusterOperation -Query @{State="failed"} | fl ClusterName,NodeName,ErrorList
Get the error details of all the failed MetroCluster operations.

ClusterName : beam-mcc-01
NodeName    : beam-mcc-01-01
ErrorList   : {Failed to retrieve information for the remote cluster. Reason: MetroCluster configuration has not been 
              done. Run "metrocluster show" to verify if MetroCluster is configured. Verify that all nodes are healthy 
              and correctly connected, HAOSC is set to "mcc", and that cluster peering is correctly configured.}

ClusterName : beam-mcc-01
NodeName    : beam-mcc-01-01
ErrorList   : {Required mirrored non-root aggregates were not found in cluster "beam-mcc-01". MetroCluster 
              configuration requires at least two mirrored non-root aggregates that are home, with at least 40MB of 
              free space, in "online" state before running the configure command.}

ClusterName : beam-mcc-01
NodeName    : beam-mcc-01-01
ErrorList   : {Configure command failed on node "10bc1ac0-ab59-421b-bc23-f205986cba88" in local cluster. Reason: (Node 
              "10bc1ac0-ab59-421b-bc23-f205986cba88" was not found in the local cluster.). Check the hardware for 
              errors, make sure all partners nodes are online and try the command again with "-refresh true".}

ClusterName : beam-mcc-01
NodeName    : beam-mcc-01-01
ErrorList   : {Configure command failed on node "10bc1ac0-ab59-421b-bc23-f205986cba88" in local cluster. Reason: (Node 
              "10bc1ac0-ab59-421b-bc23-f205986cba88" was not found in the local cluster.). Check the hardware for 
              errors, make sure all partners nodes are online and try the command again with "-refresh true".}

---

### Parameters
#### **OperationId**
One or more unique operation identifiers.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|OperationUuid|

#### **Operation**
One or more names of the operation.  Data ONTAP wildcards are accepted.
Possible values: 
'unknown'                            - Unknown operation,
'configure'                          - MetroCluster configure operation,
'modify'                             - MetroCluster modify operation,
'switchover'                         - MetroCluster switchover operation,
'heal_aggregates'                    - MetroCluster heal aggregates operation,
'heal_root_aggregates'               - MetroCluster heal root aggregates operation,
'switchback'                         - MetroCluster switchback operation,
'switchback_continuation_agent'      - MetroCluster switchback continuation agent,
'unconfigure'                        - MetroCluster unconfigure operation,
'unconfigure_continuation_agent'     - MetroCluster unconfigure continuation agent

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Cluster**
One or more cluster names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |named   |true (ByPropertyName)|ClusterName|

#### **Node**
One or more node names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterOperationInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterOperation -Template" to get the initially empty MetroclusterOperationInfo object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[MetroclusterOperationInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterOperationInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterOperationInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterOperation -Template" to get the initially empty MetroclusterOperationInfo object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[MetroclusterOperationInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterOperationInfo

---

### Notes
Category: metrocluster
API: metrocluster-operation-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterOperation [[-OperationId] <String[]>] [-Operation <String[]>] [-Cluster <String[]>] [-Node <String[]>] [-Attributes <MetroclusterOperationInfo>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterOperation -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterOperation -Query <MetroclusterOperationInfo> [-Attributes <MetroclusterOperationInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
