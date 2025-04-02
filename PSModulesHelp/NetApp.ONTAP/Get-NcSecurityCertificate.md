Get-NcSecurityCertificate
-------------------------

### Synopsis
Get a list of security-certificate objects.

---

### Description

Get a list of security-certificate objects.

---

### Related Links
* [Remove-NcSecurityCertificate](Remove-NcSecurityCertificate)

* [New-NcSecurityCertificate](New-NcSecurityCertificate)

---

### Examples
> Example 1

Get-NcSecurityCertificate -Vserver beam01
Get the security certificates for the beam01 vserver.

CertificateAuthority    : beam01.cert
CommonName              : beam01.cert
Country                 : US
EmailAddress            : 
ExpirationDate          : 1392238850
ExpirationDateDT        : 2/12/2014 4:00:50 PM
ExpireDays              : 
HashFunction            : sha256
Locality                : 
NcController            : 10.63.165.62
Organization            : 
OrganizationUnit        : 
Protocol                : ssl
PublicCertificate       : -----BEGIN CERTIFICATE-----
                          
                          -----END CERTIFICATE-----
                          
SerialNumber            : 511AAD82
Size                    : 2048
StartDate               : 1360702850
StartDateDT             : 2/12/2013 4:00:50 PM
State                   : 
Type                    : server
Vserver                 : beam01
ExpirationDateSpecified : True
ExpireDaysSpecified     : False
StartDateSpecified      : True

> Example 2

$q = Get-NcSecurityCertificate -Template
$q.HashFunction = "sha256"
$q.Vserver = "beam01"
Get-NcSecurityCertificate -Query $q
Query for security certificates.

CertificateAuthority    : beam01.cert
CommonName              : beam01.cert
Country                 : US
EmailAddress            : 
ExpirationDate          : 1392238850
ExpirationDateDT        : 2/12/2014 4:00:50 PM
ExpireDays              : 
HashFunction            : sha256
Locality                : 
NcController            : 10.63.165.62
Organization            : 
OrganizationUnit        : 
Protocol                : ssl
PublicCertificate       : -----BEGIN CERTIFICATE-----
                          
                          -----END CERTIFICATE-----
                          
SerialNumber            : 511AAD82
Size                    : 2048
StartDate               : 1360702850
StartDateDT             : 2/12/2013 4:00:50 PM
State                   : 
Type                    : server
Vserver                 : beam01
ExpirationDateSpecified : True
ExpireDaysSpecified     : False
StartDateSpecified      : True

---

### Parameters
#### **CommonName**
One or more domain names in FQDN form.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **SerialNumber**
One or more serial numbers of certificates.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **CertificateAuthority**
One or more certificate authority values.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Type**
Type of certificate.  Possible values:  server, root_ca, client_ca, server_chain.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Size**
Size of requested certificate in bits.  Possible values:  512, 1024, 1536, 2048.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **CertName**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CertificateInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityCertificate -Template" to get the initially empty CertificateInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CertificateInfo]`|false   |named   |false        |

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
Specify to get an empty CertificateInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CertificateInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecurityCertificate -Template" to get the initially empty CertificateInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CertificateInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecurityCertificate.CertificateInfo

---

### Notes
Category: security certificate
API: security-certificate-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSecurityCertificate [[-CommonName] <String[]>] [-SerialNumber <String[]>] [-CertificateAuthority <String[]>] [-Type <String[]>] [-Size <String[]>] [-Vserver <String[]>] [-CertName 
```
```PowerShell
<String[]>] [-Attributes <CertificateInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityCertificate -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityCertificate -Query <CertificateInfo> [-Attributes <CertificateInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
