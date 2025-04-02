Set-NcNetTuningIcmp
-------------------

### Synopsis
Modify ICMP tuning options

---

### Description

Modify ICMP tuning options

---

### Examples
> Example 1

```PowerShell
Set-NcNetTuningIcmp -Node sapanj-vsim3 -IsDropRedirectEnabled $true
Modify ICMP tuning options

IsDropRedirectEnabled          : True
NcController                   : 10.140.111.42
Node                           : sapanj-vsim3
TxIcmpLimit                    : 200
IsDropRedirectEnabledSpecified : True
TxIcmpLimitSpecified           : True

```

---

### Parameters
#### **Node**
Node Name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **IsDropRedirectEnabled**
Drop redirect ICMP

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **TxIcmpLimit**
Maximum number of ICMP packets sent per second

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **RedirectTimeout**
Maximum seconds for route redirect timeout
This parameter is available in ONTAP 9.3 and later.

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
The number of times to retry commands that return with errors that may succeed after a retry.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetTuningIcmpOptions

---

### Notes
Category: net
API: net-tuning-icmp-modify
Family: ontap-cluster

---

### Syntax
```PowerShell
Set-NcNetTuningIcmp [-Node] <String> [-IsDropRedirectEnabled <Boolean>] [-TxIcmpLimit <Int64>] [-RedirectTimeout <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
