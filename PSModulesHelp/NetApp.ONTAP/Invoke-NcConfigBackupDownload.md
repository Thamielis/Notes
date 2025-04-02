Invoke-NcConfigBackupDownload
-----------------------------

### Synopsis
Download a configuration backup from a URL.

---

### Description

Download a configuration backup from a URL.

---

### Related Links
* [Invoke-NcConfigBackupUpload](Invoke-NcConfigBackupUpload)

---

### Examples
> Example 1

---

### Parameters
#### **Node**
The node to own the configuration backup. The backup file will be downloaded to the root volume of this node.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Url**
The source URL. URL is specified following the syntax described in RFC 3986. Only 'ftp', 'http' and 'https' protocols are supported.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|true    |2       |true (ByPropertyName)|SourceUrl|

#### **Name**
The name of the configuration backup. It must be a valid file name. An extension of .tgz will be added if the given backup-name doesn't have that extension. If backup-name is not provided, software will generate a name for configuration backup.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|false   |3       |true (ByPropertyName)|BackupName|

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
* 

---

### Notes
Category: config-backup
API: config-backup-download
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcConfigBackupDownload [-Node] <String> [-Url] <String> [[-Name] <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
