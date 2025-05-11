Get-NcClusterPeer
-----------------

### Synopsis
Returns a list of cluster peer relationships.

---

### Description

Returns a list of cluster peer relationships.

---

### Related Links
* [Add-NcClusterPeer](Add-NcClusterPeer)

* [Remove-NcClusterPeer](Remove-NcClusterPeer)

* [Set-NcClusterPeer](Set-NcClusterPeer)

---

### Examples
> Example 1

Get-NcClusterPeer
List all peer clusters.

ClusterName               Availability    ActiveAddresses
-----------               ------------    ---------------
stlfas3170-7-8-cluster    available       {10.61.178.64, 10.61.178.63}

---

### Parameters
#### **Name**
The name of the peer cluster.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ClusterName|

#### **Address**
The remote IP address or host name of the peer cluster.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                      |
|------------|--------|--------|---------------------|-----------------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|PeerAddress<br/>PeerAddresses|

#### **Availability**
The status of the peer cluster connection.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterPeerInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterPeer -Template" to get the initially empty ClusterPeerInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ClusterPeerInfo]`|false   |named   |false        |

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
Specify to get an empty ClusterPeerInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterPeerInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterPeer -Template" to get the initially empty ClusterPeerInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[ClusterPeerInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterPeer.ClusterPeerInfo

---

### Notes
Category: cluster peer
API: cluster-peer-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterPeer [[-Name] <String[]>] [-Address <String[]>] [-Availability <String[]>] [-Attributes <ClusterPeerInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterPeer -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcClusterPeer -Query <ClusterPeerInfo> [-Attributes <ClusterPeerInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
