Get-NcApplicationSnapshot
-------------------------

### Synopsis
Retrieves application Snapshot Details. This cmdlet is supported with Rest Only.

---

### Description

Retrieves application Snapshot Details.

---

### Related Links
* [New-NcApplicationSnapshot](New-NcApplicationSnapshot)

* [Remove-NcApplicationSnapshot](Remove-NcApplicationSnapshot)

---

### Examples
> Example 1

```PowerShell
Get-NcApplicationSnapshot -Application app123
Application     : app123
Name            : app
ConsistencyType : crash
Comment         : a
Components      : {component1}
CreateTime      : 2022-10-13T14:35:10-04:00
NcController    : 10.234.41.157
IsPartial       : False
Svm             : vs1
Uuid            : c5028723-4b25-11ed-9911-005056a7e09a

```

---

### Parameters
#### **Application**
Name of the Application

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |true         |

#### **Name**
Name of the Snapshot Copy

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[String]`|false   |1       |false        |SnapshotCopyName|

#### **Vserver**
The Vserver for the application

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |false        |SVM    |

#### **ConsistencyType**
Consistency type. This is for categorization purposes only A Snapshot copy should not be set to 'application consistent unless the host application is quiesced for the Snapshot copy

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |named   |false        |

#### **Template**
Specify $a = Get-NcApplicationSnapshot -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcApplicationSnapshot -Query $a.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify $a = Get-NcApplicationSnapshot -Template, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcApplicationSnapshot -Query $a.

|Type                                                       |Required|Position|PipelineInput|
|-----------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.ApplicationSnapshotOutput]`|true    |named   |false        |

#### **Attributes**
Specify $a = New-Object DataONTAP.C.Types.Application.ApplicationSnapshotOutput, to get an empty object for use with advanced queries involving the Attributes like $b = Get-NcApplicationSnapshot -Attributes $a.

|Type                                                       |Required|Position|PipelineInput|
|-----------------------------------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Application.ApplicationSnapshotOutput]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Application.ApplicationSnapshotOutput

---

### Notes
Category: Application
Api: /api/application/applications/{application.uuid}/snapshots
Family: NcController

---

### Syntax
```PowerShell
Get-NcApplicationSnapshot [-Application] <String> [[-Name] <String>] [[-Vserver] <String>] [[-ConsistencyType] <String>] [<CommonParameters>]
```
```PowerShell
Get-NcApplicationSnapshot -Template <DataONTAP.C.Types.Application.ApplicationSnapshotOutput> [<CommonParameters>]
```
```PowerShell
Get-NcApplicationSnapshot -Query <DataONTAP.C.Types.Application.ApplicationSnapshotOutput> [-Attributes <DataONTAP.C.Types.Application.ApplicationSnapshotOutput>] [<CommonParameters>]
```
