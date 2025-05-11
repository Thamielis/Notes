Invoke-NcMetroclusterHeal
-------------------------

### Synopsis
Heal aggregates and partner roots in preparation for a DR switchback.

---

### Description

Heal aggregates and partner roots in preparation for a DR switchback.

Healing of aggregates and partner roots is done in two phases by the admin. DR partner nodes must be powered off and remote disk shelves must be powered on before calling this cmdlets.

A job will be spawned to operate on the MetroCluster and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcJob](Get-NcJob)

---

### Examples
> Example 1

```PowerShell
Invoke-NcMetroclusterHeal -Aggregates
Start the aggregates phase of the MetroCluster heal operation.

NcController : 10.63.10.33
ErrorCode    : 
ErrorMessage : 
JobId        : 24
JobVserver   : 
Status       : in_progress

```
> Example 2

```PowerShell
Invoke-NcMetroclusterHeal -RootAggregates
Start the root aggregates phase of the MetroCluster heal operation.

NcController : 10.63.10.33
ErrorCode    : 
ErrorMessage : 
JobId        : 25
JobVserver   : 
Status       : in_progress

```

---

### Parameters
#### **Aggregates**
If specified, invoke the first healing phase.  The first phase heals aggregates by resyncing mirrored plexes and replaying the nvlogs of non-mirrored aggregates.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

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

#### **RootAggregates**
If specified, invoke the second healing phase.  The second phase heals the root aggregates of partner nodes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: metrocluster
API: metrocluster-heal
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcMetroclusterHeal -Aggregates [-StartOnNodeAndSkipNodeVersionChecks <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcMetroclusterHeal -RootAggregates [-StartOnNodeAndSkipNodeVersionChecks <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
