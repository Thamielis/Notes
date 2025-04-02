Set-NcProtocolS3Services
------------------------

### Synopsis
Updates the S3 Server configuration of an SVM.

---

### Description

Updates the S3 Server configuration of an SVM. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcProtocolS3Services](New-NcProtocolS3Services)

* [Set-NcProtocolS3Services](Set-NcProtocolS3Services)

* [Remove-NcProtocolS3Services](Remove-NcProtocolS3Services)

---

### Examples
> Example 1

Set-NcProtocolS3Services -Vserver vs0 -Comment "New S3 server 2" -Enabled $true -Name "New-Server-2"
Buckets         :
CertificateName : vs0_16EBD2B1673E3660
Comment         : New S3 server 2
Enabled         : True
Name            : New-Server-2
Users           : {root, user-1}
NcController    : 172.21.109.85
IsHttpEnabled   : False
IsHttpsEnabled  : True
Port            : 80
SecurePort      : 443
Metric          : DataONTAP.C.Types.S3.Metric
Statistics      : DataONTAP.C.Types.S3.Statistics
CertificateUuid : 921bf46e-cb72-11ec-af69-005056ac6aeb
SvmName         : vs0
SvmUuid         : 8b540394-cb72-11ec-b271-005056ac1b5c

---

### Parameters
#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **CertificateName**
Specifies the certificate that will be used for creating HTTPS connections to the S3 server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Comment**
Any additional information about the server being created or modified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Enabled**
Specifies whether the S3 server being created or modified should be up or down.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **IsHttpEnabled**
Specifies whether HTTP is enabled on the S3 server being created or modified. By default, HTTP is disabled on the S3 server.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **IsHttpsEnabled**
Specifies whether HTTPS is enabled on the S3 server being created or modified. By default, HTTPS is enabled on the S3 server.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Name**
Specifies the name of the S3 server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Port**
Specifies the HTTP listener port for the S3 server. By default, HTTP is enabled on port 80.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **SecurePort**
Specifies the HTTPS listener port for the S3 server. By default, HTTPS is enabled on port 443.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3Services

---

### Notes
Category: S3
Api: api/protocols/s3/services/{svm.uuid}
Family: controller

---

### Syntax
```PowerShell
Set-NcProtocolS3Services [-Vserver] <String> [-CertificateName <String>] [-Comment <String>] [-Enabled <Boolean>] [-IsHttpEnabled <Boolean>] [-IsHttpsEnabled <String>] [-Name <String>] [-Port 
```
```PowerShell
<Int64>] [-SecurePort <Int64>] [<CommonParameters>]
```
