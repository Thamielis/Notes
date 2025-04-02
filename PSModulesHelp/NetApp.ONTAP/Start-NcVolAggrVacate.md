Start-NcVolAggrVacate
---------------------

### Synopsis
Moves all constituents belonging to a given Infinite Volume from  the source aggregate to the destination aggregate.

---

### Description

Moves all constituents belonging to a given Infinite Volume from  the source aggregate to the destination aggregate. 

A job will be spawned to operate on the volume and the job id  will be returned.  The progress of the job can be tracked using the Get-NcJob cmdlet.

---

### Related Links
* [Get-NcJob](Get-NcJob)

---

### Examples
> Example 1

```PowerShell
Start-NcVolAggrVacate -Vserver vs_inf -Volume vol1 -SourceAggr aggr1 -DestAggr aggr2
Start moving all constituents of infinite volume vol1 stored on aggr1 to aggr2.

NcController : 10.63.1.234
ErrorCode    :
ErrorMessage :
JobId        : 154
JobVserver   : vs_inf
Status       : in_progress

```

---

### Parameters
#### **Vserver**
The name of the Vserver which owns the infinite volume.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|VserverName|

#### **Volume**
Name of the infinite volume.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |2       |true (ByPropertyName)|VolumeName|

#### **SourceAggr**
The name of the source aggregate from which all Infinite Volume constituents are being moved.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|true    |3       |false        |Source<br/>SourceAggregate|

#### **DestAggr**
The name of the destination aggregate to which all Infinite Volume constituents are being moved.

|Type      |Required|Position|PipelineInput|Aliases                             |
|----------|--------|--------|-------------|------------------------------------|
|`[String]`|true    |4       |false        |Destination<br/>DestinationAggregate|

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
Category: volume
API: volume-aggregate-vacate-async
Family: cluster

---

### Syntax
```PowerShell
Start-NcVolAggrVacate [-Vserver] <String> [-Volume] <String> [-SourceAggr] <String> [-DestAggr] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
