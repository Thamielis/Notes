Start-VBRRepositoryExtentBackupEvacuation
-----------------------------------------

### Synopsis
Evacuates backups from a scale-out backup repository extent.

---

### Description

This cmdlet evacuates backups from a scale-out backup repository extent. When you evacuate backups, Veeam moves them to other extents according to the configured policy.

---

### Examples
> Evacuating Backups from Extents

```PowerShell
Start-VBRRepositoryExtentBackupEvacuation -Extent "Backup Repository 1", "Backup Repository 2", "Backup Repository 3"
This command evacuates backups from the Backup Repository 1, Backup Repository 2, Backup Repository 3 extents.
```

---

### Parameters
#### **Extent**
Specifies the array of scale-out repository extents. The cmdlets will evacuate backups from these extents.
Accepts extents with different policies and of different scale-out repositories.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRRepositoryExtent[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRRepositoryExtent[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRRepositoryExtentBackupEvacuation -Extent <VBRRepositoryExtent[]> [-RunAsync] [<CommonParameters>]
```
