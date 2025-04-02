Start-NcVolCopy
---------------

### Synopsis
Start a volume copy operation.

---

### Description

Start a volume copy operation.

A job will be spawned to operate on the volume and the job will be returned.  The progress of the job can be tracked using the job cmdlets.

---

### Examples
> Example 1

```PowerShell
Start-NcVolCopy -Vserver beam01 -Name luns -DestinationVolume luns_copy -DestinationAggregate test_aggr
Make a copy of the volume on aggregate test_aggr.

ErrorCode    :
ErrorMessage :
JobId        : 2710
JobVserver   : beam01
Status       : in_progress

```

---

### Parameters
#### **Name**
The name of the volume to be copied.

|Type      |Required|Position|PipelineInput                 |Aliases                                     |
|----------|--------|--------|------------------------------|--------------------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|Volume<br/>SourceVolume<br/>SourceVolumeName|

#### **DestinationVolume**
The name of volume on the destination aggregate where the source volume should be copied.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |2       |false        |DestVolume|

#### **DestinationAggregate**
The name of volume on destination aggregate where the source volume should be copied.

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[String]`|true    |3       |false        |Aggregate<br/>DestAggr|

#### **Vserver**
The name of the Vserver which owns the volume.

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
API: volume-copy-start
Family: cluster

---

### Syntax
```PowerShell
Start-NcVolCopy [-Name] <String> [-DestinationVolume] <String> [-DestinationAggregate] <String> [-Vserver <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
