Get-StoragePluginArchivedSnapshot
---------------------------------

### Synopsis
Returns archived snapshots of Universal Storage API integrated systems.

---

### Description

This cmdlet returns archived snapshots of Universal Storage API integrated systems.
If you do not specify any parameter, the cmdlet will return all archived snapshots that Veeam Backup & Replication detected during the latest rescan.

---

### Examples
> Example 1

```PowerShell
Get-StoragePluginArchivedSnapshot -Name pdcqastg11:-pure14-AAB97A18587ghudDaPRSF-t5kbsdr1E
This cmdlet returns the archived snapshot with the pdcqastg11:-pure14-AAB97A18587ghudDaPRSF-t5kbsdr1E name.
```

---

### Parameters
#### **Name**
Specifies an array of names of the archived snapshot that you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Volume**
Specifies an array of storage volumes where you want to search for archived snapshots.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CSanVolume[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanVolume[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-StoragePluginArchivedSnapshot [-Name <String[]>] [-Volume <CSanVolume[]>] [<CommonParameters>]
```
