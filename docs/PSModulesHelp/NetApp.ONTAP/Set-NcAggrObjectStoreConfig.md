Set-NcAggrObjectStoreConfig
---------------------------

### Synopsis
Modify an existing object store configuration

---

### Description

Modify an existing object store configuration

---

### Parameters
#### **ObjectStoreName**
Name for the object store configuration.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **NewObjectStoreName**
New object store configuration name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AccessKey**
Access key.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Ipspace**
IPspace to use in order to reach the object store

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Port**
Port number of the object store

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **UseIamRole**
Use IAM Role for AWS ONTAP Cloud. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **SecretPassword**
Secret password.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DomainServer**
Fully qualified domain name of the object store.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SslEnabled**
SSL/HTTPS enabled or not.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **AzureAccount**
Azure account
This parameter is available in ONTAP 9.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AzurePrivateKey**
Azure access key
This parameter is available in ONTAP 9.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsCertificateValidationEnabled**
Is SSL/TLS certificate validation enabled. The default value is 'true'
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **CheckOnly**
Do not create a config. Only check that create could succeed.
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IgnoreWarningCodes**
Input list with warning codes which can be ignored.
This parameter is available in ONTAP 9.4 and later. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|

#### **AuthType**
Authentication used to access the object store. Supported values are:
<ul>
<li> 'key' - Access keys provided by admin
<li> 'CAP' - Access keys and session token retrieved from the
C2S Access Portal (CAP)
<li> 'EC2-IAM' - In Cloud Volumes ONTAP access keys and
session token retrieved from the EC2 instance metadata for the
IAM role associated with EC2 instance
</ul>.
This parameter is available in ONTAP 9.5 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CapUrl**
URL to request temporary credentials for a C2S account.
This Parameter is available in ONTAP 9.5 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Svm**
Svm. This parameter is supported with Rest only.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Aggr.Svm]`|false   |named   |false        |

#### **Cluster**
The cluster that owns the cloud target. This parameter is supported with Rest only.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Aggr.Cluster]`|false   |named   |false        |

#### **Container**
Data bucket/container name. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Owner**
Owner of the target. Allowed values are FabricPool, SnapMirror or S3_SnapMirror. A target can be used by only one feature. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ServerSideEncryption**
Encryption of data at rest by the object store server for AWS_S3 and other S3 compatible provider types. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SnapMirrorUse**
Use of the cloud target by SnapMirror. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UrlStyle**
URL style used to access S3 bucket. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **UseHttpProxy**
Use HTTP proxy when connecting to the object store. This parameter is supported with Rest only.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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
* DataONTAP.C.Types.Aggr.AggrObjectStoreConfigInfo

---

### Notes
Category: aggr
API: aggr-object-store-config-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcAggrObjectStoreConfig [-ObjectStoreName] <String> [-NewObjectStoreName <String>] [-AccessKey <String>] [-Ipspace <String>] [-Port <Int64>] [-UseIamRole <Boolean>] [-SecretPassword 
```
```PowerShell
<String>] [-DomainServer <String>] [-SslEnabled <Boolean>] [-AzureAccount <String>] [-AzurePrivateKey <String>] [-IsCertificateValidationEnabled <Boolean>] [-CheckOnly <Boolean>] 
```
```PowerShell
[-IgnoreWarningCodes <Int64[]>] [-AuthType <String>] [-CapUrl <String>] [-Svm <DataONTAP.C.Types.Aggr.Svm>] [-Cluster <DataONTAP.C.Types.Aggr.Cluster>] [-Container <String>] [-Owner <String>] 
```
```PowerShell
[-ServerSideEncryption <String>] [-SnapMirrorUse <String>] [-UrlStyle <String>] [-UseHttpProxy <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
