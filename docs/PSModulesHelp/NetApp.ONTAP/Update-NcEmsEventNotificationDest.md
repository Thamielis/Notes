Update-NcEmsEventNotificationDest
---------------------------------

### Synopsis
Modify one or more event notification destinations

---

### Description

Modify one or more event notification destinations

---

### Related Links
* [New-NcEmsEventNotificationDestination](New-NcEmsEventNotificationDestination)

* [Get-NcEmsEventNotificationDestination](Get-NcEmsEventNotificationDestination)

* [Remove-NcEmsEventNotificationDestination](Remove-NcEmsEventNotificationDestination)

---

### Examples
> Example 1

$attr = Update-NcEmsEventNotificationDest -Template
PS C:\Users\aparajir\Perforce\aparajir_BTC_pstk_1\main> $attr.Email = "aparajir@netapp.com"
PS C:\Users\aparajir\Perforce\aparajir_BTC_pstk_1\main> Update-NcEmsEventNotificationDest -Name testDest -Attributes $attr
Change the email address of testDest

Name                 Destination                              ErrorCode  ErrorMessage
----                 -----------                              ---------  ------------
testDest             aparajir@netapp.com

---

### Parameters
#### **Name**
Specify to filter by Name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

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

|Type                            |Required|Position|PipelineInput        |
|--------------------------------|--------|--------|---------------------|
|`[EventNotificationDestination]`|true    |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Ems.EmsEventNotificationDestinationModifyIterInfo

---

### Notes
Category: ems
API: ems-event-notification-destination-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcEmsEventNotificationDest [-Name] <String[]> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] -Attributes <EventNotificationDestination> 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcEmsEventNotificationDest [-Query] <EventNotificationDestination> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] -Attributes 
```
```PowerShell
<EventNotificationDestination> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcEmsEventNotificationDest [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
