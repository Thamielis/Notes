Get-NcSnapmirrorCRStatusComm
----------------------------

### Synopsis
Obtain the results of the SnapMirror config replication communication status check.

---

### Description

Obtain the results of the SnapMirror config replication communication status check.

---

### Related Links
* [Get-NcSnapmirrorCRClusterStorageConfiguration](Get-NcSnapmirrorCRClusterStorageConfiguration)

* [Set-NcSnapmirrorCRClusterStorageConfiguration](Set-NcSnapmirrorCRClusterStorageConfiguration)

* [Get-NcSnapmirrorCRStatus](Get-NcSnapmirrorCRStatus)

* [Get-NcSnapmirrorCrStatusAggregateEligibility](Get-NcSnapmirrorCrStatusAggregateEligibility)

---

### Parameters
#### **PeerCluster**
The peer cluster destination for SnapMirror configuration replication.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Peer   |

#### **PeerClusterUuid**
The UUID of the peer cluster destination for SnapMirror configuration replication.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Uuid   |

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[SnapmirrorCrStatusCommInfo]`|false   |named   |false        |

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[SnapmirrorCrStatusCommInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorCrStatusCommInfo

---

### Notes
Category: snapmirror
API: snapmirror-cr-status-comm-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnapmirrorCRStatusComm [[-PeerCluster] <String[]>] [-PeerClusterUuid <String[]>] [-Attributes <SnapmirrorCrStatusCommInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorCRStatusComm -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorCRStatusComm -Query <SnapmirrorCrStatusCommInfo> [-Attributes <SnapmirrorCrStatusCommInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
