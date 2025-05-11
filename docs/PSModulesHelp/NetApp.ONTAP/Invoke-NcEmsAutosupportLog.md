Invoke-NcEmsAutosupportLog
--------------------------

### Synopsis
This cmdlet is used by applications to log specific events occurring on a host system.

---

### Description

This cmdlet is used by applications to log specific events occurring on a host system.

---

### Examples
> Example 1

```PowerShell
Invoke-NcEmsAutosupportLog -ComputerName "host1" -EventId 100 -EventSource "powershell" -AppVersion "2.0" -Category "test" -EventDescription "this is a test message." -LogLevel 6 -Node fas3070cluster01-01
Log a test EMS log message.
```

---

### Parameters
#### **ComputerName**
Host name invoking the API.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **EventId**
ID of event.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |2       |true (ByPropertyName)|

#### **EventSource**
Name of the application invoking the API.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **AppVersion**
Version of application invoking the API.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **Category**
Application defined category of the event.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |5       |true (ByPropertyName)|

#### **EventDescription**
Description of event to log.  An application defined message to log.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |6       |true (ByPropertyName)|

#### **LogLevel**
Log level.  Accepted values are 0 for 'emergency', 1 for 'alert', 2 for 'critical', 3 for 'error', 4 for 'warning', 5 for 'notice', 6 for 'info', and 7 for 'debug'. Value 2, 4, 6 and 7 for Critical, warning, Info and debug are not supported with Rest.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |7       |true (ByPropertyName)|

#### **Node**
Node to log the EMS message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **GenerateAutosupport**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Category: ems
API: ems-autosupport-log
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcEmsAutosupportLog [-ComputerName] <String> [-EventId] <Int64> [-EventSource] <String> [-AppVersion] <String> [-Category] <String> [-EventDescription] <String> [-LogLevel] <Int32> 
```
```PowerShell
[-Node <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-GenerateAutosupport] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
