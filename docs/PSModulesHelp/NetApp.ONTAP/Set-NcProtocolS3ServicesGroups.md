Set-NcProtocolS3ServicesGroups
------------------------------

### Synopsis
Updates the S3 group configuration of an SVM.

---

### Description

Updates the S3 group configuration of an SVM. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolS3ServicesGroups](Get-NcProtocolS3ServicesGroups)

* [New-NcProtocolS3ServicesGroups](New-NcProtocolS3ServicesGroups)

* [Remove-NcProtocolS3ServicesGroups](Remove-NcProtocolS3ServicesGroups)

---

### Examples
> Example 1

```PowerShell
Set-NcProtocolS3ServicesGroups -Vserver vs0 -Id 2 -Comment "Test-Comment" -Name "Group3"
Id           : 2
Comment      : Test-Comment
Name         : Group3
NcController : 172.21.109.85
Policies     : {*}
Users        : {user-1}
SvmName      : vs0
SvmUuid      : 8b540394-cb72-11ec-b271-005056ac1b5c

```

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

#### **Comment**
Any additional information about the server being created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Name**
Specifies the list of users who belong to the group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Users**
Specifies the list of users who belong to the group.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Policies**
Specifies a list of policies that are attached to the group.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.S3.ProtocolS3ServicesGroups

---

### Notes
Category: S3
Api: api/protocols/s3/services/{svm.uuid}/groups/{id}
Family: controller

---

### Syntax
```PowerShell
Set-NcProtocolS3ServicesGroups [-Vserver] <String> [-Id] <Int64> [-Comment <String>] [-Name <String>] [-Users <String[]>] [-Policies <String[]>] [<CommonParameters>]
```
