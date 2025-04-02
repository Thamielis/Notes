Set-NcNetTuningTcp
------------------

### Synopsis
Modify TCP tuning options

---

### Description

Modify TCP tuning options

---

### Examples
> Example 1

```PowerShell
Set-NcNetTuningTcp -Node sapanj-vsim3 -IsRfc3390Enabled $false
Modify TCP tuning options

IsPathMtuDiscoveryEnabled          : True
IsRfc3390Enabled                   : False
IsRfc3465Enabled                   : True
IsSackEnabled                      : True
MaxCwndIncrement                   : 2
NcController                       : 10.140.111.42
Node                               : sapanj-vsim3
IsPathMtuDiscoveryEnabledSpecified : True
IsRfc3390EnabledSpecified          : True
IsRfc3465EnabledSpecified          : True
IsSackEnabledSpecified             : True
MaxCwndIncrementSpecified          : True

```

---

### Parameters
#### **Node**
Node Name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **IsPathMtuDiscoveryEnabled**
Path MTU discovery enabled

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsRfc3390Enabled**
RFC3390 enabled

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsRfc3465Enabled**
RFC3465 enabled

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsSackEnabled**
SACK supoort enabled

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **MaxCwndIncrement**
Maximum congestion window segments incrementation

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetTuningTcpOptions

---

### Notes
Category: net
API: net-tuning-tcp-modify
Family: ontap-cluster

---

### Syntax
```PowerShell
Set-NcNetTuningTcp [-Node] <String> [-IsPathMtuDiscoveryEnabled <Boolean>] [-IsRfc3390Enabled <Boolean>] [-IsRfc3465Enabled <Boolean>] [-IsSackEnabled <Boolean>] [-MaxCwndIncrement <Int64>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
