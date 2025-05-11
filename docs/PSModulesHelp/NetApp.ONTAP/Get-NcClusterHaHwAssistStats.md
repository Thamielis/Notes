Get-NcClusterHaHwAssistStats
----------------------------

### Synopsis
Get useful information about statistics of hardware assisted takeover functionality.

---

### Description

Get useful information about statistics of hardware assisted takeover functionality.

---

### Related Links
* [Get-NcClusterHaHwAssist](Get-NcClusterHaHwAssist)

* [Reset-NcClusterHaHwAssistStats](Reset-NcClusterHaHwAssistStats)

---

### Examples
> Example 1

```PowerShell
Get-NcClusterHaHwAssistStats -Node sfp-cmode-02-01
Get statistics for the hw assisted takeover for node sfp-cmode-02-01.

NoStats                       :
HwAssistStatsPostError        : system_down  post_error                0 No        ---
HwAssistStatsPowerLoss        : system_down  power_loss                0 Yes       ---
HwAssistStatsWatchdogReset    : system_down  l2_watchdog_reset         0 Yes       ---
HwAssistStatsPowerOffViaRlm   : system_down  power_off_via_rlm         0 Yes       ---
HwAssistStatsPowerCycleViaRlm : system_down  power_cycle_via_rlm       0 Yes       ---
HwAssistStatsResetViaRlm      : system_down  reset_via_rlm             0 Yes       ---
HwAssistStatsPowerOffViaSp    : system_down  power_off_via_sp          0 Yes       ---
HwAssistStatsPowerCycleViaSp  : system_down  power_cycle_via_sp        0 Yes       ---
HwAssistStatsResetViaSp       : system_down  reset_via_sp              0 Yes       ---
HwAssistStatsAbnormalReboot   : system_down  abnormal_reboot           0 No        ---
HwAssistStatsLossOfHeartbeat  : system_down  loss_of_heartbeat         0 No        ---
HwAssistStatsKeepAlive        : keep_alive   periodic_message      32621 No        Mon Dec 16 15:07:56 GMT 2013

HwAssistStatsTest             : test         test                      2 No        Fri Dec 13 19:20:30 GMT 2013

HwAssistStatsBadNvramId       : ID_mismatch  ---                       0 ---       ---

HwAssistStatsSsMismatch       : Key_mismatch ---                       0 ---       ---

HwAssistStatsUnknownAlerts    : Unknown      ---                       0 ---       ---

HwAssistStatsTimesThrottled   : Number_of_times_hw_assist_alerts_throttled: 0

```

---

### Parameters
#### **Node**
Node name for which the API is requested.

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
* DataONTAP.C.Types.Cf.ClusterHaHwAssistStats

---

### Notes
Category: cf
API: cf-hwassist-stats
Family: cluster

---

### Syntax
```PowerShell
Get-NcClusterHaHwAssistStats [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
