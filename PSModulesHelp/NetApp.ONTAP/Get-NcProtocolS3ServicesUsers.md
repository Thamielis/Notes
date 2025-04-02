Get-NcProtocolS3ServicesUsers
-----------------------------

### Synopsis
Retrieves the S3 user's SVM configuration.

---

### Description

Retrieves the S3 user's SVM configuration.This cmdlet is supported with Rest

---

### Related Links
* [Set-NcProtocolS3ServicesUsers](Set-NcProtocolS3ServicesUsers)

* [Remove-NcProtocolS3ServicesUsers](Remove-NcProtocolS3ServicesUsers)

* [New-NcProtocolS3ServicesUsers](New-NcProtocolS3ServicesUsers)

---

### Examples
> Example 1

Get-NcProtocolS3ServicesUsers
UserName             Vserver              Comment              AccessKey                 SecretKey
--------             -------              -------              ---------                 ---------
user1                vs1                  User 1               SOUHS41SIQW7F5DTGFAP
user2                vs1                  User 2               H1ABY422WF31OCEH47HY
user1                vs2                  User 1               ZRAOW56H3GBHYI9GBCPA

---

### Parameters
#### **Name**
Specifies the name of the user.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |0       |true (ByPropertyName)|UserName|

#### **VserverContext**
Specifies the name of the SVM.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|false   |named   |true (ByPropertyName)|VS<br/>SvmName|

#### **Template**
Specify $a = Get-NcProtocolS3ServicesUsers -Template, to get an Protocol S3 ServicesUsers object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3ServicesUsers -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcProtocolS3ServicesUsers -Template, to get an Protocol S3 ServicesUsers object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3ServicesUsers -Query $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.ProtocolS3ServiceUser]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.S3.ProtocolS3ServiceUser, to get an Protocol S3 ServicesUsers object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3ServicesUsers -Attributes $a.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.ProtocolS3ServiceUser]`|false   |named   |false        |

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
Get-NcProtocolS3ServicesUsers [[-Name] <String>] [-VserverContext <String>] [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesUsers -Template <DataONTAP.C.Types.S3.ProtocolS3ServiceUser> [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesUsers -Query <ProtocolS3ServiceUser> [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesUsers [-Attributes <ProtocolS3ServiceUser>] [<CommonParameters>]
```
