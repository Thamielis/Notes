Get-NcFcpAdapterStatistics
--------------------------

### Synopsis
Get a list of fcp adapter statistics.

---

### Description

Get a list of fcp adapter statistics.

---

### Related Links
* [Get-NcFcpAdapter](Get-NcFcpAdapter)

---

### Examples
> Example 1

```PowerShell
Get-NcFcpAdapterStatistics
Get the adapter statistics for all the FCP adapters on the current cluster.

Adapter                              : 0a
AdapterResets                        : 0
CrcErrors                            :
DiscardedFrames                      :
FrameOverruns                        :
FrameUnderruns                       :
InitiatorsConnected                  : 0
InvalidXmitWords                     :
IsSfpDiagnosticsInternallyCalibrated : True
IsSfpOpticalTransceiverValid         : True
IsSfpRxPowerInRange                  : True
IsSfpTxPowerInRange                  : True
LinkBreaks                           :
LipResets                            : 0
LrReceived                           : 0
LrSent                               : 0
NosReceived                          : 1
OlsReceived                          : 0
ProtocolErrors                       : 0
QueueDepth                           : 2048
ScsiRequestsDropped                  :
SfpConnector                         : LC
SfpDateCode                          : 11:02:02
SfpEncoding                          : 8B10B
SfpFcSpeedCapabilties                :
SfpFormfactor                        : SFP
SfpPartNumber                        : FTLF8524P2BNV
SfpRev                               : A
SfpRxPower                           : 491.9 (uWatts)
SfpSerialNumber                      : PK613Q4
SfpTxPower                           : 386.5 (uWatts)
SfpVendorName                        : FINISAR CORP.
SfpVendorOui                         : 0:0:0
SfpWavelength                        : 850 (nm)
SpuriousInterrupts                   : 0
TotalLogins                          :
TotalLogouts                         :
IsSfpRxPowerInRangeSpecified         : True
IsSfpTxPowerInRangeSpecified         : True

```
> Example 2

```PowerShell
$q = Get-NcFcpAdapterStatistics -Template
$q.InitiatorsConnected = ">0"
Get-NcFcpAdapterStatistics -Query $q
Get all the FCP adapters with more than zero initiators connected.

Adapter                              : 0a
AdapterResets                        : 0
CrcErrors                            :
DiscardedFrames                      :
FrameOverruns                        :
FrameUnderruns                       :
InitiatorsConnected                  : 1
InvalidXmitWords                     :
IsSfpDiagnosticsInternallyCalibrated : True
IsSfpOpticalTransceiverValid         : True
IsSfpRxPowerInRange                  : True
IsSfpTxPowerInRange                  : True
LinkBreaks                           :
LipResets                            : 0
LrReceived                           : 0
LrSent                               : 0
NosReceived                          : 1
OlsReceived                          : 0
ProtocolErrors                       : 0
QueueDepth                           : 2048
ScsiRequestsDropped                  :
SfpConnector                         : LC
SfpDateCode                          : 11:01:31
SfpEncoding                          : 8B10B
SfpFcSpeedCapabilties                :
SfpFormfactor                        : SFP
SfpPartNumber                        : FTLF8524P2BNV
SfpRev                               : A
SfpRxPower                           : 536.4 (uWatts)
SfpSerialNumber                      : PK605L7
SfpTxPower                           : 381.6 (uWatts)
SfpVendorName                        : FINISAR CORP.
SfpVendorOui                         : 0:0:0
SfpWavelength                        : 850 (nm)
SpuriousInterrupts                   : 0
TotalLogins                          :
TotalLogouts                         :
IsSfpRxPowerInRangeSpecified         : True
IsSfpTxPowerInRangeSpecified         : True

```

---

### Parameters
#### **Adapter**
The slot name of the FC adapter.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|FcpAdapter|

#### **Attributes**
For improved scalability in large clusters, provide an FcpAdapterStatsInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFcpAdapterStatistics -Template" to get the initially empty FcpAdapterStatsInfo object.  If not specified, all data is returned for each object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[FcpAdapterStatsInfo]`|false   |named   |false        |

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
Specify to get an empty FcpAdapterStatsInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FcpAdapterStatsInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFcpAdapterStatistics -Template" to get the initially empty FcpAdapterStatsInfo object.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[FcpAdapterStatsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fcp.FcpAdapterStatsInfo

---

### Notes
Category: fcp
API: fcp-adapter-stats-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcFcpAdapterStatistics [[-Adapter] <String[]>] [-Attributes <FcpAdapterStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpAdapterStatistics -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFcpAdapterStatistics -Query <FcpAdapterStatsInfo> [-Attributes <FcpAdapterStatsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
