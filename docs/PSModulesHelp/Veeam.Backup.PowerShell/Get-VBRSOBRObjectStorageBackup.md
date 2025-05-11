Get-VBRSOBRObjectStorageBackup
------------------------------

### Synopsis
Returns backups available in archive extents and capacity extents of scale-out backup repositories.

---

### Description

This cmdlet returns backups stored in archive extents and capacity extents of scale-out backup repositories.
You can use the backups you get with this cmdlet only in the removal operations. Run the Remove-VBRBackup cmdlet and provide the FromDisk parameter to delete backups from archive extents and capacity extents of scale-out backup repositories.

---

### Examples
> Example 1. Getting all Backups from Archive and Capacity Extents

```PowerShell
Get-VBRSOBRObjectStorageBackup
This command returns all backups stored on archive and capacity extents of scale-out backup repositories.
```
> Example 2. Getting all Backups from Capacity Extents

```PowerShell
Get-VBRSOBRObjectStorageBackup -CapacityTier
This command returns all backups stored on capacity extents of scale-out backup repositories.
```
> Example 3. Getting all Backups from Archive Extents

```PowerShell
Get-VBRSOBRObjectStorageBackup -ArchiveTier
This command returns all backups stored on archive extents of scale-out backup repositories.
```

---

### Parameters
#### **ArchiveTier**
Defines that the cmdlet will return backups stored in archive extents of the scale-out backup repository.
Note: You do not need to provide this parameter if you specify the IDs of backed-up machines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **CapacityTier**
Defines that the cmdlet will return backups stored on capacity extents of the scale-out backup repository.
Note: You do not need to provide this parameter if you specify the IDs of backed-up machines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Id**
Specifies an array of backup IDs. The cmdlet will return backups with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of the job names. The cmdlet will return backups produced with these jobs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRSOBRObjectStorageBackup [-ArchiveTier] [-CapacityTier] [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRSOBRObjectStorageBackup -Id <Guid[]> [<CommonParameters>]
```
