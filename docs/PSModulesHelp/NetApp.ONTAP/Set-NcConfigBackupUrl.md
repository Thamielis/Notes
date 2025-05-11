Set-NcConfigBackupUrl
---------------------

### Synopsis
Set the destination URL for uploading the configuration backups.

---

### Description

Set the destination URL for uploading the configuration backups. URL is specified following the syntax described in RFC 3986. Only 'ftp', 'http' and 'https' protocols are supported.

---

### Related Links
* [Get-NcConfigBackupUrl](Get-NcConfigBackupUrl)

---

### Examples
> Example 1

```PowerShell
Set-NcConfigBackupUrl -Url http://config-backups-go-here/ -Username user -password p@ssword
Set the destination URL, username and password.
```

---

### Parameters
#### **Url**
The destination URL for uploading the configuration backups. Only 'ftp', 'http' and 'https' protocols are supported.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |1       |true (ByPropertyName)|

#### **ValidateCertificate**
Use this parameter with the value true to validate the digital certificate of the remote server. This parameter is supported with Rest only.

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

#### **Username**
The username for the destination URL.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Password**
Password for the destination URL.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Credential**
Credentials used to authenticate destination URL.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.ConfigBackup.ConfigBackupUrl

---

### Notes
Category: config-backup
API: config-backup-settings-modify, config-backup-settings-password-set
Family: cluster

---

### Syntax
```PowerShell
Set-NcConfigBackupUrl [[-Url] <String>] [-ValidateCertificate <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcConfigBackupUrl [[-Url] <String>] [-Username] <String> [[-Password] <String>] [-ValidateCertificate <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcConfigBackupUrl [[-Url] <String>] -Credential <PSCredential> [-ValidateCertificate <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
