Set-NcProtocolS3Bucket
----------------------

### Synopsis
Updates the S3 bucket configuration of an SVM

---

### Description

Updates the S3 bucket configuration of an SVM. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolS3Bucket](Get-NcProtocolS3Bucket)

* [New-NcProtocolS3Bucket](New-NcProtocolS3Bucket)

* [Remove-NcProtocolS3Bucket](Remove-NcProtocolS3Bucket)

---

### Examples
> Example 1

Set-NcProtocolS3Bucket -Name newbucket1 -Vserver vs0  -Size 1823451223
Modifies new bucket configuration named newbucket1 on Vserver vs0

Name       Size       VersioningState SvmName Type VolumeName
----       ----       --------------- ------- ---- ----------
newbucket1 1823451223 disabled        vs0     s3   fg_oss_1656898108

---

### Parameters
#### **Name**
Specifies the name of the bucket. Bucket name is a string that can only contain the following combination of ASCII-range alphanumeric characters 0-9, a-z, ".", and "-".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **Vserver**
Existing SVM in which to create the bucket configuration

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Comment**
Can contain any additional information about the bucket being created or modified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AuditEventSelector**
Audit event selector allows you to specify access and permission types to audit. To Instantiate , Please create object using New-Object DataONTAP.C.Types.S3.AuditEventSelector.

|Type                                       |Required|Position|PipelineInput|
|-------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.AuditEventSelector]`|false   |named   |false        |

#### **QosPolicy**
Specifies qos_policy.max_throughput_iops and/or qos_policy.max_throughput_mbps or qos_policy.min_throughput_iops and/or qos_policy.min_throughput_iops. To Instantiate , Please create object using New-Object DataONTAP.C.Types.S3.QosPolicy.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.QosPolicy]`|false   |named   |false        |

#### **NasPath**
Specifies the NAS path to which the nas bucket corresponds to.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Size**
Specifies the bucket size in bytes; ranges from 80MB to 64TB.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|false   |named   |false        |

#### **VersioningState**
Specifies the versioning state of the bucket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Policy**
A policy is an object associated with a bucket.It defines resource(bucket, folder, or object) permissions. To Instantiate please create object using New-Object DataONTAP.C.Types.S3.Policy

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.Policy]`|false   |named   |false        |

#### **Async**
Specify if a s3 bucket is to be Modified asynchronously.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
DataONTAP.C.Types.S3.RestProtocolS3BucketInfo

---

### Outputs
* DataONTAP.C.Types.S3.RestProtocolS3BucketInfo

---

### Notes
Category: S3
API: /protocols/s3/buckets/{svm.uuid}/uuid
Family: Cluster

---

### Syntax
```PowerShell
New-NcProtocolS3Bucket [-Name] <String> [-Comment <String>] -Vserver <String> [-Size <string>] [<CommonParameters>]
```
