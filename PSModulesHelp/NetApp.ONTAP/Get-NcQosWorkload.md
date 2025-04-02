Get-NcQosWorkload
-----------------

### Synopsis
Get a list of workloads.

---

### Description

Get a list of workloads.

---

### Related Links
* [New-NcQosWorkload](New-NcQosWorkload)

* [Remove-NcQosWorkload](Remove-NcQosWorkload)

* [Set-NcQosWorkload](Set-NcQosWorkload)

* [Update-NcQosWorkload](Update-NcQosWorkload)

---

### Examples
> Example 1

```PowerShell
Get-NcQosWorkload -Name User-Default
Get the quality of service workload named "User-Default"

MatchPriority          : 0
PolicyUuid             : 700169c0-eae7-11e0-8b1e-123478563412
WorkloadClass          : preset
WorkloadName           : User-Default
WorkloadUuid           : 700283a0-eae7-11e0-8b1e-123478563412
MatchPrioritySpecified : True

```
> Example 2

```PowerShell
$q = Get-NcQosWorkload -Template
$q.WorkloadClass = "user_defined"
Get-NcQosWorkload -Query $q
Get all of the quality of service workloads that are user defined.

MatchPriority          : 1
PolicyUuid             : 700169c0-eae7-11e0-8b1e-123478563412
WorkloadClass          : user_defined
WorkloadName           : test-workload
WorkloadUuid           : f7c38bee-6de3-11e1-a794-123478563412
MatchPrioritySpecified : True

```

---

### Parameters
#### **Name**
The QoS workload name(s) to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|WorkloadName|

#### **PolicyUuid**
Unique identifier(s) of the policy the workload is using.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **PolicyGroup**
Name of one or more policy groups.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a QosStreamInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcQosStream -Template" to get the initially empty QosStreamInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[QosWorkloadInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty QosStreamInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QosStreamInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQosStream -Template" to get the initially empty QosStreamInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[QosWorkloadInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosWorkloadInfo

---

### Notes
Category: qos
API: qos-workload-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcQosWorkload [[-Name] <String[]>] [[-PolicyUuid] <String[]>] [[-PolicyGroup] <String[]>] [-Attributes <QosWorkloadInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQosWorkload -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcQosWorkload -Query <QosWorkloadInfo> [-Attributes <QosWorkloadInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
