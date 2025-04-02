New-NcSecurityCertificateCsr
----------------------------

### Synopsis
Generate a digital certificate signing request (CSR).

---

### Description

Generate a digital certificate signing request (CSR).

---

### Examples
> Example 1

New-NcSecurityCertificateCsr -CommonName www.example.com -Size 2048 -HashFunction sha256
Create a new certificate signing request.

Csr                                     PrivateKey
---                                     ----------
-----BEGIN CERTIFICATE REQUEST-----...  -----BEGIN RSA PRIVATE KEY-----...

---

### Parameters
#### **CommonName**
The domain name in FQDN form that specifies its exact location in the tree hierarchy of the Domain Name System (DNS).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Size**
Size of requested certificate in bits. Default value is '2048'.
 
 Possible values:
 '512'      - 512 bits private key,
 '1024'     - 1024 bits private key,
 '1536'     - 1536 bits private key,
 '2048'     - 2048 bits private key

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Country**
Name of the country. Default value is 'US'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **State**
Name of the state. Default value is empty string.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Locality**
Name of the locality.  Default value is empty string.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Organization**
Name of the organization. Default value is empty string.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **OrganizationUnit**
Name of the unit. Example: IT, Finance. Default value is empty string.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **EmailAddress**
Email address of administrator. Default value is empty string.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **HashFunction**
Hashing function used to sign the certificate. Default value is 'sha256'.  Possible values: 'sha1', 'sha256', 'md5'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SubjectAlternatives**
Subject name details of the certificate. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SecurityStrength**
Security strength of the certificate in bits. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **KeyUsages**
A list of key usage extensions. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ExtendedKeyUsages**
A list of extended key usage extensions. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Algorithm**
Asymmetric Encryption Algorithm. This parameter is supported with Rest only.

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
* DataONTAP.C.Types.SecurityCertificate.CertificateSigningRequest

---

### Notes
Category: security certificate
API: security-certificate-generate-csr
Family: cluster,vserver

---

### Syntax
```PowerShell
New-NcSecurityCertificateCsr [-CommonName] <String> [-Size <String>] [-Country <String>] [-State <String>] [-Locality <String>] [-Organization <String>] [-OrganizationUnit <String>] 
```
```PowerShell
[-EmailAddress <String>] [-HashFunction <String>] [-SubjectAlternatives <DataONTAP.C.Types.SecurityCertificate.SubjectAlternatives>] [-SecurityStrength <Int32>] [-KeyUsages <List <String>>] 
```
```PowerShell
[-ExtendedKeyUsages <List <String>>] [-Algorithm <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
