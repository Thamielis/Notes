Add-NcClusterPeer
-----------------

### Synopsis
Create a cluster peer relationship.

---

### Description

Create a cluster peer relationship.

---

### Related Links
* [Get-NcClusterPeer](Get-NcClusterPeer)

* [Remove-NcClusterPeer](Remove-NcClusterPeer)

* [Set-NcClusterPeer](Set-NcClusterPeer)

---

### Examples
> Example 1

```PowerShell
Add-NcClusterPeer 10.61.178.63 -Credential admin
Add a cluster peer, where the remote cluster has one of its intercluster interfaces on address '10.61.178.63'.

NcController      : VxeRubble
ActiveAddresses   : {10.61.178.64, 10.61.178.63}
Availability      : available
ClusterName       : stlfas3170-7-8-cluster
ClusterUuid       : 2f5fafeb-d334-11e0-b6e3-123478563412
PeerAddresses     : {10.61.178.63}
RemoteClusterName : stlfas3170-7-8-cluster
SerialNumber      : 1-80-000011
Timeout           : 60
TimeoutTS         : 00:01:00
TimeoutSpecified  : True

```

---

### Parameters
#### **Address**
The remote intercluster addresses and hostnames of the peer cluster.

|Type        |Required|Position|PipelineInput        |Aliases                      |
|------------|--------|--------|---------------------|-----------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PeerAddress<br/>PeerAddresses|

#### **Timeout**
The timeout for operations in the peer cluster in seconds.  Default: 15. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **UserName**
The user name required to authenticate with the peer cluster.  This value is only used at peer creation time and not stored. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Password**
The password required to authenticate with the peer cluster.  This value is only used at peer creation time and not stored. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AddressFamily**
The address family (IPv4/IPv6) of the peer cluster connection.  Possible values:  ipv4, ipv6. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **IpspaceName**
IPspace in which the LIFs for this relationship are to be found.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|Ipspace|

#### **Encrypt**
Guidance for use of encryption.
Possible values: 
"never"          - Never Encrypt,
"as_possible"    - Encrypt Where Possible,
"always"         - Require Encryption
Default value is "never".
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **LocalName**
Local name for remote cluster.
Default: Remote cluster name.
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

#### **InitialAllowedVserverPeers**
Vservers allowed for auto peering
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **EncryptionProtocolProposed**
Encryption protocol to be used for inter-cluster communication. Default: tls-psk when authentication is used, otherwise none

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AuthStatusAdmin**
Specifies Authentication In-Use. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Name**
Specifies Name. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LocalNetwork**
Specifies local_network. To create object use New-Object DataONTAP.C.Types.ClusterPeer.LocalNetwork. This parameter is supported with Rest only.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.ClusterPeer.LocalNetwork]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Credential**
The credentials required to authenticate with the peer cluster.  This value is only used at peer creation time and not stored.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ClusterPeer.ClusterPeerInfo

---

### Notes
Category: cluster peer
API: cluster-peer-create
Family: cluster

---

### Syntax
```PowerShell
Add-NcClusterPeer [[-Address] <String[]>] [-Timeout <Int32>] [-UserName <String>] [-Password <String>] [-AddressFamily <String>] [-OfferExpiration <DateTime>] [-Passphrase <String>] 
```
```PowerShell
[-IpspaceName <String>] [-Encrypt <String>] [-LocalName <String>] [-DarkEncrypt <String>] [-GeneratePassphrase <Boolean>] [-InitialAllowedVserverPeers <String[]>] [-EncryptionProtocolProposed 
```
```PowerShell
<String>] [-AuthStatusAdmin <String>] [-Name <String>] [-LocalNetwork <DataONTAP.C.Types.ClusterPeer.LocalNetwork>] [-PeerApplications <String[]>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcClusterPeer [[-Address] <String[]>] [-Timeout <Int32>] [-Credential <PSCredential>] [-AddressFamily <String>] [-OfferExpiration <DateTime>] [-Passphrase <String>] [-IpspaceName 
```
```PowerShell
<String>] [-Encrypt <String>] [-LocalName <String>] [-DarkEncrypt <String>] [-GeneratePassphrase <Boolean>] [-InitialAllowedVserverPeers <String[]>] [-EncryptionProtocolProposed <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
