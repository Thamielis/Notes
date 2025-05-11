Remove-NcProtocolS3ServicesPolicy
---------------------------------

### Synopsis
Removes the S3 policy configuration of an SVM.This cmdlet is supported with Rest

---

### Description

Removes the S3 policy configuration of an SVM.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcProtocolS3ServicesPolicy](Get-NcProtocolS3ServicesPolicy)

---

### Examples
> Example 1

```PowerShell
Remove-NcProtocolS3ServicesPolicy -Name Policy1 -Vserver vs0
Removes the specified S3 policy configuration of an SVM.
```

---

### Parameters
#### **Name**
Specifies the name of the policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Vserver**
Vserver to which this object belongs.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|SvmName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: S3
API: protocols/s3/services/{svm.uuid}/policies/{name}
Family: cluster

---

### Syntax
```PowerShell
Remove-NcProtocolS3ServicesPolicy [-Name] <String> [-Vserver] <String> [<CommonParameters>]
```
