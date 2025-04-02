Get-NcProtocolS3ServicesGroups
------------------------------

### Synopsis
Retrieves the S3 group's SVM configuration.

---

### Description

Retrieves the S3 group's SVM configuration. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcProtocolS3ServicesGroups](New-NcProtocolS3ServicesGroups)

* [Set-NcProtocolS3ServicesGroups](Set-NcProtocolS3ServicesGroups)

* [Remove-NcProtocolS3ServicesGroups](Remove-NcProtocolS3ServicesGroups)

---

### Examples
> Example 1

```PowerShell
Get-NcProtocolS3ServicesGroups
NcController : 172.21.109.85
Comment      : Admin group
Id           : 1
Name         : Admin-Group
Policies     : {*}
Users        : {user-1}
SvmName      : vs0
SvmUuid      : 8b540394-cb72-11ec-b271-005056ac1b5c

```

---

### Parameters
#### **Name**
Name of the group.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |0       |true (ByPropertyName)|

#### **SvmName**
Name of Svm.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SvmUuid**
Uuid of Svm.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Id**
Specifies a unique group ID used to identify a particular group.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **Comment**
Any additional information about the server being created..

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

#### **Template**
Specify $a = Get-NcProtocolS3ServicesGroups -Template, to get an empty protocol S3 service group object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3ServicesGroups -Attributes $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.S3.ProtocolS3ServicesGroups, to get an empty protocol S3 service group object for use with advanced queries involving the Attributes like $b = Get-NcProtocolS3ServicesGroups -Attributes $a.

|Type                                             |Required|Position|PipelineInput|
|-------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.S3.ProtocolS3ServicesGroups]`|false   |named   |false        |

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
Get-NcProtocolS3ServicesGroups [[-Name] <String>] [-SvmName <String>] [-SvmUuid <String>] [-Id <Int64>] [-Comment <String>] [-Users <String[]>] [-Policies <String[]>] [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesGroups -Template <DataONTAP.C.Types.S3.ProtocolS3ServicesGroups> [<CommonParameters>]
```
```PowerShell
Get-NcProtocolS3ServicesGroups [-Attributes <DataONTAP.C.Types.S3.ProtocolS3ServicesGroups>] [<CommonParameters>]
```
