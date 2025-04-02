Set-NcSecurityConfig
--------------------

### Synopsis
Modify Cluster Security Configuration

---

### Description

Modify Cluster Security Configuration

---

### Examples
> Example 1

Set-NcSecurityConfig -Interface ssl -IsFipsEnabled $false -SupportedCiphers ALL
Modifying security configuration for ssl interface

ClusterSecurityConfigReady          : False
Interface                           : ssl
IsFipsEnabled                       : False
NcController                        : 10.238.73.251
SupportedCiphers                    : ALL
SupportedProtocols                  : {tlsv1_2, tlsv1_1, tlsv1}
ClusterSecurityConfigReadySpecified : True
IsFipsEnabledSpecified              : True

---

### Parameters
#### **Interface**
Type Of Interface. Possible values: ssl

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **IsFipsEnabled**
Data ONTAP FIPS Mode.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **SupportedCiphers**
Data ONTAP Supported Ciphers. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SupportedProtocols**
Data ONTAP Supported Protocols.
Possible values: "tlsv1_2", "tlsv1_1", "tlsv1" ,"sslv3"

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SupportedCiphersSuites**
Data ONTAP Supported Ciphers Suites. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SoftwareDataEncryption**
Cluster-wide software data encryption related information. To create object use New-Object DataONTAP.C.Types.Security.SoftwareDataEncryption. This parameter is supported with Rest only.

|Type                                                 |Required|Position|PipelineInput        |
|-----------------------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Security.SoftwareDataEncryption]`|false   |named   |true (ByPropertyName)|

#### **OnboardKeyManagerConfigurableStatus**
Indicates whether the Onboard Key Manager can be configured in the cluster. To create object use New-Object DataONTAP.C.Types.Security.OnboardKeyManagerConfigurableStatus. This parameter is supported with Rest only.

|Type                                                              |Required|Position|PipelineInput        |
|------------------------------------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Security.OnboardKeyManagerConfigurableStatus]`|false   |named   |true (ByPropertyName)|

#### **ManagementProtocols**
Cluster-wide security protocols related information. To create object use New-Object DataONTAP.C.Types.Security.ManagementProtocols. This parameter is supported with Rest only.

|Type                                              |Required|Position|PipelineInput        |
|--------------------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Security.ManagementProtocols]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Security.SecurityConfigInfo

---

### Notes
Category: security
API: security-config-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcSecurityConfig [-Interface] <String> [-IsFipsEnabled <Boolean>] [-SupportedCiphers <String>] [-SupportedProtocols <String[]>] [-SupportedCiphersSuites <String[]>] 
```
```PowerShell
[-SoftwareDataEncryption <DataONTAP.C.Types.Security.SoftwareDataEncryption>] [-OnboardKeyManagerConfigurableStatus <DataONTAP.C.Types.Security.OnboardKeyManagerConfigurableStatus>] 
```
```PowerShell
[-ManagementProtocols <DataONTAP.C.Types.Security.ManagementProtocols>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
