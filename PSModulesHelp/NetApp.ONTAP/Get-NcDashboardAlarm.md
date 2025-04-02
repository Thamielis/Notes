Get-NcDashboardAlarm
--------------------

### Synopsis
Get alarm monitoring data for all objects in the cluster.

---

### Description

Get alarm monitoring data for all objects in the cluster.

---

### Examples
> Example 1

Get-NcDashboardAlarm -DashboardMetricType aggregate_used
Get all of the aggregate_used dashboard alarms.

DashboardMetricType      ObjectName                   State           LastValue    HighValue Node
-------------------      ----------                   -----           ---------    --------- ----
aggregate_used           aggr0_fas3070cluster01_02_0  critical              95%          95% fas3070cluster01-01
aggregate_used           aggr0                        critical              95%          95% fas3070cluster01-01

> Example 2

$q = Get-NcDashboardAlarm -Template
$q.HighValue = ">90%"
Get-NcDashboardAlarm -Query $q
Get all the dashboard alarms with a high value greater than 90%.

DashboardMetricType      ObjectName                   State           LastValue    HighValue Node
-------------------      ----------                   -----           ---------    --------- ----
aggregate_used           aggr0_fas3070cluster01_02_0  critical              95%          95% fas3070cluster01-01
aggregate_used           aggr0                        critical              95%          95% fas3070cluster01-01

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

#### **Node**
Name of the node associated with the alarm metrics.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **ObjectName**
Name associated with the object being monitored.  For example, the ObjectName is the name of the node if the DashboardMetricType is cpu-busy.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a DashboardAlarmInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcDashboardAlarm -Template" to get the initially empty DashboardAlarmInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[DashboardAlarmInfo]`|false   |named   |false        |

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
Specify to get an empty DashboardAlarmInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a DashboardAlarmInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcDashboardAlarm -Template" to get the initially empty DashboardAlarmInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[DashboardAlarmInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Dashboard.DashboardAlarmInfo

---

### Notes
Category: dashboard
API: dashboard-alarm-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcDashboardAlarm [[-DashboardMetricType] <String[]>] [[-Node] <String[]>] [[-ObjectName] <String[]>] [-Attributes <DashboardAlarmInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcDashboardAlarm -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcDashboardAlarm -Query <DashboardAlarmInfo> [-Attributes <DashboardAlarmInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
