Remove-NcEmsEventNotificationDestination
----------------------------------------

### Synopsis
Delete one or more existing event destinations

---

### Description

Delete one or more existing event destinations

---

### Related Links
* [Get-NcEmsEventNotificationDestination](Get-NcEmsEventNotificationDestination)

* [New-NcEmsEventNotificationDestination](New-NcEmsEventNotificationDestination)

* [Update-NcEmsEventNotificationDest](Update-NcEmsEventNotificationDest)

---

### Examples
> Example 1

```PowerShell
Remove-NcEmsEventNotificationDestination testDest
Remove the notification destination named testDest

EmsEventNotificationDestinationKey : {testDest}
ErrorCode                          :
ErrorMessage                       :
NcController                       : 10.63.1.234
ErrorCodeSpecified                 : False

```

---

### Parameters
#### **Name**
Name of the destination to be removed

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

#### **ForceDeleteNotification**
Specify to force deletion of event notifications which have the specified destination as the only destination

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**
Specify to continue modifications on other nodes in case operations fail on one (or more) nodes

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
If operation is allowed to continue on failure on one (or more) nodes, this can be specified to stop the operation after n number of failures

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

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

#### **Query**
Specify to query using a object with restricting fields set.

|Type                            |Required|Position|PipelineInput        |
|--------------------------------|--------|--------|---------------------|
|`[EventNotificationDestination]`|true    |1       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsEventNotificationDestinationDestroyIterInfo

---

### Notes
Category: ems
API: ems-event-notification-destination-destroy-iter
Family: cluster

---

### Syntax
```PowerShell
Remove-NcEmsEventNotificationDestination [-Name] <String[]> [-ForceDeleteNotification] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcEmsEventNotificationDestination [-Query] <EventNotificationDestination> [-ForceDeleteNotification] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcEmsEventNotificationDestination [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
