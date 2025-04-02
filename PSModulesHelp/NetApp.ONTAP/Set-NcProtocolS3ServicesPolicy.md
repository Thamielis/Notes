Set-NcProtocolS3ServicesPolicy
------------------------------

### Synopsis
Updates the S3 policy configuration of an SVM.This cmdlet is supported with Rest

---

### Description

Updates the S3 policy configuration of an SVM.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcProtocolS3ServicesPolicy](Get-NcProtocolS3ServicesPolicy)

---

### Examples
> Example 1

```PowerShell
Set-NcProtocolS3ServicesPolicy -Name Policy1 -Vserver vs0 -Statements $statement
Updates the S3 policy configuration of an SVM.This cmdlet is supported with Rest

NcController : 10.236.154.100
Name         : Policy1
Comment      : S3 policy.
ReadOnly     : False
Statements   : {FullAccessToBucket2}
SvmName      : vs0
SvmUuid      : c78011e8-bc7c-11ec-8d87-005056a7b9f3

```

---

### Parameters
#### **Name**
Specifies the name of the policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Comment**
Can contain any additional information about the S3 policy.

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[String]`|false   |named   |false (ByPropertyName)|

#### **Vserver**
Vserver to which this object belongs.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|SvmName|

#### **Statements**
Specifies the policy statements.

|Type                                |Required|Position|PipelineInput         |
|------------------------------------|--------|--------|----------------------|
|`[DataONTAP.C.Types.S3.Statement[]]`|false   |named   |false (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3ServicesPoliciesOutput

---

### Notes
Category: S3
API: protocols/s3/services/{svm.uuid}/policies/{name}
Family: cluster

---

### Syntax
```PowerShell
Set-NcProtocolS3ServicesPolicy [-Name] <String> [-Vserver] <String> [-Comment <String>] [-Statements <DataONTAP.C.Types.S3.Statement[]>] [<CommonParameters>]
```
