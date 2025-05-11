Remove-NcSecurityCertificate
----------------------------

### Synopsis
Remove a security certificate object.

---

### Description

Remove a security certificate object.

---

### Related Links
* [Get-NcSecurityCertificate](Get-NcSecurityCertificate)

* [New-NcSecurityCertificate](New-NcSecurityCertificate)

---

### Examples
> Example 1

```PowerShell
Remove-NcSecurityCertificate -CommonName beam01.cert2 -Type root_ca -SerialNumber 51BB6E69 -CertificateAuthority beam01.cert2 -Vserver sfp-cmode-02
Remove the given security certificate.
```
> Example 2

```PowerShell
$q = Get-NcSecurityCertificate -Template
$q.CommonName = 'beam01.cert2'
Remove-NcSecurityCertificate -Query $q
Remove the security certificate that matches the query.

SuccessCount : 1
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.SecurityCertificate.CertificateInfo}
FailureList  : {}

```

---

### Parameters
#### **CommonName**
The domain name in FQDN form that specifies its exact location in the tree hierarchy of the Domain Name System (DNS).

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Type**
Type of certificate.
Possible values:
'server'       - Server certificate,
'root_ca'      - Self-Signed Root CA,
'client_ca'    - CA who signed user certificates',
'server_chain' - Intermediate certificate for server authentication

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **SerialNumber**
Serial number of certificate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **CertificateAuthority**
Certificate authority.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **Vserver**
Name of vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Subtype**
Certificate subtype.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SystemInternalCertificate**
Specify if the certificate being removed was a NetApp internal certificate.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CertName**

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a CertificateInfo object with various fields set to indicate which records to remove.  Other fields should remain set to null.  Use "Get-NcSecurityCertificate -Template" to get the initially empty CertificateInfo object.

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[CertificateInfo]`|true    |named   |true (ByPropertyName)|

#### **ContinueOnFailure**
If specified, the API will continue deleting the next matching security-certificate even when the deletion of a previous security-certificate fails.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
When allowing failures (ContinueOnFailure specified), MaxFailureCount limits the number of failed deletions before the server gives up and returns.
When specified, the API will continue deleting the next matching security-certificate even when the deletion of a previous matching security-certificate fails, and do so until the total number of objects failed to be deleted reaches the maximum specified.
If set to the maximum or not provided, then there will be no limit on the number of failed deletions.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: security certificate
API: security-certificate-delete,security-certificate-delete-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Remove-NcSecurityCertificate [-CommonName] <String> [-Type] <String> [-SerialNumber] <String> [-CertificateAuthority] <String> [-Vserver <String>] [-Subtype <String>] 
```
```PowerShell
[-SystemInternalCertificate] [-CertName <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcSecurityCertificate -Query <CertificateInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
