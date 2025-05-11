Get-NcFileserviceEventAudit
---------------------------

### Synopsis
Retrieves a collection of event destinations.

---

### Description

Retrieves a collection of event destinations. Create an event destination using New-NcEmsEventNotificationDestination. This cmdlet is supported with Rest.

---

### Related Links
* [New-NcFileserviceEventAudit](New-NcFileserviceEventAudit)

* [Set-NcFileserviceEventAudit](Set-NcFileserviceEventAudit)

---

### Examples
> Example 1

Get-NcFileserviceEventAudit -Vserver vs0
Enabled         LogPath              Vserver              EventData            EventManagement
-------         -------              -------              ---------            ---------------
True            /                    vs0                  False                True

---

### Parameters
#### **Vserver**
Name of the Svm.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |VS<br/>SvmName|

#### **Template**
Specify $a = Get-NcFileserviceEventAudit -Template, to get an empty s3 audit log object for use with advanced queries involving the Attributes like $b = Get-NcFileserviceEventAudit -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcFileserviceEventAudit -Template, to get an empty s3 audit log object for use with advanced queries involving the Attributes like $b = Get-NcFileserviceEventAudit -Query $a.

|Type                                                                 |Required|Position|PipelineInput|
|---------------------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.FileserviceAudit.ProtocolAuditObjectStoreOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.FileserviceAudit.ProtocolAuditObjectStoreOutput, to get an empty s3 audit log object for use with advanced queries involving the Attributes like $b = Get-NcFileserviceEventAudit -Attributes $a.

|Type                                                                 |Required|Position|PipelineInput|
|---------------------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.FileserviceAudit.ProtocolAuditObjectStoreOutput]`|false   |named   |false        |

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
Get-NcFileserviceEventAudit [-Vserver <String>] [<CommonParameters>]
```
```PowerShell
Get-NcFileserviceEventAudit -Template <DataONTAP.C.Types.FileserviceAudit.ProtocolAuditObjectStoreOutput> [<CommonParameters>]
```
```PowerShell
Get-NcFileserviceEventAudit -Query <DataONTAP.C.Types.FileserviceAudit.ProtocolAuditObjectStoreOutput> [-Attributes <DataONTAP.C.Types.FileserviceAudit.ProtocolAuditObjectStoreOutput>] 
```
```PowerShell
[<CommonParameters>]
```
