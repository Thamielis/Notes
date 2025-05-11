Remove-NcProtocolS3ServicesGroups
---------------------------------

### Synopsis
Deletes the S3 group configuration of an SVM.

---

### Description

Deletes the S3 group configuration of an SVM. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolS3ServicesGroups](Get-NcProtocolS3ServicesGroups)

* [New-NcProtocolS3ServicesGroups](New-NcProtocolS3ServicesGroups)

* [Set-NcProtocolS3ServicesGroups](Set-NcProtocolS3ServicesGroups)

---

### Examples
> Example 1

Remove-NcProtocolS3ServicesGroups -Vserver vs0 -Id 2
Removing S3 group configuration.
Are you sure you want to remove S3 group configuration ?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): A

---

### Parameters
#### **Vserver**
The name of the SVM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

#### **Id**
Group identifier that identifies the unique group.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|true    |1       |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: S3
Api: api/protocols/s3/services/{svm.uuid}/groups/{id}
Family: controller

---

### Syntax
```PowerShell
Remove-NcProtocolS3ServicesGroups [-Vserver] <String> [-Id] <Int64> [<CommonParameters>]
```
