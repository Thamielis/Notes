Copy-NcConfigBackup
-------------------

### Synopsis
Copy a configuration backup.

---

### Description

Copy a configuration backup. A job will be queued to copy the configuration backup. A job will be spawned to operate on the config-backup. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Rename-NcConfigBackup](Rename-NcConfigBackup)

* [Remove-NcConfigBackup](Remove-NcConfigBackup)

---

### Examples
> Example 1

```PowerShell
Copy-NcConfigBackup -Node fas3070cluster01-01 -Name  fas3070cluster01.weekly.2012-05-27.00_15_00.7z -NewNode fas3070cluster01-02
Copy the config backup on node fas3070cluster01-01 to node fas3070cluster01-02.
```

---

### Parameters
#### **Node**
The source node to copy the configuration backup from. This is the node that has the backup file on its root volume.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|FromNode|

#### **Name**
The name of the configuration backup.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |2       |true (ByPropertyName)|BackupName|

#### **NewNode**
The destination node to copy the configuration backup to.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |3       |true (ByPropertyName)|ToNode |

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
* DataONTAP.C.Types.Job.JobInfo

---

### Notes
Category: config-backup
API: config-backup-copy
Family: cluster

---

### Syntax
```PowerShell
Copy-NcConfigBackup [-Node] <String> [[-Name] <String>] [-NewNode] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
