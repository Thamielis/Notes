Remove-NcEmsRouteDestination
----------------------------

### Synopsis
Remote EMS destination(s).

---

### Description

Remote EMS destination(s).

---

### Related Links
* [Add-NcEmsRouteDestination](Add-NcEmsRouteDestination)

---

### Examples
> Example 1

Remove-NcEmsRouteDestination app.log.info asup
Remove the asup destination from the app.log.info EMS message route.

Action                      : (UNKNOWN)
Description                 : This event is issued when an application's message is meant for informational purposes.
Destinations                :
FrequencyThreshold          : 0
MessageName                 : app.log.info
Severity                    : informational
SnmpSupport                 : True
TimeThreshold               : 0
FrequencyThresholdSpecified : True

---

### Parameters
#### **Name**
The name of the EMS message.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |1       |true (ByPropertyName)|MessageName|

#### **Destinations**
EMS destination(s) to remove.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |2       |true (ByPropertyName)|

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
API: ems-routing-remove-destination
Family: cluster

---

### Syntax
```PowerShell
Remove-NcEmsRouteDestination [-Name] <String> [-Destinations] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
