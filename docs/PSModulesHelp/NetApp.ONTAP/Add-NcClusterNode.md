Add-NcClusterNode
-----------------

### Synopsis
This cmdlet can be used to add new nodes to cluster.

---

### Description

This cmdlet can be used to discover and add new nodes to cluster.  You may provide either NodeCount or NodeIp. To run this cmdlet you must be connected to the cluster. If you are connected to the node (in pre-cluster mode), please use Add-NcCluster to perform cluster join.

A job will be spawned to operate on the cluster and the job id will be returned. The progress of the job can be tracked using the Get-NcJob cmdlet.

---

### Related Links
* [Set-NcClusterNode](Set-NcClusterNode)

* [Get-NcClusterNode](Get-NcClusterNode)

* [Add-NcCluster](Add-NcCluster)

* [Remove-NcCluster](Remove-NcCluster)

---

### Examples
> Example 1

```PowerShell
Add-NcClusterNode -NodeCount 2
Searches for 2 nodes in pre-cluster phase in the current network and adds them to this cluster.

NcController : 10.63.4.209
ErrorCode    :
ErrorMessage :
JobId        : 24
JobVserver   :
Status       : in_progress

```

---

### Parameters
#### **NodeIp**
Use this option to add a specific node based on it's cluster IP.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Address<br/>Node|

#### **NodeNames**
Use this option to specify the names to use for the nodes added using the cluster-ips argument.
This parameter is available in ONTAP 9.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Retry**
Retry a failed cluster add-node operation.
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **NodeUuids**
List of Node UUIDs
This parameter is available in ONTAP 9.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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

#### **NodeCount**
Use this option to discover and add new nodes.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|true    |1       |true (ByPropertyName)|Count  |

#### **ClusterIps**
Use this option to add a set of nodes based on their cluster IP addresses.
This parameter is available in ONTAP 9.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: cluster
API: cluster-add-node
Family: cluster

---

### Syntax
```PowerShell
Add-NcClusterNode [-NodeIp] <String> [-NodeNames <String[]>] [-Retry <Boolean>] [-NodeUuids <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcClusterNode [-NodeCount] <Int64> [-NodeNames <String[]>] [-Retry <Boolean>] [-NodeUuids <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcClusterNode [-ClusterIps] <String[]> [-NodeNames <String[]>] [-Retry <Boolean>] [-NodeUuids <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
