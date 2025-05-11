Set-NcClusterPeerAuthOffer
--------------------------

### Synopsis
Modify the cluster peer relationship authentication offer.

---

### Description

Modify the cluster peer relationship authentication offer.

---

### Related Links
* [Get-NcClusterPeerAuthOffer](Get-NcClusterPeerAuthOffer)

* [Remove-NcClusterPeerAuthOffer](Remove-NcClusterPeerAuthOffer)

---

### Examples
> Example 1

Set-NcClusterPeerAuthOffer -Name beam-fs-pt -OfferExpiration (Get-Date).AddDays(1)
Update the offer expiration date to be a day from now.

PeerClusterName            StatusOperational    StatusAdmin                     OfferCreation          OfferExpiration
---------------            -----------------    -----------                     -------------          ---------------
beam-fs-pt                 pending              use_authentication       3/20/2014 2:41:36 PM    3/21/2014 11:19:40 AM

---

### Parameters
#### **Name**
The name of the peer cluster to modify.

|Type      |Required|Position|PipelineInput        |Aliases                        |
|----------|--------|--------|---------------------|-------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|ClusterName<br/>PeerClusterName|

#### **OfferExpiration**
The expiration time of the authentication offer.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |2       |true (ByPropertyName)|

#### **InitialAllowedVserverPeers**
Vservers allowed for auto peering
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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterPeer.ClusterPeerAuthnOffer

---

### Notes
Category: cluster peer
API: cluster-peer-authn-offer-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcClusterPeerAuthOffer [-Name] <String> [[-OfferExpiration] <DateTime>] [-InitialAllowedVserverPeers <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
