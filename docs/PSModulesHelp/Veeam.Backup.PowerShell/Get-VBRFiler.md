Get-VBRFiler
------------

### Synopsis
Returns enterprise NAS systems added as file shares to the inventory.

---

### Description

This cmdlet returns an array of enterprise NAS systems added to the inventory.

---

### Examples
> Example 1. Getting All Enterprise NAS Systems Added to Veeam Backup & Replication Infrastructure

```PowerShell
Get-VBRFiler

Server               : Veeam.Backup.Core.Common.CHost
AccessCredentials    :
Name                 : pdc-ontap97-1
EnableSnapDiff       : False
Id                   : 7f149320-59c5-49f3-9133-0c5ac04c245d
CacheRepository      : Veeam.Backup.Core.CBackupRepository
BackupIOControlLevel : Medium

Server               : Veeam.Backup.Core.Common.CHost
AccessCredentials    : administrator
Name                 : at-7mode-02
EnableSnapDiff       : False
Id                   : f804cc0c-e959-46c4-8515-47925ab5b77d
CacheRepository      : Veeam.Backup.Core.CBackupRepository
BackupIOControlLevel : Medium
This example shows how to get all enterprise NAS systems added to the backup infrastructure. The cmdlet output will contain the following details on enterprise NAS systems: Server, AccessCredentials, Name, EnableSnapDiff, Id, CacheRepository, BackupIOControlLevel.
```
> Example 2. Getting Enterprise NAS System by Name

```PowerShell
Get-VBRFiler -Name "ontap-2"

Server               : Veeam.Backup.Core.Common.CHost
AccessCredentials    :
Name                 : ontap-2
EnableSnapDiff       : False
Id                   : 7f149320-59c5-49f3-9133-0c5ac04c245d
CacheRepository      : Veeam.Backup.Core.CBackupRepository
BackupIOControlLevel : Medium
This example shows how to get enterprise NAS systems added to the backup infrastructure by specifying their names. The cmdlet output will contain the following details on the enterprise NAS systems: Server, AccessCredentials, Name, EnableSnapDiff, Id, CacheRepository, BackupIOControlLevel.
```
> Example 3. Getting Enterprise NAS System by ID

```PowerShell
Get-VBRFiler -Id "f804cc0c-e959-46c4-8515-47925ab5b77d"

Server               : Veeam.Backup.Core.Common.CHost
AccessCredentials    : administrator
Name                 : at-7mode-02
EnableSnapDiff       : False
Id                   : f804cc0c-e959-46c4-8515-47925ab5b77d
CacheRepository      : Veeam.Backup.Core.CBackupRepository
BackupIOControlLevel : Medium
This example shows how to get enterprise NAS systems added to the backup infrastructure by specifying their IDs. The cmdlet output will contain the following details on the enterprise NAS systems: Server, AccessCredentials, Name, EnableSnapDiff, Id, CacheRepository, BackupIOControlLevel.
```

---

### Parameters
#### **Id**
Specifies an array of IDs of enterprise NAS systems. The cmdlet will return an array of the NAS filers with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of names of enterprise NAS systems. The cmdlet will return an array of the enterprise NAS systems with the specified name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRFiler -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRFiler -Name <String[]> [<CommonParameters>]
```
