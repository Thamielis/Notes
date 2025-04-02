New-NcProtocolS3Bucket
----------------------

### Synopsis
Creates the S3 bucket configuration of an SVM

---

### Description

Creates the S3 bucket configuration of an SVM. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolS3Bucket](Get-NcProtocolS3Bucket)

* [Set-NcProtocolS3Bucket](Set-NcProtocolS3Bucket)

* [Remove-NcProtocolS3Bucket](Remove-NcProtocolS3Bucket)

---

### Examples
> Example 1

```PowerShell
New-NcProtocolS3Bucket -Name newbucket1 -Comment test -Vserver vs0
Creates new bucket configuration named newbucket1 on Vserver vs0

NcController : 10.237.144.166
ErrorCode    :
ErrorMessage :
JobId        :
JobVserver   : vs0
Status       : running
Uuid         : 97ff7025-fb38-11ec-92ce-005056a7bd6c
Message      : [Job 1610] Creating an object store volume for bucket.

```

---

### Parameters
#### **Name**
Specifies the name of the bucket. Bucket name is a string that can only contain the following combination of ASCII-range alphanumeric characters 0-9, a-z, ".", and "-".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **Aggregates**
A list of aggregates for FlexGroup volume constituents where the bucket is hosted. If this option is not specified, the bucket is auto-provisioned as a FlexGroup volume..

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[Aggregates[]]`|false   |named   |false        |

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

#### **ConstituentsPerAggregate**
Specifies the number of constituents or FlexVol volumes per aggregate.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|false   |named   |false        |

#### **LifecycleManagement**
Lifecycle management is implemented as an object associated with a bucket.It defines rules to be applied against objects within a bucket. To Instantiate , Please create object using New-Object DataONTAP.C.Types.S3.LifecycleManagement.This Parameter is Supported on ONTAP version above 9.11

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.LifecycleManagement]`|false   |named   |false        |

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

#### **StorageServiceLevel**
Specifies the storage service level of the FlexGroup volume on which the bucket should be create.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Policy**
A policy is an object associated with a bucket.It defines resource(bucket, folder, or object) permissions. To Instantiate please create object using New-Object DataONTAP.C.Types.S3.Policy

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.Policy]`|false   |named   |false        |

#### **Async**
Specify if a s3 bucket is to be created asynchronously.

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
API: /protocols/s3/buckets
Family: Cluster

---

### Syntax
```PowerShell
New-NcProtocolS3Bucket [-Name] <String> -Aggregates <Aggregates[]> -Vserver <String> [-Comment <String>] [-ConstituentsPerAggregate <long>] [-Type <string>] [-VersioningState <string>] 
```
```PowerShell
[<CommonParameters>]
```
