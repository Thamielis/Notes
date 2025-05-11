New-NcCluster
-------------

### Synopsis
Start the process to create a cluster using this node.

---

### Description

Start the process to create a cluster using this node. Use cluster-create-join-progress-get to track the status of the operation.

---

### Parameters
#### **ClusterName**
Use this parameter to specify the name of the cluster you are creating. The cluster name must begin with a letter and cannot be more than 44 characters in length.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **License**
The base cluster license obtain with the hardware or from NetApp professional services.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NodeCount**
Use this parameter to specify the number of nodes in the cluster you are creating. It is only supported on non-shared architecture platforms. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **KeepPreClusterCert**
Keep Precluster Certificate.
This parameter is available in ONTAP 9.1 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **ClusterIps**
Use this option to add a set of nodes based on their cluster IP addresses.
This parameter is available in ONTAP 9.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **NodeNames**
Use this option to specify the names to use for the nodes specified using the cluster-ips argument.
This parameter is available in ONTAP 9.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SingleNodeCluster**
The Cluster Is a Single Node Cluster.
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Retry**
Retry a failed cluster create operation.
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **NodeUuids**
List of Node UUIDs
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **DiscoveryTimeout**
Max Time to Discover Nodes to Be Added (in Secs).
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Password**
Password. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Certificate**
Certificate. This parameter is supported with Rest only.

|Type                                     |Required|Position|PipelineInput        |
|-----------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Cluster.Certificate]`|false   |named   |true (ByPropertyName)|

#### **Metric**
Metric. This parameter is supported with Rest only.

|Type                                |Required|Position|PipelineInput        |
|------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Cluster.Metric]`|false   |named   |true (ByPropertyName)|

#### **ManagementInterfaces**
ManagementInterfaces. This parameter is supported with Rest only.

|Type                                                     |Required|Position|PipelineInput        |
|---------------------------------------------------------|--------|--------|---------------------|
|`[List <DataONTAP.C.Types.Cluster.ManagementInterfaces>]`|false   |named   |true (ByPropertyName)|

#### **NtpServers**
NtpServers. This parameter is supported with Rest only.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[List <String>]`|false   |named   |true (ByPropertyName)|

#### **NameServers**
NameServers. This parameter is supported with Rest only.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[List <String>]`|false   |named   |true (ByPropertyName)|

#### **Contact**
Contact. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Location**
Location. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Timezone**
Timezone. This parameter is supported with Rest only.

|Type                                  |Required|Position|PipelineInput        |
|--------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Cluster.Timezone]`|false   |named   |true (ByPropertyName)|

#### **DnsDomains**
DnsDomains. This parameter is supported with Rest only.

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[List <String>]`|false   |named   |true (ByPropertyName)|

#### **ConfigurationBackup**
ConfigurationBackup. This parameter is supported with Rest only.

|Type                                             |Required|Position|PipelineInput        |
|-------------------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Cluster.ConfigurationBackup]`|false   |named   |true (ByPropertyName)|

#### **Nodes**
Nodes. This parameter is supported with Rest only.

|Type                                 |Required|Position|PipelineInput        |
|-------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Cluster.Node[].]`|false   |named   |true (ByPropertyName)|

#### **CreateRecommendedAggregates**
Create aggregates based on an optimal layout recommended by the system. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **KeepPreclusterConfig**
This is used to keep temporary configuration settings that allow initial setup including a node scoped certificate and possibly an automatically created node management interface. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: cluster
API: cluster-create
Family: ontap-cluster

---

### Syntax
```PowerShell
New-NcCluster [-ClusterName] <String> [-License <String>] [-NodeCount <Int64>] [-KeepPreClusterCert] [-ClusterIps <String[]>] [-NodeNames <String[]>] [-SingleNodeCluster <Boolean>] [-Retry 
```
```PowerShell
<Boolean>] [-NodeUuids <String[]>] [-DiscoveryTimeout <Int64>] [-Password <String>] [-Certificate <DataONTAP.C.Types.Cluster.Certificate>] [-Metric <DataONTAP.C.Types.Cluster.Metric>] 
```
```PowerShell
[-ManagementInterfaces <List <DataONTAP.C.Types.Cluster.ManagementInterfaces>>] [-NtpServers <List <String>>] [-NameServers <List <String>>] [-Contact <String>] [-Location <String>] 
```
```PowerShell
[-Timezone <DataONTAP.C.Types.Cluster.Timezone>] [-DnsDomains <List <String>>] [-ConfigurationBackup <DataONTAP.C.Types.Cluster.ConfigurationBackup>] [-Nodes 
```
```PowerShell
<DataONTAP.C.Types.Cluster.Node[].>] [-CreateRecommendedAggregates <Boolean>] [-KeepPreclusterConfig <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
