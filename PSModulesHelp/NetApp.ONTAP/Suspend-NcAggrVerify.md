Suspend-NcAggrVerify
--------------------

### Synopsis
Suspend RAID mirror verification on the named aggregate.

---

### Description

Suspend RAID mirror verification on the named aggregate. If no name is given, suspend mirror verification on all aggregates currently being verified.

---

### Related Links
* [Get-NcAggrVerify](Get-NcAggrVerify)

* [Resume-NcAggrVerify](Resume-NcAggrVerify)

* [Start-NcAggrVerify](Start-NcAggrVerify)

* [Stop-NcAggrVerify](Stop-NcAggrVerify)

---

### Examples
> Example 1

Suspend-NcAggrVerify -Name aggr0_mcc1
Suspend the aggregate verification.

Name                        IsSuspended       PercentageComplete
----                        -----------       ------------------
aggr0_mcc1                      True                         15%

---

### Parameters
#### **Name**
The name of the aggregate for which to suspend RAID mirror verification.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Aggr.VerifyDetailInfo

---

### Notes
Category: aggr
API: aggr-verify-suspend
Family: cluster

---

### Syntax
```PowerShell
Suspend-NcAggrVerify [[-Name] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
