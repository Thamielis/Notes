Remove-NcQosWorkload
--------------------

### Synopsis
Remove a workload.

---

### Description

Remove a workload.  This also deletes any streams attached to the workload. Only user defined workloads may be deleted.

---

### Related Links
* [Get-NcQosWorkload](Get-NcQosWorkload)

* [New-NcQosWorkload](New-NcQosWorkload)

* [Set-NcQosWorkload](Set-NcQosWorkload)

* [Update-NcQosWorkload](Update-NcQosWorkload)

---

### Examples
> Example 1

```PowerShell
Remove-NcQosWorkload -WorkloadUuid 9c4c3de2-6e0d-11e1-a794-123478563412
Remove the given workload.
```
> Example 2

```PowerShell
$q = Get-NcQosWorkload -Template
$q.WorkloadName = "test-workload"
Remove-NcQosWorkload -Query $q
Remove the workloads that match the given query.

SuccessCount : 1
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Qos.QosWorkloadInfo}
FailureList  : {}

```

---

### Parameters
#### **Name**
Name or universally unique identifier for the workload to which the stream is attached.

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|WorkloadUuid<br/>WorkloadName|

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
A QosWorkloadInfo object with various fields set to indicate which QoS workloads to delete.  Other fields should remain set to null.  Use "Get-NcQosWorkload -Template" to get the initially empty QosWorkloadInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[QosWorkloadInfo]`|true    |named   |false        |

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
API: qos-workload-destroy, qos-workload-destroy-iter,qos-workload-delete, qos-workload-delete-iter
Family: cluster

---

### Syntax
```PowerShell
Remove-NcQosWorkload [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcQosWorkload -Query <QosWorkloadInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
