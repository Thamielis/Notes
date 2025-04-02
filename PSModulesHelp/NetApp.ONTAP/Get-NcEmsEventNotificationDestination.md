Get-NcEmsEventNotificationDestination
-------------------------------------

### Synopsis
Returns information about one or more event notification destinations

---

### Description

Returns information about one or more event notification destinations

---

### Related Links
* [Remove-NcEmsEventNotificationDestination](Remove-NcEmsEventNotificationDestination)

* [New-NcEmsEventNotificationDestination](New-NcEmsEventNotificationDestination)

* [New-NcEmsEventNotification](New-NcEmsEventNotification)

* [Update-NcEmsEventNotificationDest](Update-NcEmsEventNotificationDest)

---

### Examples
> Example 1

```PowerShell
Get-NcEmsEventNotificationDestination
Get all event notification destinations defined on this cluster

CertificateAuthority      :
CertificateSerial         :
CertificateValid          :
Destination               :
Name                      : snmp-traphost
NcController              : 10.63.1.234
Type                      : snmp
CertificateValidSpecified : False

CertificateAuthority      :
CertificateSerial         :
CertificateValid          :
Destination               : {aparajir@eng.netapp.com}
Name                      : testDest
NcController              : 10.63.1.234
Type                      : email
CertificateValidSpecified : False

```

---

### Parameters
#### **Name**
Specify to filter by Name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Destination**
Specify to filter by Destination

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Type**
Specify to filter by Type

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[EventNotificationDestinationInfo]`|false   |named   |false        |

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

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[EventNotificationDestinationInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EventNotificationDestinationInfo

---

### Notes
Category: ems
API: ems-event-notification-destination-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsEventNotificationDestination [[-Name] <String[]>] [[-Destination] <String[]>] [[-Type] <String[]>] [-Attributes <EventNotificationDestinationInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsEventNotificationDestination -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsEventNotificationDestination -Query <EventNotificationDestinationInfo> [-Attributes <EventNotificationDestinationInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
