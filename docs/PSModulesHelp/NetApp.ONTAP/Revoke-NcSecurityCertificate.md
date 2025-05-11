Revoke-NcSecurityCertificate
----------------------------

### Synopsis
Revoke a digital certificate.

---

### Description

Revoke a digital certificate.

---

### Related Links
* [Get-NcSecurityCertificateIssued](Get-NcSecurityCertificateIssued)

---

### Examples
> Example 1

```PowerShell
Revoke-NcSecurityCertificate -SerialNumber 51BF2C39 -CertificateAuthority test.cert -CaSerialNumber 51BF2BAC -CommonName www.example.com
Revoke the security certificate.

CaSerialNumber          : 51BF2BAC
CertificateAuthority    : test.cert
CommonName              : www.example.com
Country                 : US
EmailAddr               :
ExpirationDate          : 1374593593
ExpirationDateDT        : 7/23/2013 11:33:13 AM
Locality                :
NcController            : 10.63.165.62
Organization            :
OrganizationUnit        :
RevocationDate          : 1371488138
RevocationDateDT        : 6/17/2013 12:55:38 PM
SerialNumber            : 51BF2C39
State                   :
Status                  : revoked
Vserver                 : sfp-cmode-02
ExpirationDateSpecified : True
RevocationDateSpecified : True

```

---

### Parameters
#### **SerialNumber**
Serial number of certificate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **CertificateAuthority**
Certificate authority.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **CaSerialNumber**
Serial number of CA certificate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **CommonName**
The domain name in FQDN form that specifies its exact location in the tree hierarchy of the Domain Name System (DNS).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
Name of vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.SecurityCertificate.CertificateCaIssuedInfo

---

### Notes
Category: security certificate
API: security-certificate-revoke
Family: cluster,vserver

---

### Syntax
```PowerShell
Revoke-NcSecurityCertificate [-SerialNumber] <String> [-CertificateAuthority] <String> [-CaSerialNumber] <String> [-CommonName <String>] [-Vserver <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
