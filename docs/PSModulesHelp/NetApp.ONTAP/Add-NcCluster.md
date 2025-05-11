Add-NcCluster
-------------

### Synopsis
Start the process of joining this node to a cluster.

---

### Description

Start the process of joining this node to a cluster.  Join can be done by Cluster IP Address or Cluster Name.  Only one join operation is supported at a time.  Use Get-NcClusterCreateProgress to track the status of the operation.

Please note this cmdlet works when connected to a node in pre-cluster mode. After cluster creation, you'll need to re-connect to the cluster in order to ensure other cmdlets run as expected.

---

### Examples
> Example 1

Add-NcCluster -ClusterAddress 172.31.4.158
Adds the currently connected node to a cluster which has cluster interconnect LIF 172.31.4.158

PS >

---

### Parameters
#### **ClusterName**
Name of the cluster to join.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

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

#### **ClusterAddress**
IP Address of a Cluster-Interconnect Interface, from a node already in the Cluster. This will be used to identify which cluster to join.

|Type      |Required|Position|PipelineInput        |Aliases                                   |
|----------|--------|--------|---------------------|------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Address<br/>IPAddress<br/>ClusterIpAddress|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: cluster
API: cluster-join
Family: cluster

---

### Syntax
```PowerShell
Add-NcCluster [-ClusterName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcCluster [-ClusterAddress] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
