Get-VBRSOBRObjectStorageRestorePoint
------------------------------------

### Synopsis
Returns restore points stored in archive extents and capacity extents of a scale-out backup repository.

---

### Description

This cmdlet returns restore points of machines stored in archive extents and capacity extents of a scale-out backup repository.
You can use the restore points you get with this cmdlet only in the removal operations. Run the Remove-VBRRestorePoint cmdlet to delete restore points from archive extents and capacity extents of scale-out backup repositories.

---

### Related Links
* [Get-VBRSOBRObjectStorageBackup](Get-VBRSOBRObjectStorageBackup)

---

### Examples
> Example 1. Getting all Restore Points from Archive and Capacity Extents

```PowerShell
Get-VBRSOBRObjectStorageRestorePoint
This command returns all restore points stored on archive and capacity extents of a scale-out backup repository.
```
> Example 2. Getting Restore Points of Certain Machines from Archive Extent

$backup = Get-VBRSOBRObjectStorageBackup -Name "DailyBackup".
Get-VBRSOBRObjectStorageRestorePoint -Backup $backup -Name "LinServ2049", "WinServ2049" -ArchiveTier
This example shows how to get restore points of the LinServ2049 and WinServ2049 machines with the following settings:
- Restore points are created by the DailyBackup job.
- Restore points are stored in archive extents of a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRSOBRObjectStorageBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRSOBRObjectStorageRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter value.
> Example 3. Getting Restore Points with Certain IDs

```PowerShell
Get-VBRSOBRObjectStorageRestorePoint -Id "c2befce4-c7f4-4a53-a08b-e37580a682e7", "9577ab06-8ca5-4a5a-bd5c-d6124b0a4058"
This command returns the c2befce4-c7f4-4a53-a08b-e37580a682e7 and 9577ab06-8ca5-4a5a-bd5c-d6124b0a4058 restore points. The cmdlet will get these restore points from capacity tier extents of a scale-out backup repository.
```

---

### Parameters
#### **ArchiveTier**
Defines that the cmdlet will return restore points of machines stored in archive extents.
Note: You do not need to provide this parameter if you specify the IDs of backed-up machines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Backup**
Specifies an array of backups stored in archive extents or capacity extents. The cmdlet will return restore points of these backups.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBRSOBRObjectStorageBackup]`|true    |named   |True (ByValue)|

#### **CapacityTier**
Defines that the cmdlet will return restore points of machines stored on capacity extents.
Note: You do not need to provide this parameter if you specify the IDs of backed-up machines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Id**
Specifies an array of IDs of backed-up machines. The cmdlet will return restore points of these machines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of names for machines. The cmdlet will return restore points of these machines.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSOBRObjectStorageBackup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRSOBRObjectStorageRestorePoint [-ArchiveTier] [-CapacityTier] [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRSOBRObjectStorageRestorePoint -Backup <VBRSOBRObjectStorageBackup> [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRSOBRObjectStorageRestorePoint -Id <Guid[]> [<CommonParameters>]
```
