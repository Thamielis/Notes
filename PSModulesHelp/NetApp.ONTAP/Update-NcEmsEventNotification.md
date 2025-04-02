Update-NcEmsEventNotification
-----------------------------

### Synopsis
Modify one or more event notifications

---

### Description

Modify one or more event notifications

---

### Related Links
* [New-NcEmsEventNotification](New-NcEmsEventNotification)

* [Get-NcEmsEventNotification](Get-NcEmsEventNotification)

* [Remove-NcEmsEventNotification](Remove-NcEmsEventNotification)

---

### Examples
> Example 1

Update-NcEmsEventNotification -Id 2 -FilterName testFilter2
Update the filter used on notification with (non-persistent) ID 2

Id FilterName           Destinations                   ErrorCode  ErrorMessage
        -- ----------           ------------                   ---------  ------------
         2 testFilter2          testDest

---

### Parameters
#### **Id**
Specify to filter by Id

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |1       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**
Specify to continue attempting the operation on other instances, even if it fails on one or more instances

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
If operation is allowed to continue on failure, this can be specified to stop the operation after n number of failures

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                 |Required|Position|PipelineInput        |
|---------------------|--------|--------|---------------------|
|`[EventNotification]`|true    |named   |true (ByPropertyName)|

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

#### **FilterName**
Specify the value of filter name to be set

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Destinations**
Specify the value of new destinations. This will be set as the new destination(s)

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Query**
Specify to query using a object with restricting fields set.

|Type                 |Required|Position|PipelineInput        |
|---------------------|--------|--------|---------------------|
|`[EventNotification]`|true    |1       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsEventNotificationModifyIterInfo

---

### Notes
Category: ems
API: ems-event-notification-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcEmsEventNotification [-Id] <Int64> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] -Attributes <EventNotification> [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcEmsEventNotification [-Id] <Int64> [[-FilterName] <String>] [[-Destinations] <String[]>] [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcEmsEventNotification [-Query] <EventNotification> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcEmsEventNotification [-Query] <EventNotification> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] -Attributes <EventNotification> [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcEmsEventNotification [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
