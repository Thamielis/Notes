Set-NcProtocolS3ServicesBucket
------------------------------

### Synopsis
Modifies the S3 bucket configuration of an SVM

---

### Description

Modifies the S3 bucket configuration of an SVM. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcProtocolS3ServicesBucket](Get-NcProtocolS3ServicesBucket)

* [New-NcProtocolS3ServicesBucket](New-NcProtocolS3ServicesBucket)

* [Remove-NcProtocolS3ServicesBucket](Remove-NcProtocolS3ServicesBucket)

---

### Examples
> Example 1

```PowerShell
Set-NcProtocolS3ServicesBucket -Name newbucket -Vserver vs0 -Size 1823451212 -Comment modify_bucket
Modifies bucket configuration named newbucket on Vserver vs0

NcController             : 10.237.144.166
Access                   :
Permission               :
AggregateName            :
AggregateUuid            :
ConstituentsPerAggregate :
Comment                  : modify_bucket
StorageServiceLevel      :
Encryption               : DataONTAP.C.Types.S3.Encryption
LifecycleManagement      :
LogicalUsedSize          : 0
Name                     : newbucket
Uuid                     : f95a1076-f8dc-11ec-92ce-005056a7bd6c
NasPath                  :
ProtectionStatus         : DataONTAP.C.Types.S3.ProtectionStatus
QosPolicy                :
Role                     : standalone
Size                     : 1823451212
SvmName                  : vs0
SvmUuid                  : 0253c79a-abfe-11ec-9e69-005056a7bd6c
Type                     : s3
VersioningState          : disabled
VolumeName               : fg_oss_1656638854
VolumeUuid               : 07b99e6a-f8dd-11ec-92ce-005056a7bd6c

```

---

### Parameters
#### **Name**
Specifies the name of the bucket. Bucket name is a string that can only contain the following combination of ASCII-range alphanumeric characters 0-9, a-z, ".", and "-".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **Vserver**
Specify the Name of the Bucket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **AuditEventSelector**
Event selector allows you to specify access and permission types to audit".

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[AuditEventSelector]`|false   |named   |false        |

#### **NasPath**
Specifies the NAS path to which the nas bucket corresponds to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Comment**
Can contain any additional information about the bucket being created or modified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Policy**
A policy is an object associated with a bucket. It defines resource (bucket, folder, or object) permissions.To instantiate, create object using New-Object DataONTAP.C.Types.S3.Policy.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.Policy]`|false   |named   |false        |

#### **QosPolicy**
Specifies qos_policy.max_throughput_iops and/or qos_policy.max_throughput_mbps or qos_policy.min_throughput_iops and/or qos_policy.min_throughput_iops

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.QosPolicy]`|false   |named   |false        |

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
Family: Cluster

---

### Syntax
```PowerShell
Set-NcProtocolS3ServicesBucket [-Name] <String> [-Vserver] <string> [-AuditEventSelector <AuditEventSelector>] [-Comment <String>] [-Policy <Policy>] [-Size <long>] [-VersioningState 
```
```PowerShell
<string>] [<CommonParameters>]
```
```PowerShell
Set-NcProtocolS3ServicesBucket [-Name] <String> [-Vserver] <string> [-Comment <String>] [-Size <long>] [<CommonParameters>]
```
