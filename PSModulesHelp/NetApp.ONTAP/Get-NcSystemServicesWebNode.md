Get-NcSystemServicesWebNode
---------------------------

### Synopsis
Get the status of the web server for ONTAP web services

---

### Description

Get the status of the web server for ONTAP web services

---

### Examples
> Example 1

```PowerShell
Get-NcSystemServicesWebNode -Node sapanj-vsim3
Gets the status of the web server for ONTAP web services for node sapanj-vsim3

External                           : True
HttpEnabled                        : False
HttpPort                           : 80
HttpsPort                          : 443
MeanConnectionWaitTime             : 0
NcController                       : 10.238.73.251
Node                               : sapanj-vsim3
PeakConcurrency                    : 8
PeakConnectionWaitTime             : 0
PeakPerAddressConcurrency          : 8
PerAddressLimit                    : 80
Status                             : online
StatusCode                         : 200
TotalBytes                         : 36511197
TotalConnections                   : 170
TotalConnectionWaitTime            : 0
TotalDelayedConnections            : 0
TotalHits                          : 504
TotalHttpOps                       : 5
TotalHttpsOps                      : 499
TotalPendAuth                      : 0
TotalRc1xx                         : 0
TotalRc2xx                         : 503
TotalRc3xx                         : 0
TotalRc4xx                         : 1
TotalRc5xx                         : 0
TotalWorkers                       : 96
WaitQueueCapacity                  : 192
WorkersAvail                       : 94
WorkersBusy                        : 2
WorkStateClose                     : 0
WorkStateKeep                      : 0
WorkStateLog                       : 0
WorkStateRead                      : 0
WorkStateReady                     : 94
WorkStateWrite                     : 2
ExternalSpecified                  : True
HttpEnabledSpecified               : True
HttpPortSpecified                  : True
HttpsPortSpecified                 : True
MeanConnectionWaitTimeSpecified    : True
PeakConcurrencySpecified           : True
PeakConnectionWaitTimeSpecified    : True
PeakPerAddressConcurrencySpecified : True
PerAddressLimitSpecified           : True
StatusCodeSpecified                : True
TotalBytesSpecified                : True
TotalConnectionsSpecified          : True
TotalConnectionWaitTimeSpecified   : True
TotalDelayedConnectionsSpecified   : True
TotalHitsSpecified                 : True
TotalHttpOpsSpecified              : True
TotalHttpsOpsSpecified             : True
TotalPendAuthSpecified             : True
TotalRc1xxSpecified                : True
TotalRc2xxSpecified                : True
TotalRc3xxSpecified                : True
TotalRc4xxSpecified                : True
TotalRc5xxSpecified                : True
TotalWorkersSpecified              : True
WaitQueueCapacitySpecified         : True
WorkersAvailSpecified              : True
WorkersBusySpecified               : True
WorkStateCloseSpecified            : True
WorkStateKeepSpecified             : True
WorkStateLogSpecified              : True
WorkStateReadSpecified             : True
WorkStateReadySpecified            : True
WorkStateWriteSpecified            : True

```

---

### Parameters
#### **Node**
Name of the node.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Attributes**
The attributes of the system.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[SystemServicesWebNodeInfo]`|false   |named   |false        |

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
Specify to get an empty SystemServiceWebNodeAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SystemServiceWebNodeAttributes object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSystemServiceWebNode -Template" to get the initially empty SystemServiceWebNodeAttributes object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[SystemServicesWebNodeInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.System.SystemServicesWebNodeInfo

---

### Notes
Category: system
API: system-services-web-node-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcSystemServicesWebNode [[-Node] <String[]>] [-Attributes <SystemServicesWebNodeInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemServicesWebNode -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSystemServicesWebNode -Query <SystemServicesWebNodeInfo> [-Attributes <SystemServicesWebNodeInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
