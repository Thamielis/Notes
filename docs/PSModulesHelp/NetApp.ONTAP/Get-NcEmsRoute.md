Get-NcEmsRoute
--------------

### Synopsis
Get information on EMS routes.

---

### Description

Get information on EMS routes.

---

### Related Links
* [Add-NcEmsRouteDestination](Add-NcEmsRouteDestination)

* [Remove-NcEmsRouteDestination](Remove-NcEmsRouteDestination)

* [Set-NcEmsRoute](Set-NcEmsRoute)

---

### Examples
> Example 1

```PowerShell
Get-NcEmsRoute -Name app.log.* -Severity warning
Get all of the EMS route information for the requested messages.

Action                      : (UNKNOWN)
Description                 : This event is issued when an application is in a condition which is not an error, but whi
                              ch may require special handling.
Destinations                :
FrequencyThreshold          : 0
MessageName                 : app.log.warn
Severity                    : warning
SnmpSupport                 : True
TimeThreshold               : 0
FrequencyThresholdSpecified : True
SnmpSupportSpecified        : True
TimeThresholdSpecified      : True

```
> Example 2

```PowerShell
$q = Get-NcEmsRoute -Template
$q.SnmpSupport = $true
Get-NcEmsRoute -Query $q
Get all of the EMS message routes for messages that have SNMP support.

NcController                : 10.61.172.155
Action                      : (UNKNOWN)
Description                 : This event is issued when an application is in a condition that should be corrected immed
                              iately.
Destinations                :
FrequencyThreshold          : 0
MessageName                 : app.log.alert
Severity                    : alert
SnmpSupport                 : True
TimeThreshold               : 0
FrequencyThresholdSpecified : True
SnmpSupportSpecified        : True
TimeThresholdSpecified      : True

NcController                : 10.61.172.155
Action                      : (UNKNOWN)
Description                 : This event is issued when an application encounters a critical condition.
Destinations                :
FrequencyThreshold          : 0
MessageName                 : app.log.crit
Severity                    : critical
SnmpSupport                 : True
TimeThreshold               : 0
FrequencyThresholdSpecified : True
SnmpSupportSpecified        : True
TimeThresholdSpecified      : True

NcController                : 10.61.172.155
Action                      : (UNKNOWN)
Description                 : This event is issued when an application is required to be debugged.
Destinations                :
FrequencyThreshold          : 0
MessageName                 : app.log.debug
Severity                    : debug
SnmpSupport                 : True
TimeThreshold               : 0
FrequencyThresholdSpecified : True
SnmpSupportSpecified        : True
TimeThresholdSpecified      : True

```

---

### Parameters
#### **Name**
The name of the EMS message.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|MessageName|

#### **Severity**
The event severity.  Data ONTAP wildcards are permitted.  Possible values:
    "emergency"      - System is unusable
    "alert"          - Action must be taken immediately
    "critical"       - Critical condition
    "error"          - Error condition
    "warning"        - Warning condition
    "notice"         - Normal but significant condition
    "informational"  - Information message
    "debug"          - A debugging message

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an EmsRoutingInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcEmsRoute -Template" to get the initially empty EmsRoutingInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[EmsRoutingInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty EmsRoutingInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a EmsRoutingInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcEmsRoute -Template" to get the initially empty EmsRoutingInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[EmsRoutingInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsRoutingInfo

---

### Notes
Category: ems
API: ems-routing-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsRoute [[-Name] <String[]>] [[-Severity] <String[]>] [-Attributes <EmsRoutingInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsRoute -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcEmsRoute -Query <EmsRoutingInfo> [-Attributes <EmsRoutingInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
