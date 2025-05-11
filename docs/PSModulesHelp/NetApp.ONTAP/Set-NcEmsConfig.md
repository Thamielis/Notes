Set-NcEmsConfig
---------------

### Synopsis
Set the EMS Configuration.

---

### Description

Set the EMS Configuration.

---

### Related Links
* [Get-NcEmsConfig](Get-NcEmsConfig)

---

### Examples
> Example 1

```PowerShell
Set-NcEmsConfig -MailFrom admin@localhost
Set the mail from address to admin@localhost for the local cluster EMS configuration.

Console                      : True
ConsoleLogLevel              : node_fault
MailFrom                     : admin@localhost
MailServer                   : localhost
MaxLogShowSize               : 2048
MaxTargetEventBytes          : 262144
MaxTargetLogSize             : 5242880
Suppression                  : True
TraceLogSize                 : 2048

```

---

### Parameters
#### **MailFrom**
The from address of ems mail.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **MailServer**
The mail server to use when sending mail.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Suppression**
If true, suppression will be used. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |3       |true (ByPropertyName)|

#### **Console**
If true, logging will be used. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |4       |true (ByPropertyName)|

#### **MaxLogShowSize**
Maximum number of events to show. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |5       |true (ByPropertyName)|

#### **TraceLogSize**
Maximum number of traces kept. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |6       |true (ByPropertyName)|

#### **ConsoleLogLevel**
Console logging level. Possible values:
    "node_fault"     - A data corruption has been detected or the node is unable to provide client service
    "svc_fault"      - A temporary loss of service has been detected, typically a transient software fault
    "node_error"     - A hardware error has been detected which is not immediately fatal
    "svc_error"      - A software error has been detected which is not immediately fatal
    "warning"        - A high-priority message, does not indicate a fault
    "notice"         - A normal-priority message, does not indicate a fault
    "info"           - A low-priority message, does not indicate a fault
    "debug"          - A debugging message, typically suppressed from customer
    "var"            - Message has variable severity, selected at runtime
			This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |7       |true (ByPropertyName)|

#### **MaxTargetLogSize**
The target upper limit of the event log file size in bytes. Used by autosuppression to control growth of log file size. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|

#### **MaxTargetEventSize**
Maximum bytes per event per week. Used by autosuppression to control growth of log file size. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|false   |9       |true (ByPropertyName)|MaxTargetEventBytes|

#### **MaxFilterCount**
Maximum number of event filters in system. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **MaxFilterRuleCount**
Maximum number of event filter rules in system. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **MaxNotificationCount**
Maximum number of event notifications in system. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **MaxDestinationCount**
Maximum number of event notification destinations in system. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **AutoSuppressExemptFilter**
Name of event filter exempt from auto-suppression. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DuplicateSuppressionDuration**
Duration for suppression of identical messages. Input as <value><units>, valid units being s|m|h. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **LogRotationSize**
Log file size needed to trigger rotation. Input as <value><units>, valid units being b|k|m|g|t. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProxyUrl**
HTTP/HTTPS proxy URL to use when sending to REST API .

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProxyUser**
User name to use for the HTTP/HTTPS proxy when sending to REST API

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **RestDeliveryTimeout**
REST API URL delivery timeout. Input as <value><units>, valid units being s|m|h. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ProxyPassword**
ProxyPassword set use when sending to REST API. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* DataONTAP.C.Types.Ems.EmsConfigInfo

---

### Notes
Category: ems
API: ems-config-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcEmsConfig [[-MailFrom] <String>] [[-MailServer] <String>] [[-Suppression] <Boolean>] [[-Console] <Boolean>] [[-MaxLogShowSize] <Int32>] [[-TraceLogSize] <Int32>] [[-ConsoleLogLevel] 
```
```PowerShell
<String>] [[-MaxTargetLogSize] <String>] [[-MaxTargetEventSize] <String>] [-MaxFilterCount <Int64>] [-MaxFilterRuleCount <Int64>] [-MaxNotificationCount <Int64>] [-MaxDestinationCount 
```
```PowerShell
<Int64>] [-AutoSuppressExemptFilter <String>] [-DuplicateSuppressionDuration <String>] [-LogRotationSize <String>] [-ProxyUrl <String>] [-ProxyUser <String>] [-RestDeliveryTimeout <String>] 
```
```PowerShell
[-ProxyPassword <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
