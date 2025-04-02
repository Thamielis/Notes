Get-NcVserverPeer
-----------------

### Synopsis
Get a list of Vserver peer relationships.

---

### Description

Get a list of Vserver peer relationships. If the cmdlet is issued to the Cluster LIF, then information about all Vservers is shown. If the request is sent to the Vserver LIF, then 
information about that Vserver is shown.

---

### Related Links
* [New-NcVserverPeer](New-NcVserverPeer)

* [Confirm-NcVserverPeer](Confirm-NcVserverPeer)

---

### Examples
> Example 1

Get-NcVserverPeer -Vserver beam01
Get all of the vserver peer relationships for the given vserver.

Vserver                   PeerVserver               PeerState          PeerCluster               Applications
-------                   -----------               ---------          -----------               ------------
beam01                    dummy                     peered             sfp-cmode-02              {snapmirror}

> Example 2

$q = Get-NcVserverPeer -Template
$q.PeerCluster = "sfp-cmode-02"
Get-NcVserverPeer -Query $q
Get all of the vserver peer relationships with the given peer cluster.

Vserver                   PeerVserver               PeerState          PeerCluster               Applications
-------                   -----------               ---------          -----------               ------------
beam01                    dummy                     peered             sfp-cmode-02              {snapmirror}

---

### Parameters
#### **Vserver**
Name of the local Vserver.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **PeerVserver**
Name of the peer Vserver.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **PeerState**
State of the Vserver peer relationship.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Application**
Applications which can make use of the peering relationship.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a VserverPeerInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVserverPeer -Template" to get the initially empty VserverPeerInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VserverPeerInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Template**
Specify to get an empty VserverPeerInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a VserverPeerInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVserverPeer -Template" to get the initially empty VserverPeerInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VserverPeerInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.VserverPeer.VserverPeerInfo

---

### Notes
Category: vserver
API: vserver-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVserverPeer [[-Vserver] <String[]>] [[-PeerVserver] <String[]>] [-PeerState <String[]>] [-Application <String[]>] [-Attributes <VserverPeerInfo>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverPeer -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVserverPeer -Query <VserverPeerInfo> [-Attributes <VserverPeerInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
