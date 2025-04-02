Get-NcConfigBackup
------------------

### Synopsis
Return a list of configuration backups in the cluster.

---

### Description

Return a list of configuration backups in the cluster.

---

### Related Links
* [Copy-NcConfigBackup](Copy-NcConfigBackup)

* [Remove-NcConfigBackup](Remove-NcConfigBackup)

* [Rename-NcConfigBackup](Rename-NcConfigBackup)

---

### Examples
> Example 1

Get-NcConfigBackup -Node fas3070cluster01-01
Get the config backups owned by the node fas3070cluster01-01.

Created      Node                     BackupName                                             BackupSize   BackupType
-------      ----                     ----------                                             ----------   ----------
5/27/2012    fas3070cluster01-01      fas3070cluster01.weekly.2012-05-27.00_15_00.7z         12.3 MB      cluster
6/3/2012     fas3070cluster01-01      fas3070cluster01.weekly.2012-06-03.00_15_00.7z         13.4 MB      cluster
6/6/2012     fas3070cluster01-01      fas3070cluster01.daily.2012-06-06.00_10_00.7z          10.6 MB      cluster
6/7/2012     fas3070cluster01-01      fas3070cluster01.daily.2012-06-07.00_10_02.7z          10.9 MB      cluster
6/7/2012     fas3070cluster01-01      fas3070cluster01.8hour.2012-06-07.02_15_06.7z          11.0 MB      cluster
6/7/2012     fas3070cluster01-01      fas3070cluster01.8hour.2012-06-07.10_15_00.7z          11.1 MB      cluster

> Example 2

$q = Get-NcConfigBackup -Template
$epoch = New-Object DateTime @(1970,1,1)
$low = ((New-Object DateTime @(2012,6,6)) - $epoch).TotalSeconds
$high = ((New-Object DateTime @(2012,6,8)) - $epoch).TotalSeconds
$q.Node = "fas3070cluster01-01"
$q.BackupCreationTime = "$low..$high"
Get-NcConfigBackup -Query $q
Get all of the config backups on node fas3070cluster01-01 created between June 6th, 2012 and June 8th, 2012.

Created      Node                     BackupName                                             BackupSize   BackupType
-------      ----                     ----------                                             ----------   ----------
6/6/2012     fas3070cluster01-01      fas3070cluster01.daily.2012-06-06.00_10_00.7z          10.6 MB      cluster
6/7/2012     fas3070cluster01-01      fas3070cluster01.daily.2012-06-07.00_10_02.7z          10.9 MB      cluster
6/7/2012     fas3070cluster01-01      fas3070cluster01.8hour.2012-06-07.02_15_06.7z          11.0 MB      cluster
6/7/2012     fas3070cluster01-01      fas3070cluster01.8hour.2012-06-07.10_15_00.7z          11.1 MB      cluster

---

### Parameters
#### **Node**
One or more nodes that own configuration backups.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Name**
The name of one or more configuration backup.   Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |2       |true (ByPropertyName)|BackupName|

#### **Attributes**
For improved scalability in large clusters, provide a ConfigBackupInfoType object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcConfigBackup -Template" to get the initially empty ConfigBackupInfoType object.  If not specified, all data is returned for each object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[ConfigBackupInfoType]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty ConfigBackupInfoType object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ConfigBackupInfoType object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcConfigBackup -Template" to get the initially empty ConfigBackupInfoType object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[ConfigBackupInfoType]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ConfigBackup.ConfigBackupInfoType

---

### Notes
Category: config-backup
API: config-backup-info-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcConfigBackup [[-Node] <String[]>] [[-Name] <String[]>] [-Attributes <ConfigBackupInfoType>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcConfigBackup -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcConfigBackup -Query <ConfigBackupInfoType> [-Attributes <ConfigBackupInfoType>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
