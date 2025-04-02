Unregister-NcMetrocluster
-------------------------

### Synopsis
Wipe the configuration from nodes in a DR group which are in the local cluster where the API is issued.

---

### Description

Wipe the configuration from nodes in a DR group which are in the local cluster where the API is issued. 

This includes all the nodes in the specified DR group in that local cluster.  Nodes in the DR group are disallowed from participating in the MetroCluster switchover after the configuration has been wiped. This API is used to tear down a MetroCluster setup.  The tear down of a node is completed when the hardware that activates the node for MetroCluster, such as an FC-VI adapter, is removed or deactivated.

A job will be spawned to operate on the MetroCluster and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcMetrocluster](Get-NcMetrocluster)

* [Register-NcMetrocluster](Register-NcMetrocluster)

---

### Examples
> Example 1

```PowerShell
Unregister-NcMetrocluster
Unconfigure the MetroCluster configuration.

NcController : 10.63.10.33
ErrorCode    :
ErrorMessage :
JobId        : 40
JobVserver   :
Status       : in_progress

```

---

### Parameters
#### **GroupId**
Identifier for the DR group.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|false   |1       |true (ByPropertyName)|DrGroupId|

#### **StartOnNodeAndSkipNodeVersionChecks**
Specify on which Node job starts and skip Node Version checks

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |named   |true (ByPropertyName)|Node<br/>NodeName|

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
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: metrocluster
API: metrocluster-unconfigure
Family: cluster

---

### Syntax
```PowerShell
Unregister-NcMetrocluster [[-GroupId] <Int64>] [-StartOnNodeAndSkipNodeVersionChecks <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
