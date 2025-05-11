Test-NcNetPath
--------------

### Synopsis
Test performance between specified nodes

---

### Description

Test performance between specified nodes.

---

### Related Links
* [Test-NcLifFailover](Test-NcLifFailover)

---

### Examples
> Example 1

```PowerShell
Test-NcNetPath -DestinationCluster 10.63.1.234 -DestinationNode aparajir-vsim1 -SourceNode aparajir-vsim2 -SessionType remotedatatransfer
Test the path between two nodes

NcController      : 10.63.1.234
AverageLatency    : 00:00:01.3134050
MaximumLatency    : 00:00:01.6259380
MinimumLatency    : 00:00:00.0367650
ReceiveThroughput : 35336748
SendThroughput    : 35336748
TestDuration      : 11363215

```

---

### Parameters
#### **DestinationCluster**
The cluster containing the destination node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **DestinationNode**
The node receiving the session request.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **SourceNode**
The node initiating the session request.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **SessionType**
Type of session used for session parameters.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Net.NetTestPathResultInfo

---

### Notes
Category: net
API: net-test-path
Family: cluster

---

### Syntax
```PowerShell
Test-NcNetPath [-DestinationCluster] <String> [-DestinationNode] <String> [-SourceNode] <String> [-SessionType] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
