Set-NcVserverPeerPermission
---------------------------

### Synopsis
Modify the existing Vserver peer permission

---

### Description

Modify the existing Vserver peer permission

---

### Examples
> Example 1

Set-NcVserverPeerPermission -PeerCluster C1_sti62-vsim-ucs140h_1533812739 -Vserver test1234 -Applications snapmirror
Modifying vserver peer permission for the applications snapmirror.

Applications                  NcController                  PeerCluster                   Vserver
------------                  ------------                  -----------                   -------
{snapmirror}                  172.21.134.199                C1_sti62-vsim-ucs140h_1533... test1234

---

### Parameters
#### **PeerCluster**
Specifies name of the peer Cluster.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
Specifies name of the local Vserver. Use symbol * to denote a permission that applies for all local Vservers.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Applications**
Peering Applications
Possible values: 
<ul>
 <li> "snapmirror"     - SnapMirror,
 <li> "flexcache"      - FlexCache
</ul>

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |3       |true (ByPropertyName)|

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
API: vserver-peer-permission-modify
Family: ontap-cluster

---

### Syntax
```PowerShell
Set-NcVserverPeerPermission [-PeerCluster] <String> [-Vserver] <String> [-Applications] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
