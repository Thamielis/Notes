Get-NcProtocolS3Bucket
----------------------

### Synopsis
Retrieves Bucket Configuration created on svm.

---

### Description

Retrieves all S3 buckets for all SVMs. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcProtocolS3Bucket](New-NcProtocolS3Bucket)

* [Set-NcProtocolS3Bucket](Set-NcProtocolS3Bucket)

* [Remove-NcProtocolS3Bucket](Remove-NcProtocolS3Bucket)

---

### Examples
> Example 1

Get-NcProtocolS3Bucket
Name      Size       VersioningState SvmName Type VolumeName
----      ----       --------------- ------- ---- ----------
newbucket 1717986038 disabled        vs0     s3   fg_oss_1656638854

---

### Parameters
#### **Name**
Specify the Name of the Bucket.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |0       |true (ByPropertyName)|BucketName|

#### **VolumeName**
Specifies the Name of the Volume

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **QosPolicyName**
Specifies the QosPolicy Group Name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Size**
Specifies the bucket size in bytes

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|false   |named   |false        |

#### **Vserver**
Specifies the Name of SVM

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[string]`|false   |named   |false        |SvmName|

#### **Type**
Specifies the Bucket type

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **Role**
Specifies the Role of the Bucket

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcProtocolS3Bucket -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3Bucket -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcProtocolS3Bucket -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3Bucket -Query $a.

|Type                                         |Required|Position|PipelineInput|
|---------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.RestProtocolS3Bucket]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3Bucket -Attributes $a.

|Type                                         |Required|Position|PipelineInput|
|---------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.RestProtocolS3Bucket]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.RestProtocolS3Bucket

---

### Notes
Category: S3
Api: /api/protocols/S3/buckets
Family: Cluster

---

### Syntax
```PowerShell
Get-NcProtocolS3Bucket [[-Name] <String>] [[-VolumeName] <String>] [-QosPolicyName <String>] [-Size <long>] [-Vserver <String>] [-Type <String>] [-Role <String>] [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3Bucket -Template <DataONTAP.C.Types.S3.RestProtocolS3Bucket> [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3Bucket -Query <DataONTAP.C.Types.S3.RestProtocolS3Bucket> [-Attributes <DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput>] [<CommonParameters>]
```
