Get-NcSecurityCertificateIssued
-------------------------------

### Synopsis
Get a list of security certificate ca issued objects.

---

### Description

Get a list of security certificate ca issued objects.

---

### Related Links
* [Grant-NcSecurityCertificate](Grant-NcSecurityCertificate)

* [Revoke-NcSecurityCertificate](Revoke-NcSecurityCertificate)

---

### Examples
> Example 1

```PowerShell
Get-NcSecurityCertificateIssued
Get issued security certificates.

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
RevocationDate          :
RevocationDateDT        :
SerialNumber            : 51BF2C39
State                   :
Status                  : active
Vserver                 : sfp-cmode-02
ExpirationDateSpecified : True
RevocationDateSpecified : False

```
> Example 2

```PowerShell
$q = Get-NcSecurityCertificateIssued -Template
$q.CommonName = 'www.example.com'
Get-NcSecurityCertificateIssued -Query $q
Get the issued security certificates for the given query.

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
RevocationDate          :
RevocationDateDT        :
SerialNumber            : 51BF2C39
State                   :
Status                  : active
Vserver                 : sfp-cmode-02
ExpirationDateSpecified : True
RevocationDateSpecified : False

```

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SerialNumber**
One or more serial numbers of certificates.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **CertificateAuthority**
One or more certificate authority.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **CaSerialNumber**
One or more serial number of certificate authority.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CertificateCaIssuedInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSecurityCertificateIssued -Template" to get the initially empty CertificateCaIssuedInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CertificateCaIssuedInfo]`|false   |named   |false        |

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
Specify to get an empty CertificateCaIssuedInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CertificateCaIssuedInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSecurityCertificateIssued -Template" to get the initially empty CertificateCaIssuedInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CertificateCaIssuedInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SecurityCertificate.CertificateCaIssuedInfo

---

### Notes
Category: security certificate
API: security-certificate-ca-issued-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcSecurityCertificateIssued [-Vserver <String[]>] [-SerialNumber <String[]>] [-CertificateAuthority <String[]>] [-CaSerialNumber <String[]>] [-Attributes <CertificateCaIssuedInfo>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcSecurityCertificateIssued -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSecurityCertificateIssued -Query <CertificateCaIssuedInfo> [-Attributes <CertificateCaIssuedInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
