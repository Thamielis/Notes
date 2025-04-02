Remove-StoragePluginArchivedSnapshot
------------------------------------

### Synopsis
Removes archived snapshots of Universal Storage API integrated systems.

---

### Description

This cmdlet removes archived snapshots of Universal Storage API integrated systems.
TIP: To remove the retrieved version of the archived snapshot, use the Remove-StoragePluginSnapshot cmdlet.

---

### Related Links
* [Get-StoragePluginArchivedSnapshot](Get-StoragePluginArchivedSnapshot)

---

### Examples
> Example 1

$snapshot = Get-StoragePluginArchivedSnapshot -Name pdcqastg11:-pure14-AAB97A18587ghudDaPRSF-t5kbsdr1E
Remove-StoragePluginArchivedSnapshot -Snapshot $snapshot
This example shows how to remove the archived snapshot that has the pdcqastg11:-pure14-AAB97A18587ghudDaPRSF-t5kbsdr1E name.
Perform the following steps:
1. Run the Get-StoragePluginArchivedSnapshot cmdlet. Specify the Name parameter value. Save the result to the $snapshot variable.
2. Run the Remove-StoragePluginArchivedSnapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

---

### Parameters
#### **Snapshot**
Specifies the archived snapshot that you plan to remove.

|Type                                  |Required|Position|PipelineInput                 |
|--------------------------------------|--------|--------|------------------------------|
|`[VBRStoragePluginArchivedSnapshot[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRStoragePluginArchivedSnapshot[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-StoragePluginArchivedSnapshot -Snapshot <VBRStoragePluginArchivedSnapshot[]> [<CommonParameters>]
```
