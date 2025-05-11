New-NcApplicationSnapshot
-------------------------

### Synopsis
Creates New Application Snapshot

---

### Description

Creates New Application Snapshot.This cmdlet is supported with Rest Only.

---

### Related Links
* [Get-NcApplicationSnapshot](Get-NcApplicationSnapshot)

* [Remove-NcApplicationSnapshot](Remove-NcApplicationSnapshot)

---

### Examples
> Example 1

```PowerShell
New-NcApplicationSnapshot -Application app123 -Name abc1
Create new Snapshot application

Application     : app123
Name            : abc1
Comment         :
Components      : {component1}
ConsistencyType : crash
CreateTime      : 2022-10-14T04:07:38-04:00
NcController    : 10.234.41.157
IsPartial       : False
Svm             : vs1
Uuid            : 448904ba-4b97-11ed-9911-005056a7e09a

```

---

### Parameters
#### **Application**
Name of Application

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |0       |true (ByPropertyName)|

#### **Name**
Name of the Application Snapshot

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |1       |true (ByPropertyName)|SnapshotCopyName|

#### **ConsistencyType**
Consistency type. This is for categorization purposes only A Snapshot copy should not be set to 'application consistent unless the host application is quiesced for the Snapshot copy

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
New-NcApplicationSnapshot [-Application] <String> [[-Name] <String>] [[-ConsistencyType] <String>] [-Comment <String>] [<CommonParameters>]
```
