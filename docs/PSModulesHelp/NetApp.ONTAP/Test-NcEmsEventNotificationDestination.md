Test-NcEmsEventNotificationDestination
--------------------------------------

### Synopsis
Check connectivity to an event notification destination

---

### Description

Check connectivity to an event notification destination

---

### Related Links
* [New-NcEmsEventNotificationDestination](New-NcEmsEventNotificationDestination)

---

### Examples
> Example 1

Test-NcEmsEventNotificationDestination -DestinationName testDest -Node aparajir-vsim2
Test connectivity from node aparajir-vsim2 to destination testDest

CheckPassed  ResultLog
-----------  ---------
False        Not yet supported.

---

### Parameters
#### **DestinationName**
Name of the Event Notification Destination

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Node**
Node from which connectivity is to be checked

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* NetApp.Ontapi.Filer.C.Ems840.EmsEventNotificationDestinationCheckResult

---

### Notes
Category: ems
API: ems-event-notification-destination-check
Family: cluster

---

### Syntax
```PowerShell
Test-NcEmsEventNotificationDestination [-DestinationName] <String> [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
