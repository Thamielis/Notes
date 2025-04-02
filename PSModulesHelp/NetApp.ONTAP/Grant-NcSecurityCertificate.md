Grant-NcSecurityCertificate
---------------------------

### Synopsis
Sign a certificate using self-signed root CA.

---

### Description

Sign a certificate using self-signed root CA.

---

### Related Links
* [Revoke-NcSecurityCertificate](Revoke-NcSecurityCertificate)

---

### Examples
> Example 1

$csr = New-NcSecurityCertificateCsr -CommonName www.example.com -Size 2048 -HashFunction sha256
Grant-NcSecurityCertificate -CertificateAuthority test.cert -CaSerialNumber 51BF2BAC -Csr $csr.Csr -PrivateKey $csr.PrivateKey -ExpireDays 36
Sign the digital certificate.

SignedCert
----------
-----BEGIN CERTIFICATE-----...

---

### Parameters
#### **CertificateAuthority**
Certificate authority to sign.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **CaSerialNumber**
Serial number of CA certificate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Csr**
Certificate signing request.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Vserver**
Name of vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ExpireDays**
Number of days until expiration. Default value is '365'.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Format**
Certificate Format. Default value is 'PEM'.  Possible values: 'pkcs12', 'pem'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Destination**
URI to send file to. Example: ftp://abc.com.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **HashFunction**
Hashing function used to sign the certificate. Default value is 'sha256'.  Possible values: 'sha1', 'sha256', 'md5'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PrivateKey**
Private key.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **FilePassword**
Password for PKCS12 file.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Username**
Destination URI username.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Password**
Destination URI password.

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
* DataONTAP.C.Types.SecurityCertificate.SignedCertificate

---

### Notes
Category: security certificate
API: security-certificate-sign
Family: cluster,vserver

---

### Syntax
```PowerShell
Grant-NcSecurityCertificate [-CertificateAuthority] <String> [-CaSerialNumber] <String> [-Csr] <String> [-Vserver <String>] [-ExpireDays <Int32>] [-Format <String>] [-Destination <String>] 
```
```PowerShell
[-HashFunction <String>] [-PrivateKey <String>] [-FilePassword <String>] [-Username <String>] [-Password <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
