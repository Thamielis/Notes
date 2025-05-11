Get-NcEmsEventNotificationHistory
---------------------------------

### Synopsis
Return EMS messages sent to a destination.

---

### Description

Return EMS messages sent to a destination.

---

### Related Links
* [New-NcEmsEventNotification](New-NcEmsEventNotification)

* [New-NcEmsEventNotificationDestination](New-NcEmsEventNotificationDestination)

* [Get-NcEmsEventNotificationDestination](Get-NcEmsEventNotificationDestination)

---

### Examples
> Example 1

```PowerShell
Get-NcEmsEventNotificationHistory -Destination testDest
Get all notifications sent to testDest
```

---

### Parameters
#### **Destination**
The name of the destination for which notification history is to be returned

|Type      |Required|Position|PipelineInput        |Aliases                 |
|----------|--------|--------|---------------------|------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|DestinationName<br/>Name|

#### **Node**
Specify to filter by Node

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **SeqNum**
Specify to filter by SeqNum

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |3       |true (ByPropertyName)|

#### **Severity**
Specify to filter by Severity

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[EventNotificationHistoryInfo]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[EventNotificationHistoryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EventNotificationHistoryInfo

---

### Notes
Category: ems
API: ems-event-notification-history-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsEventNotificationHistory [-Destination] <String> [[-Node] <String[]>] [[-SeqNum] <Int64>] [[-Severity] <String[]>] [-Attributes <EventNotificationHistoryInfo>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsEventNotificationHistory [-Destination] <String> -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsEventNotificationHistory [-Destination] <String> -Query <EventNotificationHistoryInfo> [-Attributes <EventNotificationHistoryInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
