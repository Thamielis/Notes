Invoke-NcAutoSupportHistoryRetransmit
-------------------------------------

### Synopsis
Retransmit a previously collected AutoSupport message.

---

### Description

Retransmit a previously collected AutoSupport message.

---

### Related Links
* [Get-NcAutoSupportHistory](Get-NcAutoSupportHistory)

---

### Examples
> Example 1

Invoke-NcAutoSupportHistoryRetransmit -NodeName fas3070cluster01-01 -Sequence 745 -Uri example.com/asupPut
Try to resend Autosupport message 745 from node fas3070cluster01-01 to example.com/asupPut.

---

### Parameters
#### **NodeName**
The name of the controller on which the AutoSupport message was be generated.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Sequence**
AutoSupport Sequence Number.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|true    |2       |true (ByPropertyName)|SeqNum |

#### **Uri**
Destination to Send this AutoSupport.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **SizeLimit**
Transmit Size Limit for this AutoSupport.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: autosupport
API: autosupport-history-retransmit
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcAutoSupportHistoryRetransmit [-NodeName] <String> [-Sequence] <Int64> [-Uri] <String> [-SizeLimit <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
