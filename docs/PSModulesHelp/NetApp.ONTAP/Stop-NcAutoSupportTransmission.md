Stop-NcAutoSupportTransmission
------------------------------

### Synopsis
Cancel an AutoSupport Transmission.

---

### Description

Cancel an AutoSupport Transmission.

---

### Related Links
* [Invoke-NcAutosupport](Invoke-NcAutosupport)

* [Get-NcAutoSupportHistory](Get-NcAutoSupportHistory)

---

### Examples
> Example 1

```PowerShell
Stop-NcAutoSupportTransmission -Node f3250-215-73-75-01 -SeqNum 90
Stop the transmission of a particular autosupport message
```

---

### Parameters
#### **Node**
The name of a controller on which the AutoSupport tool is running.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **SeqNum**
Autosupport Sequence Number of msg to stop transmitting.

|Type      |Required|Position|PipelineInput        |Aliases                 |
|----------|--------|--------|---------------------|------------------------|
|`[UInt64]`|true    |2       |true (ByPropertyName)|SeqNo<br/>SequenceNumber|

#### **Destination**
Autosupport Destination : smtp, http, noteto, retransmit.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |3       |true (ByPropertyName)|Dest   |

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
* 

---

### Notes
Category: autosupport
API: autosupport-history-cancel
Family: cluster

---

### Syntax
```PowerShell
Stop-NcAutoSupportTransmission [-Node] <String> [-SeqNum] <UInt64> [[-Destination] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
