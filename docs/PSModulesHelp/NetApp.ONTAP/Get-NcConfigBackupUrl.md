Get-NcConfigBackupUrl
---------------------

### Synopsis
Get the destination URL for uploading the configuration backups.

---

### Description

Get the destination URL for uploading the configuration backups. URL is specified following the syntax described in RFC 3986. Only 'ftp', 'http' and 'https' protocols are supported.

---

### Related Links
* [Set-NcConfigBackupUrl](Set-NcConfigBackupUrl)

---

### Examples
> Example 1

Get-NcConfigBackupUrl
Get the destination URL for uploading the configuration backups.

Url                                     Username
---                                     --------
ftp://config-backups-go-here/           username

---

### Parameters
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
* DataONTAP.C.Types.ConfigBackup.ConfigBackupUrl

---

### Notes
Category: config-backup
API: config-backup-settings-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcConfigBackupUrl [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
