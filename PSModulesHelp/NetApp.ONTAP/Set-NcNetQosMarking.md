Set-NcNetQosMarking
-------------------

### Synopsis
Modify the the QoS Marking attributes of a protocol.

---

### Description

Modify the the QoS Marking attributes of a protocol.

---

### Related Links
* [Get-NcNetQosMarking](Get-NcNetQosMarking)

---

### Examples
> Example 1

```PowerShell
Set-NcNetQosMarking -Ipspace Default -Protocol SSH -Dscp 49
Modify the QOS Marking for SSH

Dscp               : 49
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
IPspace Name to modify QOS marking for.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Protocol**
Protocol for which QOS marking is to be modified.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Dscp**
DSCP marking value.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **Enable**
Specify to enable QoS Marking.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Disable**
Specify to disable QoS Marking.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.QosMarking

---

### Notes
Category: net
API: net-qos-marking-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcNetQosMarking [-Ipspace] <String> [-Protocol] <String> [-Dscp <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcNetQosMarking [-Ipspace] <String> [-Protocol] <String> [-Dscp <Int32>] [-Enable] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcNetQosMarking [-Ipspace] <String> [-Protocol] <String> [-Dscp <Int32>] [-Disable] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
