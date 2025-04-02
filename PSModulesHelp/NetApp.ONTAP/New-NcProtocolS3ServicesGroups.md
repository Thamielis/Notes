New-NcProtocolS3ServicesGroups
------------------------------

### Synopsis
Creates the S3 group configuration.

---

### Description

Creates the S3 group configuration. Each SVM can have one or more s3 group configurations. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcProtocolS3ServicesGroups](Get-NcProtocolS3ServicesGroups)

* [Set-NcProtocolS3ServicesGroups](Set-NcProtocolS3ServicesGroups)

* [Remove-NcProtocolS3ServicesGroups](Remove-NcProtocolS3ServicesGroups)

---

### Examples
> Example 1

```PowerShell
New-NcProtocolS3ServicesGroups -Vserver vs0 -Comment "New_Group" -Name "Group2" -Users "user-1" -Policies "*"
NcController : 172.21.109.85
Comment      : New_Group
Id           : 2
Name         : Group2
Policies     : {*}
Users        : {user-1}
SvmName      : vs0
SvmUuid      : 8b540394-cb72-11ec-b271-005056ac1b5c

```

---

### Parameters
#### **Vserver**
The name of the SVM.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

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
Api: api/protocols/s3/services/{svm.uuid}/groups
Family: controller

---

### Syntax
```PowerShell
New-NcProtocolS3ServicesGroups [-Vserver] <String> [-Comment <String>] [-Name <String>] [-Users <String[]>] [-Policies <String[]>] [<CommonParameters>]
```
