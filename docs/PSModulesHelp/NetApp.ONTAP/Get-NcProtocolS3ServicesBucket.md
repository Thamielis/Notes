Get-NcProtocolS3ServicesBucket
------------------------------

### Synopsis
Retrieves Bucket Configuration created on svm. This cmdlet is supported with Rest.

---

### Description

Retrieves Bucket Configuration created on svm.

---

### Related Links
* [New-NcProtocolS3ServicesBucket](New-NcProtocolS3ServicesBucket)

* [Set-NcProtocolS3ServicesBucket](Set-NcProtocolS3ServicesBucket)

* [Remove-NcProtocolS3ServicesBucket](Remove-NcProtocolS3ServicesBucket)

---

### Examples
> Example 1

```PowerShell
Get-NcProtocolS3ServicesBucket -VserverContext vs0 -Name newbucket
NcController             : 10.237.144.166
Access                   :
Permission               :
AggregateName            :
AggregateUuid            :
ConstituentsPerAggregate :
Comment                  : test
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
Size                     : 1717986038
SvmName                  : vs0
SvmUuid                  : 0253c79a-abfe-11ec-9e69-005056a7bd6c
Type                     : s3
VersioningState          : disabled
VolumeName               : fg_oss_1656638854
VolumeUuid               : 07b99e6a-f8dd-11ec-92ce-005056a7bd6c

```

---

### Parameters
#### **VserverContext**
Name of the SVM on which Bucket is Configured.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |0       |true         |VS     |

#### **Name**
Specifies the Name of the Bucket

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Template**
Specify $a = Get-NcProtocolS3ServicesBucket -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3ServicesBucket -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcProtocolS3ServicesBucket -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3ServicesBucket -Query $a.

|Type                                                   |Required|Position|PipelineInput|
|-------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3ServicesBucket -Attributes $a.

|Type                                                   |Required|Position|PipelineInput|
|-------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput

---

### Notes
Category: S3
Api: /api/protocols/S3/services/{uuid}/buckets
Family: Vserver

---

### Syntax
```PowerShell
Get-NcProtocolS3ServicesBucket [-VserverContext] <String> [-Name <String>] [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesBucket -Template <DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput> [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesBucket -Query <DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput> [-Attributes <DataONTAP.C.Types.S3.ProtocolS3ServicesBucketOutput>] [<CommonParameters>]
```
