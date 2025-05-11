Remove-NcProtocolS3Services
---------------------------

### Synopsis
Deletes the S3 server configuration of an SVM.

---

### Description

Deletes the S3 server configuration of an SVM. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcProtocolS3Services](New-NcProtocolS3Services)

* [Set-NcProtocolS3Services](Set-NcProtocolS3Services)

* [Get-NcProtocolS3Services](Get-NcProtocolS3Services)

---

### Examples
> Example 1

Remove-NcProtocolS3Services -Vserver vs0
Removing S3 Server configuration.
Are you sure you want to remove S3 Server configuration on Vserver vs0 ?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): A

---

### Parameters
#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: S3
Api: api/protocols/s3/services/{svm.uuid}
Family: controller

---

### Syntax
```PowerShell
Remove-NcProtocolS3Services [-Vserver] <String> [<CommonParameters>]
```
