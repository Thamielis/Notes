New-NcQosWorkload
-----------------

### Synopsis
Create a new workload.

---

### Description

Create a new workload.  A unique name must be provided for the new workload.  No work will be classified to a workload unless the workload has at least one stream.  Therefore at least one stream should usually be created along with a workload.  If the performance of the workload is to be controlled by QoS, a policy must also be defined and attached to the workload.

This cmdlet is not available in ONTAP 8.2 and later.

---

### Related Links
* [Get-NcQosWorkload](Get-NcQosWorkload)

* [Set-NcQosWorkload](Set-NcQosWorkload)

* [Remove-NcQosWorkload](Remove-NcQosWorkload)

* [Update-NcQosWorkload](Update-NcQosWorkload)

---

### Examples
> Example 1

```PowerShell
New-NcQosWorkload test-workload
Create a new quality of service workload named "test-workload"

MatchPriority          : 1
PolicyUuid             : 700169c0-eae7-11e0-8b1e-123478563412
WorkloadClass          : user_defined
WorkloadName           : test-workload
WorkloadUuid           : aba034e9-6e00-11e1-a794-123478563412
MatchPrioritySpecified : True

```

---

### Parameters
#### **Name**
The user visible name of the QoS workload.

|Type      |Required|Position|PipelineInput        |Aliases     |
|----------|--------|--------|---------------------|------------|
|`[String]`|true    |1       |true (ByPropertyName)|WorkloadName|

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
* DataONTAP.C.Types.Qos.QosWorkloadInfo

---

### Notes
Category: qos
API: qos-workload-create
Family: cluster

---

### Syntax
```PowerShell
New-NcQosWorkload [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
