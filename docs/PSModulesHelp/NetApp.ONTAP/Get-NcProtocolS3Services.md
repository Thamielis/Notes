Get-NcProtocolS3Services
------------------------

### Synopsis
Retrieves the S3 server configuration for all SVMs.

---

### Description

Retrieves the S3 server configuration for all SVMs. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcProtocolS3Services](New-NcProtocolS3Services)

* [Set-NcProtocolS3Services](Set-NcProtocolS3Services)

* [Remove-NcProtocolS3Services](Remove-NcProtocolS3Services)

---

### Examples
> Example 1

Get-NcProtocolS3Services
NcController    : 172.21.109.85
Buckets         :
Comment         : S3 server
Enabled         : False
IsHttpEnabled   : False
IsHttpsEnabled  : True
Name            : Server-1
Port            : 80
SecurePort      : 443
Metric          : DataONTAP.C.Types.S3.Metric
Statistics      :
Users           : {root, user-1}
CertificateName : vs0_16EBD2B1673E3660
CertificateUuid : 921bf46e-cb72-11ec-af69-005056ac6aeb
SvmName         : vs0
SvmUuid         : 8b540394-cb72-11ec-b271-005056ac1b5c

---

### Parameters
#### **Name**
Specifies the name of the S3 server.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Template**
Specify $a = Get-NcProtocolS3Services -Template, to get an empty protocol S3 service object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3Services -Attributes $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.S3.ProtocolS3Services, to get an empty protocol S3 service object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3Services -Attributes $a.

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.ProtocolS3Services]`|false   |named   |false        |

#### **Query**
Specify $a = Get-NcProtocolS3Services -Template, to get an empty protocol S3 service object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3Services -Query $a.

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.ProtocolS3Services]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3Services

---

### Notes
Category: S3
Api: api/protocols/s3/services
Family: controller

---

### Syntax
```PowerShell
Get-NcProtocolS3Services [[-Name] <String>] [-Vserver <String>] [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3Services -Template <DataONTAP.C.Types.S3.ProtocolS3Services> [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3Services [-Attributes <DataONTAP.C.Types.S3.ProtocolS3Services>] [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3Services -Query <DataONTAP.C.Types.S3.ProtocolS3Services> [<CommonParameters>]
```
