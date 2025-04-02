Get-NcClusterPeerPolicy
-----------------------

### Synopsis
Get the cluster peering policy configuration.

---

### Description

Get the cluster peering policy configuration.

---

### Related Links
* [Set-NcClusterPeerPolicy](Set-NcClusterPeerPolicy)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterPeerPolicy
Get the cluster peer policy for the current cluster.

IsUnauthenticatedAccessPermitted          : False
NcController                              : 10.63.10.37
PassphraseMinimumLength                   : 8

```

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a ClusterPeerPolicy object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterPeerPolicy -Template" to get the initially empty ClusterPeerPolicy object.  If not specified, all data is returned for each object.

|Type                 |Required|Position|PipelineInput        |
|---------------------|--------|--------|---------------------|
|`[ClusterPeerPolicy]`|false   |1       |true (ByPropertyName)|

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
Specify to get an empty ClusterPeerPolicy object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterPeer.ClusterPeerPolicy

---

### Notes
Category: cluster peer
API: cluster-peer-policy-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterPeerPolicy [[-Attributes] <ClusterPeerPolicy>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterPeerPolicy -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
