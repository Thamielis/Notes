Register-NcMetrocluster
-----------------------

### Synopsis
Configure a node and its DR partner to mirror NVRAM and be configured to participate in a DR switchover.

---

### Description

Configure a node and its DR partner to mirror NVRAM and be configured to participate in a DR switchover.

A job will be spawned to operate on the MetroCluster and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcMetrocluster](Get-NcMetrocluster)

* [Unregister-NcMetrocluster](Unregister-NcMetrocluster)

---

### Examples
> Example 1

```PowerShell
Register-NcMetrocluster
Start the metrocluster configuration.  The result can be monitored by the job cmdlets.

NcController : 10.63.10.33
ErrorCode    : 
ErrorMessage : 
JobId        : 23
JobVserver   : 
Status       : in_progress

```

---

### Parameters
#### **Node**
Name of the node.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Refresh**
If specified, causes the node to refresh the configuration of its partners and to discard the previous configuration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **StartOnNodeAndSkipNodeVersionChecks**
Specify on which Node job starts and skip Node Version checks

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
Category: metrocluster
API: metrocluster-configure
Family: cluster

---

### Syntax
```PowerShell
Register-NcMetrocluster [[-Node] <String>] [-Refresh] [-StartOnNodeAndSkipNodeVersionChecks <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
