Rename-NcConfigBackup
---------------------

### Synopsis
Rename a configuration backup.

---

### Description

Rename a configuration backup. Renamed backups stay on the same node.

---

### Related Links
* [Remove-NcConfigBackup](Remove-NcConfigBackup)

* [New-NcConfigBackup](New-NcConfigBackup)

* [Copy-NcConfigBackup](Copy-NcConfigBackup)

* [Get-NcConfigBackup](Get-NcConfigBackup)

---

### Examples
> Example 1

Rename-NcConfigBackup -Node fas3070cluster01-01 -Name testbackup.7z -NewName backup.7z
Rename the config backup testbackup.7z to backup.7z on node fas3070cluster01-01.

Created      Node                     BackupName                                             BackupSize   BackupType
-------      ----                     ----------                                             ----------   ----------
6/7/2012     fas3070cluster01-01      backup.7z                                              11.0 MB      node

---

### Parameters
#### **Node**
The node that owns the configuration backup. This is the node that has the backup file on its root volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Name**
The name of the configuration backup.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |2       |true (ByPropertyName)|BackupName|

#### **NewName**
The new name for the configuration backup. It must be a valid file name. An extension of .tgz will be added if the given new-name doesn't have that extension.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |3       |true (ByPropertyName)|NewBackupName|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ConfigBackup.ConfigBackupInfoType

---

### Notes
Category: config-backup
API: config-backup-rename
Family: cluster

---

### Syntax
```PowerShell
Rename-NcConfigBackup [-Node] <String> [[-Name] <String>] [[-NewName] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
