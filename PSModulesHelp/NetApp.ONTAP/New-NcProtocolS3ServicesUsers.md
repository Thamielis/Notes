New-NcProtocolS3ServicesUsers
-----------------------------

### Synopsis
Creates the S3 user configuration.

---

### Description

Creates the S3 user configuration.This cmdlet is supported with Rest

---

### Related Links
* [Get-NcProtocolS3ServicesUsers](Get-NcProtocolS3ServicesUsers)

* [Remove-NcProtocolS3ServicesUsers](Remove-NcProtocolS3ServicesUsers)

* [Set-NcProtocolS3ServicesUsers](Set-NcProtocolS3ServicesUsers)

---

### Examples
> Example 1

New-NcProtocolS3ServicesUsers -Name user2 -VserverContext vs2
UserName             Vserver              Comment              AccessKey                 SecretKey
--------             -------              -------              ---------                 ---------
user2                                                          RZJB15101VO6KN0ND04B      NNBLq_h0qc43c3CipS3tjcbVBnAJN3fbc5ct_8_q

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

#### **Comment**
Specifies any additional information about the user being modified.

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[String]`|false   |named   |false (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3ServiceUser

---

### Notes
Category: S3
Api: /protocols/s3/services/{svm.uuid}/users
Family: Controller

---

### Syntax
```PowerShell
New-NcProtocolS3ServicesUsers [-Name] <String> [-VserverContext] <String> [-Comment <String>] [<CommonParameters>]
```
