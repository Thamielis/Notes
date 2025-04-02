Get-NcSecuritySsl
-----------------

### Synopsis
Get the attributes of SSL security.

---

### Description

Get the attributes of SSL security.

---

### Related Links
* [Set-NcSecuritySsl](Set-NcSecuritySsl)

---

### Examples
> Example 1

```PowerShell
Get-NcSecuritySsl -Vserver beam01
Get the SSL security attributes.

CertificateAuthority                 : beam01.cert
CertificateSerialNumber              : 511AAD82
ClientAuthenticationEnabled          : False
CommonName                           : beam01.cert
NcController                         : 10.63.165.62
ServerAuthenticationEnabled          : True
Vserver                              : beam01
ClientAuthenticationEnabledSpecified : True
ServerAuthenticationEnabledSpecified : True

```
> Example 2

```PowerShell
$q = Get-NcSecuritySsl -Template
$q.ServerAuthenticationEnabled = $true
Get-NcSecuritySsl -Query $q
Get all of the SSL security configurations with server authentication enabled.

CertificateAuthority                 : beam01.cert
CertificateSerialNumber              : 511AAD82
ClientAuthenticationEnabled          : False
CommonName                           : beam01.cert
NcController                         : 10.63.165.62
ServerAuthenticationEnabled          : True
Vserver                              : beam01
ClientAuthenticationEnabledSpecified : True
ServerAuthenticationEnabledSpecified : True

CertificateAuthority                 : beam02.cert
CertificateSerialNumber              : 512FBB85
ClientAuthenticationEnabled          : False
CommonName                           : beam02.cert
NcController                         : 10.63.165.62
ServerAuthenticationEnabled          : True
Vserver                              : beam02
ClientAuthenticationEnabledSpecified : True
ServerAuthenticationEnabledSpecified : True

```

---

### Parameters
#### **CommonName**
One or more domain names in FQDN form.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a VserverSslInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecuritySsl -Template" to get the initially empty VserverSslInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VserverSslInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Scope**
Restrict results to the specified SVM or Cluster Level. This is Rest Only  Param. This parameter is supported with Rest only.

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

#### **Template**
Specify to get an empty VserverSslInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a VserverSslInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecuritySsl -Template" to get the initially empty VserverSslInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VserverSslInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySsl.VserverSslInfo

---

### Notes
Category: security ssl
API: security-ssl-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSecuritySsl [-CommonName <String[]>] [-Vserver <String[]>] [-Attributes <VserverSslInfo>] [-VserverContext <String>] [-Scope <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySsl -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecuritySsl -Query <VserverSslInfo> [-Attributes <VserverSslInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
