Disable-NcNetPortHealthMonitor
------------------------------

### Synopsis
Disable one or more port health monitors

---

### Description

Disable one or more port health monitors

---

### Examples
> Example 1

Disable-NcNetPortHealthMonitor -Ipspace Cluster -HealthMonitors link_flapping,l2_reachability
Disable link_flapping and l2_reachability port health monitors

Disabling port health monitors
Are you sure you want to disable port health monitors System.String[] for Ipspace Cluster.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): a

HealthMonitors                          Ipspace                                 NcController
--------------                          -------                                 ------------
{crc_errors}                            Cluster                                 10.238.73.251

---

### Parameters
#### **Ipspace**
IPspace Name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **HealthMonitors**
List of Port Health Monitors to Disable

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetPortHealthMonitorInfo

---

### Notes
Category: net
API: net-port-health-monitor-disable
Family: cluster

---

### Syntax
```PowerShell
Disable-NcNetPortHealthMonitor [-Ipspace] <String> [-HealthMonitors] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
