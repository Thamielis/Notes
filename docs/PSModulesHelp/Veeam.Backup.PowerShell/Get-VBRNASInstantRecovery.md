Get-VBRNASInstantRecovery
-------------------------

### Synopsis
Returns active instant restore sessions started to recover backups created by file share backup jobs.

---

### Description

This cmdlet returns active instant restore sessions started to recover backups created by file share backup jobs.

---

### Examples
> Example 1. Getting All Instant Restore Sessions for NAS Backups

```PowerShell
Get-VBRNASInstantRecovery
This command returns all instant restore sessions for NAS backups.
```
> Example 2. Getting Instant Restore Sessions for NAS Backups by Session IDs

```PowerShell
Get-VBRNASInstantRecovery -Id ("49664A5F-9C55-4A1F-8E6A-1CD5705A684B", "42696B53-6FEC-4148-9354-AA9E4B52DED9")
This command returns instant restore sessions for NAS backups by restore session IDs.
```
> Example 3. Getting Instant Restore Sessions for NAS Backups by Parameters

```PowerShell
Get-VBRNASInstantRecovery -NASBackupName "Daily SMB1 Backup" -NASServerName "ontap-2"
This command returns instant restore sessions for NAS backups with certain parameters.
```
> Example 4. Getting Instant Restore Sessions for NAS Backups by Session Names

```PowerShell
Get-VBRNASInstantRecovery -SessionName ("\\Server\Share", "\\OtherServer\OtherShare")
This command returns instant restore sessions for NAS backups with certain parameters.
```

---

### Parameters
#### **All**
Defines that the cmdlet will return all active instant restore sessions started to recover backups created by file share backup jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Id**
Specifies the array of instant restore session IDs. The cmdlet will return the instant restore sessions with these IDs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName)|

#### **NASBackupName**
Specifies a name of the file share backup for which the instant restore session was started. The cmdlet will return the instant restore session started to recover backups created by the file share backup job with this name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **NASServerName**
Specifies a name of the host with the repository and mount service where the SMB share is published. The cmdlet will return the instant restore session using this host.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **SessionName**
Specifies the array of instant restore session names.  The cmdlet will return active instant restore sessions with these names.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

System.String

System.String[]

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRNASInstantRecovery[]

---

### Notes

---

### Syntax
```PowerShell
Get-VBRNASInstantRecovery [-All] [<CommonParameters>]
```
```PowerShell
Get-VBRNASInstantRecovery -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASInstantRecovery -NASBackupName <String> -NASServerName <String> [<CommonParameters>]
```
```PowerShell
Get-VBRNASInstantRecovery -SessionName <String[]> [<CommonParameters>]
```
