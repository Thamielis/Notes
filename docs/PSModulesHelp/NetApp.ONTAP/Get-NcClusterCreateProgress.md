Get-NcClusterCreateProgress
---------------------------

### Synopsis
Once the cluster create or cluster join operation has been started on this node, this cmdlet can be used to get the current status of the operation.

---

### Description

Once the cluster create or cluster join operation has been started on this node, this cmdlet can be used to get the current status of the operation.  During cluster join, there is a 1 to 5 second window where the network connection will be unavailable while web services restart.  The caller will have to periodically retry until this cmdlet becomes available.

---

### Examples
> Example 1

Get-NcClusterCreateProgress
Get the current status of cluster create or cluster join operation.

CurrentStatusMessage                             IsComplete NcController                            IsCompleteSpecified
--------------------                             ---------- ------------                            -------------------
Network set up                                        False 10.63.4.209                                            True

---

### Parameters
#### **DesiredAttributes**
Specify to restrict the fields returned by Data ONTAP

|Type                             |Required|Position|PipelineInput        |Aliases   |
|---------------------------------|--------|--------|---------------------|----------|
|`[ClusterCreateJoinProgressInfo]`|false   |named   |true (ByPropertyName)|Attributes|

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
* DataONTAP.C.Types.Cluster.ClusterCreateJoinProgressInfo

---

### Notes
Category: cluster
API: cluster-create-join-progress-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterCreateProgress [-DesiredAttributes <ClusterCreateJoinProgressInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
