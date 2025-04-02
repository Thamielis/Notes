New-NcEmsEventNotificationDestination
-------------------------------------

### Synopsis
Create an event notification destination

---

### Description

Creates an event notification destination

---

### Related Links
* [Remove-NcEmsEventNotificationDestination](Remove-NcEmsEventNotificationDestination)

* [Get-NcEmsEventNotificationDestination](Get-NcEmsEventNotificationDestination)

* [Update-NcEmsEventNotificationDest](Update-NcEmsEventNotificationDest)

---

### Examples
> Example 1

```PowerShell
New-NcEmsEventNotificationDestination -Name testDest -Email aparajir@eng.netapp.com
Create a new email destination

CertificateAuthority :
CertificateSerial    :
Email                :
Name                 : testDest
NcController         : 10.63.1.234
RestApiUrl           :
Syslog               :

```

---

### Parameters
#### **Name**
Destination Name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **CertificateAuthority**
Use this field and CertificateSerial to specify the client specify the client certificate to use when being authenticated by the REST API server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CertificateSerial**
Use this field and CertificateAuthority to specify the client certificate to use when being authenticated by the REST API server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Email**
Use this field to specify an email address to which event notifications will be sent.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

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

#### **RestApiUrl**
Use this field to specify REST API server URL to which event to which event notifications will be sent

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Syslog**
Use this field to specify a syslog destination.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EventNotificationDestination

---

### Notes
Category: ems
API: ems-event-notification-destination-create
Family: cluster

---

### Syntax
```PowerShell
New-NcEmsEventNotificationDestination [-Name] <String> [-CertificateAuthority <String>] [-CertificateSerial <String>] -Email <String> [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcEmsEventNotificationDestination [-Name] <String> [-CertificateAuthority <String>] [-CertificateSerial <String>] -RestApiUrl <String> [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcEmsEventNotificationDestination [-Name] <String> [-CertificateAuthority <String>] [-CertificateSerial <String>] -Syslog <String> [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
