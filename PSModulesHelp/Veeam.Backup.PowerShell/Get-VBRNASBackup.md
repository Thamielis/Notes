Get-VBRNASBackup
----------------

### Synopsis
Returns backup files created by the file backup job.

---

### Description

This cmdlet returns backup files created by the file backup job.

---

### Examples
> Example 1. Getting All Backup Files

```PowerShell
Get-VBRNASBackup
Id                           : 86f24760-ea7e-475a-88ab-1b328e3694f4
Name                         : Reports backup
JobId                        : d9fa21cf-4917-48b8-ad81-53a997923c5f
CreationTime                 : 8/26/2019 8:11:50 AM
LastRestorePointCreationTime : 8/26/2019 8:26:19 AM
IsEncrypted                  : False

Id                           : e5559d89-ca63-48dc-a53b-d9c54b7f2482
Name                         : Transaction backups
JobId                        : d4d289aa-eff8-4983-a5e3-5fd2c7ff7500
CreationTime                 : 8/26/2019 8:29:05 AM
LastRestorePointCreationTime : 8/26/2019 8:29:12 AM
IsEncrypted                  : False
This command gets all backup files that are created by the file backup jobs. The cmdlet output will contain details of these backup files.
```
> Example 2. Getting Backup Files by Name

```PowerShell
Get-VBRNASBackup -Name "Reports backup"
Id                           : 86f24760-ea7e-475a-88ab-1b328e3694f4
Name                         : Reports backup
JobId                        : d9fa21cf-4917-48b8-ad81-53a997923c5f
CreationTime                 : 8/26/2019 8:11:50 AM
LastRestorePointCreationTime : 8/26/2019 8:26:19 AM
IsEncrypted                  : False
This command gets backup files that are created by the Reports backup file backup job. The cmdlet output will contain settings of the backup file created by the Reports backup file backup job.
```
> Example 3. Getting Backup Files by ID

```PowerShell
Get-VBRNASBackup -ID e5559d89-ca63-48dc-a53b-d9c54b7f2482
Id                           : e5559d89-ca63-48dc-a53b-d9c54b7f2482
Name                         : Transaction backups
JobId                        : d4d289aa-eff8-4983-a5e3-5fd2c7ff7500
CreationTime                 : 8/26/2019 8:29:05 AM
LastRestorePointCreationTime : 8/26/2019 8:29:12 AM
IsEncrypted                  : False
This command gets backup files that are created by the e5559d89-ca63-48dc-a53b-d9c54b7f2482 file backup job. The cmdlet output will contain contain settings of the backup file crated by the e5559d89-ca63-48dc-a53b-d9c54b7f2482 file backup job.
```

---

### Parameters
#### **Id**
Specifies an array of the file backup IDs.  The cmdlet will return an array of backup files that are created by this file backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies a name of the file backup job.  The cmdlet will return an array of backup files that are created by this file backup job.

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
Get-VBRNASBackup -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRNASBackup -Name <String[]> [<CommonParameters>]
```
