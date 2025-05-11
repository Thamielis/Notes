Remove-NcProtocolS3ServicesBucket
---------------------------------

### Synopsis
Deletes the S3 bucket configuration of an SVM

---

### Description

Deletes the S3 bucket configuration of an SVM. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcProtocolS3ServicesBucket](Get-NcProtocolS3ServicesBucket)

* [New-NcProtocolS3ServicesBucket](New-NcProtocolS3ServicesBucket)

* [Set-NcProtocolS3ServicesBucket](Set-NcProtocolS3ServicesBucket)

---

### Examples
> Example 1

```PowerShell
Remove-NcProtocolS3ServicesBucket -Name newbucket -Vserver vs0
Remove S3 Server Configuration
```

---

### Parameters
#### **Name**
Specifies the name of the bucket. Bucket name is a string that can only contain the following combination of ASCII-range alphanumeric characters 0-9, a-z, ".", and "-".

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |0       |false        |BucketName|

#### **Vserver**
Specify the Name of the Bucket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **S3Bucketid**
The Unique Identifier of the Bucket

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: S3
API: /protocols/s3/services/svm.uuid/buckets/{uuid}
Family: Cluster

---

### Syntax
```PowerShell
Set-NcProtocolS3ServicesBucket [-Name] <String> [-Vserver] <string> [<CommonParameters>]
```
