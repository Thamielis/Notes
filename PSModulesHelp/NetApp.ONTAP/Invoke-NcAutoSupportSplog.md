Invoke-NcAutoSupportSplog
-------------------------

### Synopsis
Generate a Remote Service Processor Log AutoSupport message

---

### Description

Generate a Remote Service Processor Log AutoSupport message

---

### Related Links
* [Invoke-NcAutosupport](Invoke-NcAutosupport)

---

### Examples
> Example 1

```PowerShell
Invoke-NcAutoSupportSplog -RemoteNode f3250-215-73-75-02
Generate an autosupport message with all service processor logs collected in node f3250-215-73-75-02
```

---

### Parameters
#### **RemoteNode**
The name of the filer where the Service Processor is present.

|Type      |Required|Position|PipelineInput        |Aliases                             |
|----------|--------|--------|---------------------|------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName<br/>Node<br/>RemoteNodeName|

#### **LogSequence**
The sequence number of the logs to be uploaded.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Uri**
Alternate destination for the AutoSupport.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Force**
If specified, force generation, even if AutoSupport is disabled in the system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: autosupport-invoke-splog
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcAutoSupportSplog [-RemoteNode] <String> [-LogSequence <Int64>] [-Uri <String>] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
