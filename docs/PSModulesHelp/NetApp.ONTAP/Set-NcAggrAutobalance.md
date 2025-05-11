Set-NcAggrAutobalance
---------------------

### Synopsis
Modify the Auto Balance Aggregate configuration.

---

### Description

Modify the Auto Balance Aggregate configuration.

---

### Related Links
* [Get-NcAggrAutobalance](Get-NcAggrAutobalance)

* [Enable-NcAggrAutobalance](Enable-NcAggrAutobalance)

* [Disable-NcAggrAutobalance](Disable-NcAggrAutobalance)

---

### Examples
> Example 1

```PowerShell
Set-NcAggrAutobalance -MoveMode auto
Change the aggregate autobalance move mode to 'auto'.

AvailableThresholdPercent             : 40
HoldDurationAfterMove                 : 48
IsEnabled                             : True
MoveMode                              : auto
NcController                          : 10.63.10.37
StatePollingInterval                  : 3600
UnbalancedThresholdPercent            : 70
VolumeActivityThreshold               : 100
VolumeInactiveDelayThreshold          : 24

```

---

### Parameters
#### **MoveMode**
The mode dictates what Auto Balance Aggregate will do with the suggested moves. Possible values: 'recommend', 'auto'.
In 'recommend' mode, the suggested moves will be displayed, but no further action will be taken. In 'auto' mode, Auto Balance Aggregate will trigger moves to start. The default mode is 'recommend'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **StatePollingInterval**
Polling period, in seconds, used by Auto Balance Aggregate to update volume and aggregate stats. The default value is 360 seconds (1 hour).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **UnbalancedThresholdPercent**
This percentage will indicate the space used threshold that will cause Auto Balance Aggregate to consider this aggregate as unbalanced. The default value is 60%.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **AvailableThresholdPercent**
When Auto Balance Aggregate identifies an aggregate that needs to be balanced, it will attempt to identify other target aggregates it can move volumes to. 
An aggregate will only be considered as a target if its projected space usage after the move is still under this percentage. Auto Balance Aggregate will attempt to move volumes from an unbalanced aggregate until it is under this percentage. 
The default value is 40%.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **VolumeActivityThreshold**
The threshold, in number of operations per second preformed on a volume (read/write/internal), that will disqualify the volume from being a candidate to be moved by Auto Balance Aggregate. 
        
The default value is 100 operations per second.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **VolumeInactiveDelayThreshold**
This value represents a duration in seconds and designates the amount of time that has to elapse after a volume has exceeded the VolumeActivityThreshold before it can be considered a movable volume by Auto Balance Aggregate.
The default value is 24 hours.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **HoldDurationAfterMove**
This value represents the number of seconds that need to have elapsed since the volume was last moved before it will be considered a movable candidate again.
The default value is 48 hours.

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
Set-NcAggrAutobalance [-MoveMode <String>] [-StatePollingInterval <Int32>] [-UnbalancedThresholdPercent <Int32>] [-AvailableThresholdPercent <Int32>] [-VolumeActivityThreshold <Int32>] 
```
```PowerShell
[-VolumeInactiveDelayThreshold <Int32>] [-HoldDurationAfterMove <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
