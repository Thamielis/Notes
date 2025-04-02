Get-NcClusterPeerAuthOffer
--------------------------

### Synopsis
Get the specified peer cluster relationship authentication offer information.

---

### Description

Get the specified peer cluster relationship authentication offer information.

---

### Related Links
* [Remove-NcClusterPeerAuthOffer](Remove-NcClusterPeerAuthOffer)

* [Set-NcClusterPeerAuthOffer](Set-NcClusterPeerAuthOffer)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterPeerAuthOffer
Get all cluster peer authentication offers for the current cluster.

AuthStatusAdmin       : use_authentication
AuthStatusOperational : pending
NcController          : 10.63.10.37
OfferCreation         : 1395340896
OfferCreationDT       : 3/20/2014 2:41:36 PM
OfferExpiration       : 1395412904
OfferExpirationDT     : 3/21/2014 10:41:44 AM
PeerClusterName       : beam-fs-pt
PeerClusterUuid       : 56774011-b05b-11e3-b46e-123478563412

```
> Example 2

```PowerShell
Get-NcClusterPeerAuthOffer -Query @{AuthStatusOperational="pending"}
Get all pending cluster peer authentication offers on the current cluster.

AuthStatusAdmin       : use_authentication
AuthStatusOperational : pending
NcController          : 10.63.10.37
OfferCreation         : 1395340896
OfferCreationDT       : 3/20/2014 2:41:36 PM
OfferExpiration       : 1395412904
OfferExpirationDT     : 3/21/2014 10:41:44 AM
PeerClusterName       : beam-fs-pt
PeerClusterUuid       : 56774011-b05b-11e3-b46e-123478563412

```

---

### Parameters
#### **Name**
The name of the peer cluster.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                        |
|------------|--------|--------|---------------------|-------------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|ClusterName<br/>PeerClusterName|

#### **Attributes**
For improved scalability in large clusters, provide a ClusterPeerAuthnOffer object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcClusterPeerAuthOffer -Template" to get the initially empty ClusterPeerAuthnOffer object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ClusterPeerAuthnOffer]`|false   |named   |false        |

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
Specify to get an empty ClusterPeerAuthnOffer object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ClusterPeerAuthnOffer object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcClusterPeerAuthOffer -Template" to get the initially empty ClusterPeerAuthnOffer object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[ClusterPeerAuthnOffer]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterPeer.ClusterPeerAuthnOffer

---

### Notes
Category: cluster peer
API: cluster-peer-authn-offer-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterPeerAuthOffer [[-Name] <String[]>] [-Attributes <ClusterPeerAuthnOffer>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterPeerAuthOffer -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcClusterPeerAuthOffer -Query <ClusterPeerAuthnOffer> [-Attributes <ClusterPeerAuthnOffer>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
