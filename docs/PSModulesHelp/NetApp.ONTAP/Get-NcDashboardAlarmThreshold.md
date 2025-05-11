Get-NcDashboardAlarmThreshold
-----------------------------

### Synopsis
Get alarm threshold settings for all metric groups.

---

### Description

Get alarm threshold settings for all metric groups.

---

### Related Links
* [Set-NcDashboardAlarmThreshold](Set-NcDashboardAlarmThreshold)

---

### Examples
> Example 1

Get-NcDashboardAlarmThreshold
Get all of the dashboard alarm thresholds.

DashboardMetricType         PollingIntervalTS   WarningThreshold  CriticalThreshold  IsUserNotificationEnabled
-------------------         -----------------   ----------------  -----------------  -------------------------
aggregate_used                       00:05:00                85%                95%             True
cpu_busy                             00:05:00               100%                               False
op_latency                           00:05:00              100ms              500ms            False
port_problems                        00:05:00                 1%                 5%            False
port_util                            00:05:00               100%                               False

> Example 1

$q = Get-NcDashboardAlarmThreshold -Template
$q.IsUserNotificationEnabled = $true
Get-NcDashboardAlarmThreshold -Query $q
Get all of the dashboard alarm thresholds with the user notification enabled.

DashboardMetricType         PollingIntervalTS   WarningThreshold  CriticalThreshold  IsUserNotificationEnabled
-------------------         -----------------   ----------------  -----------------  -------------------------
aggregate_used                       00:05:00                85%                95%             True

---

### Parameters
#### **DashboardMetricType**
The type of metric being monitored. Possible values:
"cpu_busy"       - CPU Utilization
"port_util"      - Port Utilization
"op_latency"     - Average Client Latency of NFS and CIFS operations
"aggregate_used" - Storage Aggregate Utilization
"port_problems"  - Packet Error Ratio

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a DashboardAlarmThresholdInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDashboardAlarmThreshold -Template" to get the initially empty DashboardAlarmThresholdInfo object.  If not specified, all data is returned for each object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[DashboardAlarmThresholdInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty DashboardAlarmThresholdInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a DashboardAlarmThresholdInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcDashboardAlarmThreshold -Template" to get the initially empty DashboardAlarmThresholdInfo object.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[DashboardAlarmThresholdInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Dashboard.DashboardAlarmThresholdInfo

---

### Notes
Category: dashboard
API: dashboard-alarm-threshold-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDashboardAlarmThreshold [[-DashboardMetricType] <String[]>] [-Attributes <DashboardAlarmThresholdInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDashboardAlarmThreshold -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDashboardAlarmThreshold -Query <DashboardAlarmThresholdInfo> [-Attributes <DashboardAlarmThresholdInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
