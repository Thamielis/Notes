Remove-NcCluster
----------------

### Synopsis
Unjoins the cluster.

---

### Description

Unjoins the cluster. This cmdlet should only be used under the supervision and guidance of NetApp employees - it may prevent data serving from the cluster, or even lead to data loss. Usage of this cmdlet on an operational controller is highly discouraged.

A job will be spawned to operate on the cluster and the job id will be returned. The progress of the job can be tracked using the Get-NcJob cmdlet.

---

### Related Links
* [Set-NcCluster](Set-NcCluster)

* [Get-NcCluster](Get-NcCluster)

* [Add-NcCluster](Add-NcCluster)

* [New-NcCluster](New-NcCluster)

* [Add-NcClusterNode](Add-NcClusterNode)

---

### Examples
> Example 1

Remove-NcCluster -Node aparajirssd-01
Remove a node from the cluster. This can not be executed if the LIF you're connected to is on the port you're trying to unjoin from the cluster.

Unjoin node
Are you sure you want to unjoin node aparajirssd-01 from cluster?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

NcController : 10.63.4.209
ErrorCode    :
ErrorMessage :
JobId        : 26
JobVserver   :
Status       : in_progress

---

### Parameters
#### **Node**
Node to unjoin from the cluster.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **SkipQuorumCheck**
Specify to skip quorum checks when unjoining a node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Force**
Force node to unjoin.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: cluster
API: cluster-unjoin
Family: cluster

---

### Syntax
```PowerShell
Remove-NcCluster [-Node] <String> [-SkipQuorumCheck] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
