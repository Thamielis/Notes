New-NcProtocolS3Services
------------------------

### Synopsis
Creates an S3 server, users, and buckets configurations.

---

### Description

Creates an S3 server, users, and buckets configurations. Each SVM can have one S3 server configuration. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolS3Services](Get-NcProtocolS3Services)

* [Set-NcProtocolS3Services](Set-NcProtocolS3Services)

* [Remove-NcProtocolS3Services](Remove-NcProtocolS3Services)

---

### Examples
> Example 1

```PowerShell
New-NcProtocolS3Services -Vserver vs0 -CertificateName "vs0_16EBD2B1673E3660" -Comment "New S3 server" -Enabled $true -Name "New-Server-1"
Buckets         :
CertificateName : vs0_16EBD2B1673E3660
Comment         : New S3 server
Enabled         : True
Name            : New-Server-1
Users           : {root}
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

```

---

### Parameters
#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **Buckets**
A bucket is a container of objects. Each bucket defines an object namespace.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.Bucket[]]`|false   |named   |false        |

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

#### **Users**
This is a container of S3 users.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.User[]]`|false   |named   |false        |

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
New-NcProtocolS3Services [-Vserver] <String> [-Buckets <DataONTAP.C.Types.S3.Bucket[]>] [-CertificateName <String>] [-Comment <String>] [-Enabled <Boolean>] [-IsHttpEnabled <Boolean>] 
```
```PowerShell
[-IsHttpsEnabled <String>] [-Name <String>] [-Port <Int64>] [-SecurePort <Int64>] [-Users <DataONTAP.C.Types.S3.User[]>] [<CommonParameters>]
```
