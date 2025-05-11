Set-NcFpolicyExternalEngine
---------------------------

### Synopsis
Modify an FPolicy external engine.

---

### Description

Modify an FPolicy external engine.

---

### Related Links
* [Get-NcFpolicyExternalEngine](Get-NcFpolicyExternalEngine)

* [Remove-NcFpolicyExternalEngine](Remove-NcFpolicyExternalEngine)

* [New-NcFpolicyExternalEngine](New-NcFpolicyExternalEngine)

---

### Examples
> Example 1

```PowerShell
Set-NcFpolicyExternalEngine -Name test_engine -SecondaryServer "10.61.169.75"
Add a secondary server to the given FPolicy policy external engine.

CertificateCa                  :
CertificateCommonName          :
CertificateSerial              :
EngineName                     : test_engine
ExternEngineType               : synchronous
KeepAliveInterval              : 120
KeepAliveIntervalTS            : 00:02:00
MaxConnectionRetries           : 5
MaxServerRequests              : 50
NcController                   : 10.63.165.62
PortNumber                     : 2357
PrimaryServers                 : {10.61.169.73}
RequestAbortTimeout            : 40
RequestAbortTimeoutTS          : 00:00:40
RequestCancelTimeout           : 20
RequestCancelTimeoutTS         : 00:00:20
SecondaryServers               : {10.61.169.75}
ServerProgressTimeout          : 60
ServerProgressTimeoutTS        : 00:01:00
SslOption                      : no_auth
StatusRequestInterval          : 10
StatusRequestItervalTS         : 00:00:10
Vserver                        : beam01

```

---

### Parameters
#### **Name**
Name of the external engine.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|EngineName|

#### **PrimaryServer**
Primary FPolicy servers.

|Type        |Required|Position|PipelineInput        |Aliases       |
|------------|--------|--------|---------------------|--------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|PrimaryServers|

#### **Port**
Port number of the FPolicy server application.

|Type     |Required|Position|PipelineInput        |Aliases   |
|---------|--------|--------|---------------------|----------|
|`[Int32]`|false   |3       |true (ByPropertyName)|PortNumber|

#### **SecondaryServer**
Secondary FPolicy servers.

|Type        |Required|Position|PipelineInput        |Aliases         |
|------------|--------|--------|---------------------|----------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|SecondaryServers|

#### **Asynchronous**
If specified, the external engine type is asynchronous.  If the engine is asynchronous, no reply is sent from FPolicy servers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Synchronous**
If specified, the external engine type is synchronous.  If the engine is synchronous, reply is sent from FPolicy servers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SslOption**
SSL option for external communication.
Possible values: 
"no_auth"        - Communication over TCP
"server_auth"    - Authentication of FPolicy server only
"mutual_auth"    - Mutual authentication of storage system and FPolicy server

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **RequestCancelTimeout**
Timeout in seconds for a screen request to be processed by an FPolicy server. Default value set for this field is 20 seconds.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **RequestAbortTimeout**
Timeout in seconds for a screen request to be aborted by storage appliance. Default value set for this field is 40 seconds.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **StatusRequestInterval**
Interval time in seconds for storage appliance to query status request from FPolicy server. Default value set for this field is 10 seconds.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **MaxConnectionRetries**
Number of times storage appliance will attempt to establish a broken connection to FPolicy server. Default value set for this field is 5.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **MaxServerRequests**
Maximum number of outstanding screen requests that will be queued for an FPolicy Server. Default value set for this field is 50.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **ServerProgressTimeout**
Timeout in seconds in which a throttled FPolicy server must complete at least one screen request. If no request is processed within the timeout, connection to FPolicy server is terminated. Default value set for this field is 60 seconds.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **KeepAliveInterval**
Interval time in seconds for storage appliance to send keep-alive message to FPolicy server. Default value set for this field is 10 seconds.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **CertificateCommonName**
FQDN or custom common name of certificate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CertificateSerial**
Serial number of certificate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CertificateCa**
Certificate authority name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **RecvBufferSize**
Receive buffer size of connected socket for FPolicy Server. Default is 256KB.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |named   |true (ByPropertyName)|ReceiveBufferSize|

#### **SendBufferSize**
Send buffer size of connected socket for FPolicy Server. Default is 256KB.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SessionTimeout**
Session Id purge timeout during FPolicy server reconnection. Default is 10 Seconds.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **EnableResiliency**
Specify to enable resiliency.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **ResiliencyMaxRetentionDuration**
Maximum retention duration for which the notifications will be stored. Default is 180 seconds and maximum retention duration can be 600 seconds.
This parameter is available in ONTAP 8.4 and later.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **ResiliencyDirectoryPath**
Directory path under Vserver for storing file access notifications. Example: '/path1' where '/' is the root of the Vserver and 'path1' is the directory where to store notifications.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyEventOptionsConfig

---

### Notes
Category: fpolicy
API: fpolicy-policy-external-engine-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcFpolicyExternalEngine [-Name] <String> [[-PrimaryServer] <String[]>] [[-Port] <Int32>] [-SecondaryServer <String[]>] [-Asynchronous] [-Synchronous] [-SslOption <String>] 
```
```PowerShell
[-RequestCancelTimeout <Int64>] [-RequestAbortTimeout <Int64>] [-StatusRequestInterval <Int64>] [-MaxConnectionRetries <Int64>] [-MaxServerRequests <Int64>] [-ServerProgressTimeout <Int64>] 
```
```PowerShell
[-KeepAliveInterval <Int64>] [-CertificateCommonName <String>] [-CertificateSerial <String>] [-CertificateCa <String>] [-RecvBufferSize <String>] [-SendBufferSize <String>] [-SessionTimeout 
```
```PowerShell
<Int64>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcFpolicyExternalEngine [-Name] <String> [[-PrimaryServer] <String[]>] [[-Port] <Int32>] [-SecondaryServer <String[]>] [-Asynchronous] [-Synchronous] [-SslOption <String>] 
```
```PowerShell
[-RequestCancelTimeout <Int64>] [-RequestAbortTimeout <Int64>] [-StatusRequestInterval <Int64>] [-MaxConnectionRetries <Int64>] [-MaxServerRequests <Int64>] [-ServerProgressTimeout <Int64>] 
```
```PowerShell
[-KeepAliveInterval <Int64>] [-CertificateCommonName <String>] [-CertificateSerial <String>] [-CertificateCa <String>] [-RecvBufferSize <String>] [-SendBufferSize <String>] [-SessionTimeout 
```
```PowerShell
<Int64>] -EnableResiliency [-ResiliencyMaxRetentionDuration <Int64>] -ResiliencyDirectoryPath <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
