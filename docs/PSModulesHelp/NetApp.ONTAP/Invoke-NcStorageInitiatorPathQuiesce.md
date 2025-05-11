Invoke-NcStorageInitiatorPathQuiesce
------------------------------------

### Synopsis
Quiesce an array LUN on a path.

---

### Description

Quiesce an array LUN on a path. A quiesced array LUN will not be sent I/O on the specified path.

---

### Examples
> Example 1

---

### Parameters
#### **Node**
The node name on which the quiesce is issued.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Initiator**
The initiator port of the path that I/O will be quiesced on.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **TargetWwpn**
The array target port of the path that I/O will be quiesced on. World wide port number should be specified without colons.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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

#### **LunNumber**
LUN number.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |4       |true (ByPropertyName)|

#### **PathFailureThreshold**
The path failure count, exceeding the specified value within wait duration will quiesce the path. Range: [1..100].
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |4       |true (ByPropertyName)|

#### **WaitDuration**
The time duration in which path is monitored for path failures.Examples : 2s (2 seconds), 2m (2 minutes). Range: [1..1440 seconds].
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |5       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: storage initiator
API: storage-initiator-path-quiesce
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcStorageInitiatorPathQuiesce [-Node] <String> [-Initiator] <String> [-TargetWwpn] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcStorageInitiatorPathQuiesce [-Node] <String> [-Initiator] <String> [-TargetWwpn] <String> [[-LunNumber] <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcStorageInitiatorPathQuiesce [-Node] <String> [-Initiator] <String> [-TargetWwpn] <String> [-PathFailureThreshold] <Int32> [-WaitDuration] <String> [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
