New-NcVserverPeerPermission
---------------------------

### Synopsis
Create a new Vserver peer permission.

---

### Description

Create a new Vserver peer permission. Allow cluster admin to configure list of permitted clusters/Vservers/applications for intercluster Vserver peer relationship creation. Once configured no explicit Vserver peer accept required for any incoming Vserver peer request from remote cluster

---

### Examples
> Example 1

New-NcVserverPeerPermission -PeerCluster cha3cha4 -Vserver vs1 -Applications snapmirror
Create a new Vserver peer permission for PeerCluster cha3cha4.

Applications                  NcController                  PeerCluster                   Vserver
------------                  ------------                  -----------                   -------
{snapmirror}                  10.140.111.42                 cha3cha4                      vs1

---

### Parameters
#### **PeerCluster**
Specify name of the peer Cluster.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
Specify name of the local Vserver

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Applications**
Peering Applications. Possible Values: "snapmirror"

|Type        |Required|Position|PipelineInput        |Aliases                          |
|------------|--------|--------|---------------------|---------------------------------|
|`[String[]]`|true    |3       |true (ByPropertyName)|VserverPeerPermissionApplications|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.VserverPeer.VserverPeerPermissionInfo

---

### Notes
Category: vserver peer
API: vserver-peer-permission-create
Family: cluster

---

### Syntax
```PowerShell
New-NcVserverPeerPermission [-PeerCluster] <String> [-Vserver] <String> [-Applications] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
