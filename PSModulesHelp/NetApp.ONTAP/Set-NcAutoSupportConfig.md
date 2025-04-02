Set-NcAutoSupportConfig
-----------------------

### Synopsis
Modify AutoSupport configuration settings for the given node.

---

### Description

Modify AutoSupport configuration settings for the given node.

---

### Related Links
* [Get-NcAutoSupportConfig](Get-NcAutoSupportConfig)

---

### Examples
> Example 1

Set-NcAutoSupportConfig fas3070cluster01-01 -RetryCount 20 -RetryInterval 300
Set the AutoSupport configuration for node fas3070cluster01-01 to have a retry count of 20 and retry interval of 300 seconds.

NcController                      : 10.61.172.155
From                              : Postmaster
IsEnabled                         : True
IsLocalCollectionEnabled          : True
IsNhtDataEnabled                  : True
IsNodeInSubject                   : False
IsPerfDataEnabled                 : True
IsPrivateDataRemoved              : False
IsReminderEnabled                 : True
IsSupportEnabled                  : True
IsThrottleEnabled                 : True
LastSubject                       : PERFORMANCE SNAPSHOT
LastTimestamp                     : 1332236929
LastTrigger                       :
MailHosts                         : {mailhost}
MaxHttpSize                       : 10485760
MaxSmtpSize                       : 5242880
NodeName                          : fas3070cluster01-01
Noteto                            :
PartnerAddress                    :
PayloadFormat                     : 7z
PeriodicTxWindow                  : 1h
PostUrl                           : testbed.corp.netapp.com/asupprod/post/1.0/postAsup
ProxyUrl                          :
PutUrl                            : testbed.corp.netapp.com/put/AsupPut
RetryCount                        : 20
RetryInterval                     : 5m
SupportAddress                    : {dl-qa-autosupport@netapp.com}
To                                :
Transport                         : https

---

### Parameters
#### **Node**
The name of the filer that owns the AutoSupport configuration.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **MailHosts**
The name of the mail server(s) used to deliver AutoSupport messages via SMTP.  Both host names and IP addresses may be used as valid input.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **From**
The e-mail address of the local administrator, used as the sender of the AutoSupport message.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **To**
Specifies up to five recipients of full AutoSupport e-mail messages.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **NoteTo**
Specifies up to five recipients of short AutoSupport e-mail messages.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **PartnerAddress**
Specifies up to five partner vendor recipients of full AutoSupport e-mail messages.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Transport**
The name of the transport protocol used to deliver AutoSupport messages. Possible values: "smtp", "http", "https"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PostUrl**
The URL used to deliver AutoSupport messages via HTTP POST.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PutUrl**
The URL used to deliver AutoSupport messages via HTTP PUT.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProxyUrl**
Optional proxy host for AutoSupport message delivery via HTTP.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SupportAddress**
The e-mail address of Support.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **IsNodeInSubject**
Specifies whether the filer's hostname should be part of an AutoSupport message's subject field.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsNhtDataEnabled**
Used to enable / disable collection of NetApp Health Trigger data.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsPerfDataEnabled**
Used to enable / disable collection of Performance AutoSupport data.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **RetryInterval**
The number of seconds to wait, after a failed delivery attempt, prior to re-transmitting an AutoSupport message.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **RetryCount**
The maximum number of delivery attempts for an AutoSupport message.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **IsReminderEnabled**
Specifies whether to enable / disable AutoSupport reminders.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsThrottleEnabled**
Specifies whether to enable / disable throttling to prevent a potential avalanche of AutoSupport messages.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **PayloadFormat**
The format used to compress the AutoSupport message payload. 
Possible values: 
    "7z"   - 7-Zip Archive
    "tgz"  - Zipped Tarball

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PeriodicTxWindow**
The transmission window (seconds).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MaxHttpSize**
Delivery size limit for the HTTP transport protocol.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **MaxSmtpSize**
Delivery size limit for the SMTP transport protocol.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsPrivateDataRemoved**
Used to enable / disable removal of customer-supplied data.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsLocalCollectionEnabled**
Used to enable / disable collection of AutoSupport data when the AutoSupport daemon is disabled.  When this setting is true, collection of AutoSupport data will still be done if is-enabled is false.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsEnabled**
Specifies whether the AutoSupport daemon is enabled.  When this setting is disabled, delivery of all AutoSupport messages is turned off.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsSupportEnabled**
Specifies whether AutoSupport notification to Support is enabled.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsOndemandEnabled**
If true, AutoSupport OnDemand is enabled.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsOndemandRemoteDiagEnabled**
If true, AutoSupport OnDemand Remote Diagnostics feature is enabled.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **OndemandServerUrl**
The AutoSupport OnDemand Server URL.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **OndemandPollingInterval**
The AutoSupport OnDemand Client polling rate in minutes.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **MinimumPrivateDataLength**
Minimum Length for Sensitive Data.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **MaxDownloadRate**
Maximum download rate

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **MaxUploadRate**
Maximum upload rate

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **DisableOndemandDownload**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ValidateDigitalCertificate**
Validate Digital Certificate Received
This Parameter is available in ONTAP 9.3 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Autosupport.AutosupportConfigInfo

---

### Notes
Category: autosupport
API: autosupport-config-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcAutoSupportConfig [-Node] <String> [-MailHosts <String[]>] [-From <String>] [-To <String[]>] [-NoteTo <String[]>] [-PartnerAddress <String[]>] [-Transport <String>] [-PostUrl <String>] 
```
```PowerShell
[-PutUrl <String>] [-ProxyUrl <String>] [-SupportAddress <String[]>] [-IsNodeInSubject <Boolean>] [-IsNhtDataEnabled <Boolean>] [-IsPerfDataEnabled <Boolean>] [-RetryInterval <Int32>] 
```
```PowerShell
[-RetryCount <Int32>] [-IsReminderEnabled <Boolean>] [-IsThrottleEnabled <Boolean>] [-PayloadFormat <String>] [-PeriodicTxWindow <Int32>] [-MaxHttpSize <String>] [-MaxSmtpSize <String>] 
```
```PowerShell
[-IsPrivateDataRemoved <Boolean>] [-IsLocalCollectionEnabled <Boolean>] [-IsEnabled <Boolean>] [-IsSupportEnabled <Boolean>] [-IsOndemandEnabled <Boolean>] [-IsOndemandRemoteDiagEnabled 
```
```PowerShell
<Boolean>] [-OndemandServerUrl <String>] [-OndemandPollingInterval <Int32>] [-MinimumPrivateDataLength <String>] [-MaxDownloadRate <Int64>] [-MaxUploadRate <Int64>] [-DisableOndemandDownload] 
```
```PowerShell
[-ValidateDigitalCertificate <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
