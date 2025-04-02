New-NcProtocolS3ServicesBucket
------------------------------

### Synopsis
Creates the S3 bucket configuration of an SVM

---

### Description

Creates the S3 bucket configuration of an SVM. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolS3ServicesBucket](Get-NcProtocolS3ServicesBucket)

* [Set-NcProtocolS3ServicesBucket](Set-NcProtocolS3ServicesBucket)

* [Remove-NcProtocolS3ServicesBucket](Remove-NcProtocolS3ServicesBucket)

---

### Examples
> Example 1

```PowerShell
New-NcProtocolS3ServicesBucket -Name newbucket -Comment test -VserverContext vs0
Creates new bucket configuration named newbucket on Vserver vs0

NcController : 10.237.144.166
ErrorCode    :
ErrorMessage :
JobId        :
JobVserver   : vs0
Status       : running
Uuid         : f95a115a-f8dc-11ec-92ce-005056a7bd6c
Message      : [Job 1545] Creating an object store volume for bucket.

```

---

### Parameters
#### **Name**
Specifies the name of the bucket. Bucket name is a string that can only contain the following combination of ASCII-range alphanumeric characters 0-9, a-z, ".", and "-".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **AggregateName**
A list of aggregates for FlexGroup volume constituents where the bucket is hosted. If this option is not specified, the bucket is auto-provisioned as a FlexGroup volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Access**
Specify Acesss types to audit.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Permissions**
Specify Permission types to audit.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
Lifecycle management is implemented as an object associated with a bucket.It defines rules to be applied against objects within a bucket. To Instantiate , Please create object using New-Object DataONTAP.C.Types.S3.LifecycleManagement. This Parameter is Suppored on ONTAP version above 9.11

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.LifecycleManagement]`|false   |named   |false        |

#### **ProtectionStatus**
Specifies attributes of bucket protection need to create object of ProtectionStatus and pass its object in parameter. To Instantiate , Please create object using New-Object DataONTAP.C.Types.S3.ProtectionStatus.

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.ProtectionStatus]`|false   |named   |false        |

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

---

### Inputs
DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput

---

### Notes
Category: S3
API: /protocols/s3/services/svm.uuid/buckets
Family: vserver

---

### Syntax
```PowerShell
New-NcProtocolS3ServicesBucket [-Name] <String> [-AggregateName <string[]>] [-Access <String>] [-Comment <String>] [-Permission <String>] [-ConstituentsPerAggregate <long>] -VserverContext 
```
```PowerShell
<String> [-Type <string>] [-VersioningState <string>] [<CommonParameters>]
```
