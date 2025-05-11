New-NcFileserviceEventAudit
---------------------------

### Synopsis
Creates an S3 audit configuration.

---

### Description

Auditing for NAS events is a security measure that enables you to track and log certain S3 events on SVMs. This cmdlet is supported with Rest.

---

### Related Links
* [Get-NcFileserviceEventAudit](Get-NcFileserviceEventAudit)

* [Set-NcFileserviceEventAudit](Set-NcFileserviceEventAudit)

---

### Examples
> Example 1

```PowerShell
New-NcFileserviceEventAudit-Vserver vs1 -LogPath / -Enabled $true -EventManagement $true -EventData $true -Log $a
LogPath         : /
Vserver         : vs1
Enabled         : True
EventData       : True
EventManagement : True
Log             : DataONTAP.C.Types.FileserviceAudit.Log
NcController    : 10.237.145.102
VserverUuid     : 8747c5ab-d10f-11ec-9f68-005056a7f673

```

---

### Parameters
#### **LogPath**
The audit log destination path where consolidated audit logs are stored.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |0       |true (ByPropertyName)|Path   |

#### **Vserver**
Name of Svm.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |VS<br/>SvmName|

#### **Enabled**
Specifies whether or not auditing is enabled on the SVM

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **EventData**
Specifies data events

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **EventManagement**
Specifies management events

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Log**
Specifies format, retention and rotation of s3 logs

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.FileserviceAudit.Log]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.FileserviceAudit.ProtocolAuditObjectStoreOutput

---

### Notes
Category: FileserviceAudit
Api: api/protocols/audit/{svm.uuid}/object-store
Family: Controller

---

### Syntax
```PowerShell
New-NcFileserviceEventAudit [-LogPath] <String> [-Vserver <String>] [-Enabled <Boolean>] [-EventData <Boolean>] [-EventManagement <Boolean>] [-Log <DataONTAP.C.Types.FileserviceAudit.Log>] 
```
```PowerShell
[<CommonParameters>]
```
