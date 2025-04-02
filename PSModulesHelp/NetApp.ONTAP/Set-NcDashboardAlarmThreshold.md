Set-NcDashboardAlarmThreshold
-----------------------------

### Synopsis
Modify alarm threshold settings for the given metric group.

---

### Description

Modify alarm threshold settings for the given metric group.

---

### Related Links
* [Get-NcDashboardAlarmThreshold](Get-NcDashboardAlarmThreshold)

---

### Examples
> Example 1

Set-NcDashboardAlarmThreshold -DashboardMetricType port_problems -WarningThreshold 2 -ThresholdUnits percent
Set the warning threshold for the dashboard metric type port_problems to 2%.

DashboardMetricType         PollingIntervalTS   WarningThreshold  CriticalThreshold  IsUserNotificationEnabled
-------------------         -----------------   ----------------  -----------------  -------------------------
port_problems                        00:05:00                 2%                 5%            False

---

### Parameters
#### **DashboardMetricType**
The type of metric being monitored. Possible values:
"cpu_busy"       - CPU Utilization
"port_util"      - Port Utilization
"op_latency"     - Average Client Latency of NFS and CIFS operations
"aggregate_used" - Storage Aggregate Utilization
"port_problems"  - Packet Error Ratio

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **PollingInterval**
The refresh interval for the alarm dashboard metrics (in seconds).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **IsUserNotificationEnabled**
Specifies whether user notifications are enabled.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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

#### **WarningThreshold**
The threshold value that must be reached to generate a warning alarm for this type of metric.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **CriticalThreshold**
The threshold value that must be reached to generate a critical alarm for this type of metric.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **ThresholdUnits**
Threshold Units Possible values:
"none"      - none
"ms"        - milliseconds
"percent"   - percent

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Dashboard.DashboardAlarmThresholdInfo

---

### Notes
Category: dashboard
API: dashboard-alarm-threshold-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcDashboardAlarmThreshold [-DashboardMetricType] <String> [-PollingInterval <Int32>] [-IsUserNotificationEnabled <Boolean>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDashboardAlarmThreshold [-DashboardMetricType] <String> [-WarningThreshold <Int64>] [-CriticalThreshold <Int64>] -ThresholdUnits <String> [-PollingInterval <Int32>] 
```
```PowerShell
[-IsUserNotificationEnabled <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
