Set-NcClusterPeer
-----------------

### Synopsis
Modifies a cluster peer relationship.

---

### Description

Modifies a cluster peer relationship.

---

### Related Links
* [Get-NcClusterPeer](Get-NcClusterPeer)

* [Add-NcClusterPeer](Add-NcClusterPeer)

* [Remove-NcClusterPeer](Remove-NcClusterPeer)

---

### Examples
> Example 1

Set-NcClusterPeer stlfas3170-7-8-cluster -Timeout 60
Set the timeout for peer cluster 'stlfas3170-7-8-cluster' to 60 seconds.

ClusterName               Availability    ActiveAddresses
-----------               ------------    ---------------
stlfas3170-7-8-cluster    available       {10.61.178.64, 10.61.178.63}

---

### Parameters
#### **Name**
The name of the peer cluster to modify.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|ClusterName|

#### **Address**
The remote intercluster addresses and hostnames of the peer cluster.

|Type        |Required|Position|PipelineInput        |Aliases                      |
|------------|--------|--------|---------------------|-----------------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|PeerAddress<br/>PeerAddresses|

#### **Timeout**
The timeout for operations in the peer cluster in seconds. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **OfferExpiration**
The expiration time of the authentication offer.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|

#### **Passphrase**
The arbitrary passphrase that matches the one given to the peer cluster.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AuthStatusAdmin**
The desired state of authentication for the relationship.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IpspaceName**
IPspace in which the LIFs for this relationship are to be found.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|Ipspace|

#### **DarkEncrypt**
Guidance for use of encryption. Default: Never: never encrypt
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **GeneratePassphrase**
Use System-Generated passphrase
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **EncryptionProtocolProposed**
Encryption protocol to be used for inter-cluster communication. Default: tls-psk when authentication is used, otherwise none

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **InitialAllowedVserverPeers**
Specifies InitialAllowedVserverPeers.Vservers allowed for auto peering. This parameter is supported with Rest only.

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.ClusterPeer.Ipspace[]]`|false   |named   |false        |

#### **PeerApplications**
Specifies PeerApplications. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

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
* DataONTAP.C.Types.ClusterPeer.ClusterPeerInfo

---

### Notes
Category: cluster peer
API: cluster-peer-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcClusterPeer [-Name] <String> [-Address <String[]>] [-Timeout <Int32>] [-OfferExpiration <DateTime>] [-Passphrase <String>] [-AuthStatusAdmin <String>] [-IpspaceName <String>] 
```
```PowerShell
[-DarkEncrypt <String>] [-GeneratePassphrase <Boolean>] [-EncryptionProtocolProposed <String>] [-InitialAllowedVserverPeers <DataONTAP.C.Types.ClusterPeer.Ipspace[]>] [-PeerApplications 
```
```PowerShell
<String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
