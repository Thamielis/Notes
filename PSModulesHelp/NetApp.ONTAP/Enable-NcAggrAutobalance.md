Enable-NcAggrAutobalance
------------------------

### Synopsis
Enable aggregate autobalance.

---

### Description

Enable aggregate autobalance.

---

### Related Links
* [Disable-NcAggrAutobalance](Disable-NcAggrAutobalance)

* [Get-NcAggrAutobalance](Get-NcAggrAutobalance)

* [Set-NcAggrAutobalance](Set-NcAggrAutobalance)

---

### Examples
> Example 1

```PowerShell
Enable-NcAggrAutobalance
Enable the aggregate autobalance.

AvailableThresholdPercent             : 40
HoldDurationAfterMove                 : 48
IsEnabled                             : True
MoveMode                              : recommend
NcController                          : 10.63.10.37
StatePollingInterval                  : 3600
UnbalancedThresholdPercent            : 70
VolumeActivityThreshold               : 100
VolumeInactiveDelayThreshold          : 24

```

---

### Parameters
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
* DataONTAP.C.Types.Aggr.AggrAutobalanceConfig

---

### Notes
Category: aggr
API: aggr-autobalance-config-modify
Family: cluster

---

### Syntax
```PowerShell
Enable-NcAggrAutobalance [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
