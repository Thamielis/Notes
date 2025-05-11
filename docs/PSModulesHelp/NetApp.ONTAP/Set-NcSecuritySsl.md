Set-NcSecuritySsl
-----------------

### Synopsis
Modify SSL authentication for a Vserver.

---

### Description

Modify SSL authentication for a Vserver.

---

### Related Links
* [Get-NcSecuritySsl](Get-NcSecuritySsl)

---

### Examples
> Example 1

```PowerShell
Set-NcSecuritySsl -Vserver beam01 -CertificateAuthority test.cert -CertificateSerialNumber 51C061AE
Change the beam01 SSL security certificate authority.

CertificateAuthority                 : test.cert
CertificateSerialNumber              : 51C061AE
ClientAuthenticationEnabled          : False
CommonName                           : test.cert
NcController                         : 10.63.165.62
ServerAuthenticationEnabled          : True
Vserver                              : beam01
ClientAuthenticationEnabledSpecified : True
ServerAuthenticationEnabledSpecified : True

```

---

### Parameters
#### **Vserver**
Name of vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **CertificateAuthority**
Issuing Certificate Authority (CA) of server certificate.  Mandatory if EnableServerAuthentication is true. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CertificateSerialNumber**
Serial number of certificate in hexadecimal format.  Required if EnableServerAuthentication is true.  If not specified, the serial number of the default certificate is used. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CommonName**
Domain name in FQDN form that specifies its exact location in the tree hierarchy of the Domain Name System (DNS). This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **EnableServerAuthentication**
If true, SSL Server Authentication is enabled. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **EnableClientAuthentication**
If true, SSL Client Authentication is enabled.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **OcspEnabled**
This parameter enables OCSP validation of the client certificate chain. If this parameter is enabled, certificates in the client's certificate chain will be validated against an OCSP responder after normal verification (including CRL checks) have taken place. The OCSP responder used is either extracted from the certificate itself, or derived by configuration.
This parameter is available in ONTAP 8.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **OcspDefaultResponder**
This parameter sets the default OCSP responder to use. If the OcspOverrideResponder parameter is not enabled, the URI given will be used only if no responder URI is specified in the certificate being verified.
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **OcspOverrideResponder**
This parameter forces the configured default OCSP responder to be used during OCSP certificate validation, regardless of whether the certificate being validated references an OCSP responder.
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **OcspResponderTimeout**
This parameter sets the timeout for queries to OCSP responders. Specify zero for the minimum possible timeout. The default value is 10 seconds.
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **OcspMaxResponseAge**
This parameter sets the maximum allowable age (freshness), in seconds, for OCSP responses.  The default value (unlimited) does not enforce a maximum age, which means that OCSP responses are considered valid as long as their expiration date field is in the future.
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **OcspMaxResponseTimeSkew**
This parameter sets the maximum allowable time difference for OCSP responses (when validating their this Update and Next Update fields).
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **OcspUseRequestNonce**
This parameter determines whether queries to OCSP responders should contain a NONCE or not.  By default, a query NONCE is always used and checked against the response's one.  When the responder does not use NONCEs (e.g. Microsoft OCSP Responder), this parameter should be disabled.  Note: A NONCE is a unique    identifier included in each OCSP request / response to prevent a replay attack.
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecuritySsl.VserverSslInfo

---

### Notes
Category: security ssl
API: security-ssl-modify
Family: cluster,vserver

---

### Syntax
```PowerShell
Set-NcSecuritySsl [[-Vserver] <String>] [-CertificateAuthority <String>] [-CertificateSerialNumber <String>] [-CommonName <String>] [-EnableServerAuthentication <Boolean>] 
```
```PowerShell
[-EnableClientAuthentication <Boolean>] [-OcspEnabled <Boolean>] [-OcspDefaultResponder <String>] [-OcspOverrideResponder <Boolean>] [-OcspResponderTimeout <Int64>] [-OcspMaxResponseAge 
```
```PowerShell
<String>] [-OcspMaxResponseTimeSkew <Int64>] [-OcspUseRequestNonce <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
