Get-NcHaInterconnectPerformanceStatistics
-----------------------------------------

### Synopsis
Iterate over list of nodes in the cluster to get their high-availability interconnect performance statistics

---

### Description

Iterate over list of nodes in the cluster to get their high-availability interconnect performance statistics

---

### Examples
> Example 1

```PowerShell
Get-NcHaInterconnectPerformanceStatistics
Gives the performance statistics of the HA pair nodes sapanj-vsim3 and sapanj-vsim4

AverageBytesPerTransfer              : 0
AverageMegabytesPerSecond            : 0.551
AverageReceiveQueueWaitTime          : 
AverageRemoteNvMsgsTime              : 36621
AverageRemoteNvTransferSize          : 3013
AverageRemoteNvTransferTime          : 36989
AvgMiscQueueLength                   : 20
AvgNvlogSyncTime                     : 733
AvgRaidQueueLength                   : 41
AvgWaflQueueLength                   : 0
ElapsedTime                          : 1787
Ic16kWrites                          : 36002
Ic4kWrites                           : 9829
Ic8kWrites                           : 7820
IcDataAligned                        : 15891
IcDataMisaligned                     : 327848
IcIsdone                             : 2617385
IcIsdoneFail                         : 2339932
IcIsdonePass                         : 277453
IcMetadataAligned                    : 2804
IcMetadataMisaligned                 : 373762
IcSmallWrites                        : 625397
IcWaitdoneTime                       : 50
IcWaits                              : 6956
IcXorderReads                        : 0
IcXorderWrites                       : 373615
MaxNvlogSyncTime                     : 915
MiscDataIo                           : 2
MiscFlushIo                          : 
MiscMetadataIo                       : 72520
NcController                         : 10.238.73.251
NodeName                             : sapanj-vsim3
NotifyTimeout                        : 
PreemptTimeout                       : 
QueueMaxTimeout                      : 
QueueMaxWaitCount                    : 5
QueueMaxWaitTime                     : 600
RaidDataIo                           : 23681
RaidFlushIo                          : 
RaidMetadataIo                       : 20603
RdmaRead                             : 21676
RdmaReadWaitdoneTime                 : 1253
RemoteNvTransfers                    : 280560
TotalReceiveQueueWaits               : 0
TotalTransfers                       : 18446744069415252429
WaflDataIo                           : 576752
WaflFlushIo                          : 
WaflMetadataIo                       : 579648
AverageBytesPerTransferSpecified     : True
AverageReceiveQueueWaitTimeSpecified : False
AverageRemoteNvMsgsTimeSpecified     : True
AverageRemoteNvTransferSizeSpecified : True
AverageRemoteNvTransferTimeSpecified : True
AvgMiscQueueLengthSpecified          : True
AvgNvlogSyncTimeSpecified            : True
AvgRaidQueueLengthSpecified          : True
AvgWaflQueueLengthSpecified          : True
ElapsedTimeSpecified                 : True
Ic16kWritesSpecified                 : True
Ic4kWritesSpecified                  : True
Ic8kWritesSpecified                  : True
IcDataAlignedSpecified               : True
IcDataMisalignedSpecified            : True
IcIsdoneFailSpecified                : True
IcIsdonePassSpecified                : True
IcIsdoneSpecified                    : True
IcMetadataAlignedSpecified           : True
IcMetadataMisalignedSpecified        : True
IcSmallWritesSpecified               : True
IcWaitdoneTimeSpecified              : True
IcWaitsSpecified                     : True
IcXorderReadsSpecified               : True
IcXorderWritesSpecified              : True
MaxNvlogSyncTimeSpecified            : True
MiscDataIoSpecified                  : True
MiscFlushIoSpecified                 : False
MiscMetadataIoSpecified              : True
NotifyTimeoutSpecified               : False
PreemptTimeoutSpecified              : False
QueueMaxTimeoutSpecified             : False
QueueMaxWaitCountSpecified           : True
QueueMaxWaitTimeSpecified            : True
RaidDataIoSpecified                  : True
RaidFlushIoSpecified                 : False
RaidMetadataIoSpecified              : True
RdmaReadSpecified                    : True
RdmaReadWaitdoneTimeSpecified        : True
RemoteNvTransfersSpecified           : True
TotalReceiveQueueWaitsSpecified      : True
TotalTransfersSpecified              : True
WaflDataIoSpecified                  : True
WaflFlushIoSpecified                 : False
WaflMetadataIoSpecified              : True

AverageBytesPerTransfer              : 5761
AverageMegabytesPerSecond            : 0.158
AverageReceiveQueueWaitTime          : 
AverageRemoteNvMsgsTime              : 38235
AverageRemoteNvTransferSize          : 2465
AverageRemoteNvTransferTime          : 38677
AvgMiscQueueLength                   : 21
AvgNvlogSyncTime                     : 717
AvgRaidQueueLength                   : 48
AvgWaflQueueLength                   : 4
ElapsedTime                          : 1784
Ic16kWrites                          : 25237
Ic4kWrites                           : 7221
Ic8kWrites                           : 6033
IcDataAligned                        : 14261
IcDataMisaligned                     : 303949
IcIsdone                             : 3281548
IcIsdoneFail                         : 3015498
IcIsdonePass                         : 266050
IcMetadataAligned                    : 2537
IcMetadataMisaligned                 : 359381
IcSmallWrites                        : 611186
IcWaitdoneTime                       : 50
IcWaits                              : 6864
IcXorderReads                        : 0
IcXorderWrites                       : 358969
MaxNvlogSyncTime                     : 866
MiscDataIo                           : 2
MiscFlushIo                          : 
MiscMetadataIo                       : 72070
NcController                         : 10.238.73.251
NodeName                             : sapanj-vsim4
NotifyTimeout                        : 
PreemptTimeout                       : 
QueueMaxTimeout                      : 
QueueMaxWaitCount                    : 225
QueueMaxWaitTime                     : 1933
RaidDataIo                           : 20943
RaidFlushIo                          : 
RaidMetadataIo                       : 20945
RdmaRead                             : 21612
RdmaReadWaitdoneTime                 : 2744
RemoteNvTransfers                    : 268221
TotalReceiveQueueWaits               : 0
TotalTransfers                       : 149652
WaflDataIo                           : 540629
WaflFlushIo                          : 
WaflMetadataIo                       : 555972
AverageBytesPerTransferSpecified     : True
AverageReceiveQueueWaitTimeSpecified : False
AverageRemoteNvMsgsTimeSpecified     : True
AverageRemoteNvTransferSizeSpecified : True
AverageRemoteNvTransferTimeSpecified : True
AvgMiscQueueLengthSpecified          : True
AvgNvlogSyncTimeSpecified            : True
AvgRaidQueueLengthSpecified          : True
AvgWaflQueueLengthSpecified          : True
ElapsedTimeSpecified                 : True
Ic16kWritesSpecified                 : True
Ic4kWritesSpecified                  : True
Ic8kWritesSpecified                  : True
IcDataAlignedSpecified               : True
IcDataMisalignedSpecified            : True
IcIsdoneFailSpecified                : True
IcIsdonePassSpecified                : True
IcIsdoneSpecified                    : True
IcMetadataAlignedSpecified           : True
IcMetadataMisalignedSpecified        : True
IcSmallWritesSpecified               : True
IcWaitdoneTimeSpecified              : True
IcWaitsSpecified                     : True
IcXorderReadsSpecified               : True
IcXorderWritesSpecified              : True
MaxNvlogSyncTimeSpecified            : True
MiscDataIoSpecified                  : True
MiscFlushIoSpecified                 : False
MiscMetadataIoSpecified              : True
NotifyTimeoutSpecified               : False
PreemptTimeoutSpecified              : False
QueueMaxTimeoutSpecified             : False
QueueMaxWaitCountSpecified           : True
QueueMaxWaitTimeSpecified            : True
RaidDataIoSpecified                  : True
RaidFlushIoSpecified                 : False
RaidMetadataIoSpecified              : True
RdmaReadSpecified                    : True
RdmaReadWaitdoneTimeSpecified        : True
RemoteNvTransfersSpecified           : True
TotalReceiveQueueWaitsSpecified      : True
TotalTransfersSpecified              : True
WaflDataIoSpecified                  : True
WaflFlushIoSpecified                 : False
WaflMetadataIoSpecified              : True

```

---

### Parameters
#### **NodeName**
Specify to filter by NodeName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[HaInterconnectPerformanceStatistics]`|false   |named   |false        |

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[HaInterconnectPerformanceStatistics]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.HaInterconnect.HaInterconnectPerformanceStatistics

---

### Notes
Category: ha interconnect
API: ha-interconnect-performance-statistics-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcHaInterconnectPerformanceStatistics [[-NodeName] <String[]>] [-Attributes <HaInterconnectPerformanceStatistics>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectPerformanceStatistics -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectPerformanceStatistics -Query <HaInterconnectPerformanceStatistics> [-Attributes <HaInterconnectPerformanceStatistics>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
