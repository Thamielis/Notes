Remove-NcQosStream
------------------

### Synopsis
Remove a stream.

---

### Description

Remove a stream.

This cmdlet is not available in ONTAP 8.2 and later.

---

### Related Links
* [Get-NcQosStream](Get-NcQosStream)

* [New-NcQosStream](New-NcQosStream)

---

### Examples
> Example 1

```PowerShell
Remove-NcQosStream -StreamId 0 -WorkloadUuid aba034e9-6e00-11e1-a794-123478563412
Remove the specified quality of service stream.
```
> Example 2

```PowerShell
$q = Get-NcQosStream -Template
Initialize-NcObjectProperty $q Characteristics 1
$q.Characteristics[0].Volume = "luns"
Remove-NcQosStream -Query $q
Remove all quality of service streams for volume "luns"

SuccessCount : 1
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Qos.QosStreamInfo}
FailureList  : {}

```

---

### Parameters
#### **StreamId**
Identifier for this stream.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |1       |true (ByPropertyName)|

#### **WorkloadUuid**
Universally unique identifier for the workload to which the stream is attached.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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

#### **Query**
A QosStreamInfo object with various fields set to indicate which QoS streams to delete.  Other fields should remain set to null.  Use "Get-NcQosStream -Template" to get the initially empty QosStreamInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[QosStreamInfo]`|true    |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple objects match a given query.  If set to true, the API will continue removing the next matching object even when removal of a previous object fails.  If set to false, the API will return on the first failure.  Default: false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures, then this input element may be provided to limit the number of failed remove operations before the server gives up and returns.  If set, the cmdlet will continue removing the next matching object even when the removal of a previous matching object fails, and do so until the total number of objects failed to be removed reaches the maximum specified.  If set to the maximum or not provided, then there will be no limit on the number of failed remove operations.  Only applicable if ContinueOnFailure is specified.  Default: 2^32-1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: qos
API: qos-stream-destroy, qos-stream-destroy-iter
Family: cluster

---

### Syntax
```PowerShell
Remove-NcQosStream [-StreamId] <Int64> [-WorkloadUuid] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcQosStream -Query <QosStreamInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
