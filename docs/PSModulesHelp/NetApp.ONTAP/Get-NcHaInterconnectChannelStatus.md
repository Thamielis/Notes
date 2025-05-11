Get-NcHaInterconnectChannelStatus
---------------------------------

### Synopsis
Iterate over list of nodes in the cluster to get their high-availability interconnect channel status.

---

### Description

Iterate over list of nodes in the cluster to get their high-availability interconnect channel status.

---

### Examples
> Example 1

Get-NcHaInterconnectChannelStatus -NodeName sapanj-vsim3
Gives the status of the channel for node sapanj-vsim3

ChannelName                   ChannelStatus                 NcController                  NodeName                     
-----------                   -------------                 ------------                  --------                     
kill                          up                            10.238.73.251                 sapanj-vsim3                 
kstat                         up                            10.238.73.251                 sapanj-vsim3                 
misc                          up                            10.238.73.251                 sapanj-vsim3                 
ofw                           up                            10.238.73.251                 sapanj-vsim3                 
raid                          up                            10.238.73.251                 sapanj-vsim3                 
stream0                       up                            10.238.73.251                 sapanj-vsim3                 
stream1                       up                            10.238.73.251                 sapanj-vsim3                 
wafl                          up                            10.238.73.251                 sapanj-vsim3

---

### Parameters
#### **NodeName**
Specify to filter by NodeName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **ChannelName**
Specify to filter by ChannelName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[HaInterconnectChannelStatus]`|false   |named   |false        |

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

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[HaInterconnectChannelStatus]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.HaInterconnect.HaInterconnectChannelStatus

---

### Notes
Category: ha interconnect
API: ha-interconnect-channel-status-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcHaInterconnectChannelStatus [[-NodeName] <String[]>] [[-ChannelName] <String[]>] [-Attributes <HaInterconnectChannelStatus>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectChannelStatus -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectChannelStatus -Query <HaInterconnectChannelStatus> [-Attributes <HaInterconnectChannelStatus>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
