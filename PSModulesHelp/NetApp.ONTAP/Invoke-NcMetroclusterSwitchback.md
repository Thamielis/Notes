Invoke-NcMetroclusterSwitchback
-------------------------------

### Synopsis
Initiate the switchback of storage and client access from nodes in the DR site to their home nodes.

---

### Description

Initiate the switchback of storage and client access from nodes in the DR site to their home nodes.

The home nodes and storage shelves must be powered on and reachable by nodes in the DR site. The Invoke-NcMetroclusterHeal for both Aggregates and RootAggregates must have successfully completed before running this cmdlet. 

A job will be spawned to operate on the MetroCluster and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcJob](Get-NcJob)

---

### Examples
> Example 1

```PowerShell
Invoke-NcMetroclusterSwitchback
Initiate the switchback of storage resources from the DR nodes to the home nodes.

NcController : 10.63.10.33
ErrorCode    : 
ErrorMessage : 
JobId        : 
JobVserver   : 
Status       : succeeded

```

---

### Parameters
#### **OverrideVetoes**
If specified, the system overrides subsystem vetoes that might prevent the switchback operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OverrideClusterStreamResyncErrors**
If specified, the system overrides errors during the cluster stream resync phase that might prevent the switchback operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OverrideVserverStreamResyncErrors**
If specified, the system overrides errors during the vserver stream resync phase that might prevent the switchback operation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Simulate**
If this optional parameter is set to true, the system runs a simulation of the switchback operation to make sure all the prerequisites for the operation are met.

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
API: metrocluster-switchback
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcMetroclusterSwitchback [-OverrideVetoes] [-OverrideClusterStreamResyncErrors] [-OverrideVserverStreamResyncErrors] [-Simulate] [-StartOnNodeAndSkipNodeVersionChecks <String>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
