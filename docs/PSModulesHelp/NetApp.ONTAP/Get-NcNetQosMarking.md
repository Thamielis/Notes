Get-NcNetQosMarking
-------------------

### Synopsis
Get a list of QoS Marking objects

---

### Description

Get a list of QoS Marking objects

---

### Related Links
* [Set-NcNetQosMarking](Set-NcNetQosMarking)

---

### Examples
> Example 1

```PowerShell
Get-NcNetQosMarking -Protocol SSH
Get QOS Marking details for SSH

Dscp               : 48
Ipspace            : Cluster
IsEnabled          : False
NcController       : 10.63.1.234
Protocol           : SSH
DscpSpecified      : True
IsEnabledSpecified : True

Dscp               : 48
Ipspace            : Default
IsEnabled          : False
NcController       : 10.63.1.234
Protocol           : SSH
DscpSpecified      : True
IsEnabledSpecified : True

```

---

### Parameters
#### **Ipspace**
Specify to filter by Ipspace

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Protocol**
Specify to filter by Protocol

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[QosMarking]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[QosMarking]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.QosMarking

---

### Notes
Category: net
API: net-qos-marking-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetQosMarking [[-Ipspace] <String[]>] [[-Protocol] <String[]>] [-Attributes <QosMarking>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetQosMarking -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetQosMarking -Query <QosMarking> [-Attributes <QosMarking>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
