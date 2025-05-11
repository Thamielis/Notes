New-NcConfigBackup
------------------

### Synopsis
Create a configuration backup.

---

### Description

Create a configuration backup. A job will be queued to create the configuration backup in the background. Creation of configuration backup may take several minutes.  The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcConfigBackup](Get-NcConfigBackup)

* [Remove-NcConfigBackup](Remove-NcConfigBackup)

* [Rename-NcConfigBackup](Rename-NcConfigBackup)

---

### Examples
> Example 1

```PowerShell
New-NcConfigBackup -Node fas3070cluster01-01 -Name testbackup -Type node
Create a new config backup of node fas3070cluster01-01.
```

---

### Parameters
#### **Node**
The node to own the configuration backup. This is the node that will have the backup file on its root volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Name**
The name of the configuration backup. It must be a valid file name. An extension of .tgz will be added if the given backup-name doesn't have that extension. If backup-name is not provided, software will generate the name for configuration backup.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |2       |true (ByPropertyName)|BackupName|

#### **Type**
Indicates if the backup is a node or a cluster backup. A node backup contains only node-specific configuration of a particular node in the cluster. A cluster backup contains cluster-wide replicas in addition to node backup of each node in the cluster. Possible values:
"node"      - Node Backup
"cluster"   - Cluster Backup
 This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |named   |true (ByPropertyName)|BackupType|

#### **NodeUuid**
Uuid of node that owns the configuration backup. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: config-backup
API: config-backup-create
Family: cluster

---

### Syntax
```PowerShell
New-NcConfigBackup [-Node] <String> [[-Name] <String>] [-Type <String>] [-NodeUuid <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
