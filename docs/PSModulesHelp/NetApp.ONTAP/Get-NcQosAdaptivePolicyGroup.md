Get-NcQosAdaptivePolicyGroup
----------------------------

### Synopsis
Get the attributes of an adaptive policy group.

---

### Description

Get the attributes of an adaptive policy group.

---

### Examples
> Example 1

```PowerShell
PS E:\Debug> Get-NcQosAdaptivePolicyGroup -PolicyGroup adaptivepolicygroup1
Get the attributes of an adaptive policy group adaptivepolicygroup1

AbsoluteMinIops       : 75IOPS
ExpectedIops          : 5IOPS/TB
NcController          : 10.140.112.122
NumWorkloads          : 0
PeakIops              : 5IOPS/TB
PeakIopsAllocation    : used_space
Pgid                  : 5909
PolicyGroup           : adaptivepolicygroup1
Uuid                  : a38381c9-704c-11e7-ad9d-0050568a260b
Vserver               : vs1
NumWorkloadsSpecified : True
PgidSpecified         : True

```

---

### Parameters
#### **PolicyGroup**
Name of the adaptive policy group.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned.
If not present, all attributes for which information is available will be returned.
If present, only the desired attributes for which information is available will be returned.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[QosAdaptivePolicyGroupInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object. This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used. In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

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

#### **Template**
Specify to get an empty QosAdaptivePolicyGroup object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a QosAdaptivePolicyGroup object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcQosAdaptivePolicyGroup -Template" to get the initially empty QosAdaptivePolicyGroup object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[QosAdaptivePolicyGroupInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.QosAdaptivePolicyGroupInfo

---

### Notes
Category: qos
API: qos-adaptive-policy-group-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcQosAdaptivePolicyGroup [[-PolicyGroup] <String[]>] [-Attributes <QosAdaptivePolicyGroupInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQosAdaptivePolicyGroup -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcQosAdaptivePolicyGroup -Query <QosAdaptivePolicyGroupInfo> [-Attributes <QosAdaptivePolicyGroupInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
