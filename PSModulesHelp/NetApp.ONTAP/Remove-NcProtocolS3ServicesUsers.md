Remove-NcProtocolS3ServicesUsers
--------------------------------

### Synopsis
Deletes the S3 user configuration of an SVM.

---

### Description

Deletes the S3 user configuration of an SVM.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcProtocolS3ServicesUsers](Get-NcProtocolS3ServicesUsers)

* [New-NcProtocolS3ServicesUsers](New-NcProtocolS3ServicesUsers)

* [Set-NcProtocolS3ServicesUsers](Set-NcProtocolS3ServicesUsers)

---

### Examples
> Example 1

```PowerShell
Remove-NcProtocolS3ServicesUsers -Name user2 -VserverContext vs2
```

---

### Parameters
#### **Name**
Specifies the name of the user.

|Type      |Required|Position|PipelineInput         |Aliases |
|----------|--------|--------|----------------------|--------|
|`[String]`|true    |0       |false (ByPropertyName)|UserName|

#### **VserverContext**
Specifies the name of the SVM.

|Type      |Required|Position|PipelineInput         |Aliases       |
|----------|--------|--------|----------------------|--------------|
|`[String]`|true    |1       |false (ByPropertyName)|VS<br/>SvmName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: S3
Api: /protocols/s3/services/{svm.uuid}/users
Family: Controller

---

### Syntax
```PowerShell
Remove-NcProtocolS3ServicesUsers [-Name] <String> [-VserverContext] <String> [<CommonParameters>]
```
