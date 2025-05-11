Remove-NcProtocolS3Bucket
-------------------------

### Synopsis
Deletes the S3 bucket configuration of an SVM

---

### Description

Deletes the S3 bucket configuration of an SVM. This cmdlet is supported with Rest

---

### Related Links
* [Get-NcProtocolS3Bucket](Get-NcProtocolS3Bucket)

* [New-NcProtocolS3Bucket](New-NcProtocolS3Bucket)

* [Set-NcProtocolS3Bucket](Set-NcProtocolS3Bucket)

---

### Examples
> Example 1

```PowerShell
Remove-NcProtocolS3Bucket -Name newbucket1 -Vserver vs0
Removing new bucket configuration named newbucket1 on Vserver vs0
```

---

### Parameters
#### **Name**
Specifies the name of the bucket. Bucket name is a string that can only contain the following combination of ASCII-range alphanumeric characters 0-9, a-z, ".", and "-".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **Vserver**
Existing SVM in which to create the bucket configuration

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |SvmName|

#### **Async**
Specify if a s3 bucket is to be deleted asynchronously.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: S3
API: /protocols/s3/buckets/{svm.uuid}/uuid
Family: Cluster

---

### Syntax
```PowerShell
Remove-NcProtocolS3Bucket [-Name] <String> -Vserver <String> [<CommonParameters>]
```
