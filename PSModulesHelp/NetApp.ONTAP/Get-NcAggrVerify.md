Get-NcAggrVerify
----------------

### Synopsis
Get the status of RAID mirror verification on the named aggregate.

---

### Description

Get the status of RAID mirror verification on the named aggregate.  Status includes percentage complete and whether it's currently suspended.

---

### Related Links
* [Start-NcAggrVerify](Start-NcAggrVerify)

* [Suspend-NcAggrVerify](Suspend-NcAggrVerify)

* [Resume-NcAggrVerify](Resume-NcAggrVerify)

* [Stop-NcAggrVerify](Stop-NcAggrVerify)

---

### Examples
> Example 1

Get-NcAggrVerify -Name aggr0_mcc1
Get the aggregate verify status for the given aggregate.

Name                        IsSuspended       PercentageComplete
----                        -----------       ------------------
aggr0_mcc1                      True                          8%

---

### Parameters
#### **Name**
The name of the aggregate for which to get verify details.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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
API: aggr-verify-list-info
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggrVerify [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
