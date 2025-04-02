Get-NcNetPortHealthMonitor
--------------------------

### Synopsis
Iterate over the the network port health monitors enabled for each IPspace.

---

### Description

Iterate over the the network port health monitors enabled for each IPspace.

---

### Examples
> Example 1

Get-NcNetPortHealthMonitor
Iterate over the the network port health monitors enabled for each IPspace.

HealthMonitors                          Ipspace                                 NcController
--------------                          -------                                 ------------
{l2_reachability, link_flapping, crc... Cluster                                 10.238.73.251
{l2_reachability, link_flapping, crc... Default                                 10.238.73.251

---

### Parameters
#### **Ipspace**
IPspace Name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetPortHealthMonitorInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetPortHealthMonitor -Template" to get the initially empty NetPortHealthMonitorInfo  object.  If not specified, all data is returned for each object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[NetPortHealthMonitorInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty NetPorthealthMonitorInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetPorthealthMonitorInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetPorthealthMonitor -Template" to get the initially empty NetPorthealthMonitorInfo object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[NetPortHealthMonitorInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetPortHealthMonitorInfo

---

### Notes
Category: net
API: net-port-health-monitor-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetPortHealthMonitor [[-Ipspace] <String[]>] [-Attributes <NetPortHealthMonitorInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetPortHealthMonitor -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetPortHealthMonitor -Query <NetPortHealthMonitorInfo> [-Attributes <NetPortHealthMonitorInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
