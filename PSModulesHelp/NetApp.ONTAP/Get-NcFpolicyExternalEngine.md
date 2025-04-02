Get-NcFpolicyExternalEngine
---------------------------

### Synopsis
Get information on external engines.

---

### Description

Get information on external engines.

---

### Related Links
* [New-NcFpolicyExternalEngine](New-NcFpolicyExternalEngine)

* [Set-NcFpolicyExternalEngine](Set-NcFpolicyExternalEngine)

* [Remove-NcFpolicyExternalEngine](Remove-NcFpolicyExternalEngine)

---

### Examples
> Example 1

```PowerShell
Get-NcFpolicyExternalEngine -Name test_engine
Get the given FPolicy policy external engine.

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
SecondaryServers               :
ServerProgressTimeout          : 60
ServerProgressTimeoutTS        : 00:01:00
SslOption                      : no_auth
StatusRequestInterval          : 10
StatusRequestItervalTS         : 00:00:10
Vserver                        : beam01

```
> Example 2

```PowerShell
$q = Get-NcFpolicyExternalEngine -Template
$q.ExternEngineType = "synchronous"
Get-NcFpolicyExternalEngine -Query $q
Get all of the synchronous FPolicy policy external engines.

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
SecondaryServers               :
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
"One or more Fpolicy external engines to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|EngineName|

#### **Vserver**
Restrict the results to one or more vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FpolicyExternalEngineInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFpolicyExternalEngine -Template" to get the initially empty FpolicyExternalEngineInfo object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[FpolicyExternalEngineInfo]`|false   |named   |false        |

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty FpolicyExternalEngineInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FpolicyExternalEngineInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFpolicyExternalEngine -Template" to get the initially empty FpolicyExternalEngineInfo object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[FpolicyExternalEngineInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Fpolicy.FpolicyExternalEngineInfo

---

### Notes
Category: fpolicy
API: fpolicy-policy-external-engine-get-iter
Family: vserver,cluster

---

### Syntax
```PowerShell
Get-NcFpolicyExternalEngine [[-Name] <String[]>] [[-Vserver] <String[]>] [-Attributes <FpolicyExternalEngineInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyExternalEngine -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFpolicyExternalEngine -Query <FpolicyExternalEngineInfo> [-Attributes <FpolicyExternalEngineInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
