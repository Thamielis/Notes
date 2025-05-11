Invoke-NcMetroclusterSwitchover
-------------------------------

### Synopsis
Initiate the switchover of storage and client access from a disaster stricken site to the DR site.

---

### Description

Initiate the switchover of storage and client access from a disaster stricken site to the DR site. 

Nodes in the disaster stricken site must be powered off and unreachable by nodes in the DR site before initiating the switchover operation. 

A job will be spawned to operate on the MetroCluster and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcJob](Get-NcJob)

---

### Examples
> Example 1

```PowerShell
Invoke-NcMetroclusterSwitchover
Initiate the switchover of storage resources from their home nodes to the DR nodes.

NcController : 10.63.10.33
ErrorCode    : 
ErrorMessage : 
JobId        : 22
JobVserver   : 
Status       : in_progress

```

---

### Parameters
#### **Disaster**
Specify this option when all the nodes on the disaster stricken site are powered off and unreachable.
If not specified, the command implies a planned switchover operation

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ForceNvfailAll**
If specified, all volumes being switched over will have their in-nvfailed-state set to true by the switchover API. Also the force-nvfail-on-dr option will be set to true on the volumes that are not already enabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OverrideVetoes**
If specified, the system overrides subsystem vetoes that might prevent the switchover operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RetryFailedNodes**
When a list of nodes is specified by name or UUID, the switchover API is directed to those nodes only. The option is used to make the list of nodes redo a previously failed switchover operation.
By default all eligible nodes are switched over.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Simulate**
If this optional parameter is set to true, the system runs a simulation of the negotiated switchover operation to make sure all the prerequisites for the operation are met.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: metrocluster-switchover
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcMetroclusterSwitchover [-Disaster] [-ForceNvfailAll] [-OverrideVetoes] [-RetryFailedNodes <String[]>] [-Simulate] [-StartOnNodeAndSkipNodeVersionChecks <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
