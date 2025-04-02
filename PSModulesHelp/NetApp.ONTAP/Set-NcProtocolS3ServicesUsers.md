Set-NcProtocolS3ServicesUsers
-----------------------------

### Synopsis
Updates the S3 user configuration of an SVM..

---

### Description

Updates the S3 user configuration of an SVM. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolS3ServicesUsers](Get-NcProtocolS3ServicesUsers)

* [Remove-NcProtocolS3ServicesUsers](Remove-NcProtocolS3ServicesUsers)

* [New-NcProtocolS3ServicesUsers](New-NcProtocolS3ServicesUsers)

---

### Examples
> Example 1

Set-NcProtocolS3ServicesUsers -Name user2 -VserverContext vs2 -Comment "User 2"
UserName             Vserver              Comment              AccessKey                 SecretKey
--------             -------              -------              ---------                 ---------
user2                vs2                  User 2               RZJB15101VO6KN0ND04B

---

### Parameters
#### **Name**
Specifies the name of the user.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |0       |true (ByPropertyName)|UserName|

#### **VserverContext**
Specifies the name of the SVM.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|true    |1       |true (ByPropertyName)|VS<br/>SvmName|

#### **Comment**
Specifies any additional information about the user being modified.

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[String]`|false   |named   |false (ByPropertyName)|

#### **RegenerateKeys**
Specifies whether or not to regenerate the user keys.

|Type      |Required|Position|PipelineInput         |
|----------|--------|--------|----------------------|
|`[Switch]`|false   |named   |false (ByPropertyName)|

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
Set-NcProtocolS3ServicesUsers [-Name] <String> [-VserverContext] <String> [-Comment <String>] [-RegenerateKeys <SwitchParameter>] [<CommonParameters>]
```
