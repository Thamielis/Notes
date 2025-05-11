Set-NcEmsRoute
--------------

### Synopsis
Modify the specified EMS route.

---

### Description

Modify the specified EMS route.

---

### Related Links
* [Get-NcEmsRoute](Get-NcEmsRoute)

* [Update-NcEmsRoute](Update-NcEmsRoute)

---

### Examples
> Example 1

Set-NcEmsRoute app.log.info -Destinations @("asup")
Set the destination to "asup" for the EMS route for the message app.log.info.

Action                      : (UNKNOWN)
Description                 : This event is issued when an application's message is meant for informational purposes.
Destinations                : {asup}
FrequencyThreshold          : 0
MessageName                 : app.log.info
Severity                    : informational
SnmpSupport                 : True
TimeThreshold               : 0

---

### Parameters
#### **Name**
The name of the EMS message.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|MessageName|

#### **Destinations**
The event destinations.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **FrequencyThreshold**
Number of times an event occurs before a repeat notification of the event is sent.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **TimeThreshold**
Minimum number of seconds between repeat notifications of an event.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Ems.EmsRoutingInfo

---

### Notes
Category: ems
API: ems-routing-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcEmsRoute [-Name] <String> [-Destinations <String[]>] [-FrequencyThreshold <Int64>] [-TimeThreshold <Int64>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
