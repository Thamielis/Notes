Publish-StoragePluginArchivedSnapshot
-------------------------------------

### Synopsis
Retrieves and restores an archived snapshot.

---

### Description

This cmdlet retrieves an archived snapshot and restores it to the storage system.

---

### Examples
> Example 1

$snapshot = Get-StoragePluginArchivedSnapshot -Name pdcqastg11:-pure14-AAB97A18587ghudDaPRSF-t5kbsdr1E
Publish-StoragePluginArchivedSnapshot -Snapshot $snapshot
This example shows how to retrieve and restore the archived snapshot that has the pdcqastg11:-pure14-AAB97A18587ghudDaPRSF-t5kbsdr1E name.
Perform the following steps:
1. Run the Get-StoragePluginArchivedSnapshot cmdlet. Specify the Name parameter value. Save the result to the $snapshot variable.
2. Run the Publish-StoragePluginArchivedSnapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

---

### Parameters
#### **Force**
Defines that the cmdlet will retrieve and restore this archived snapshot without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Snapshot**
Specifies the archived snapshot. The cmdlet will retrieve this archived snapshot and restore it to the storage system.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRStoragePluginArchivedSnapshot]`|true    |named   |False        |

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
Publish-StoragePluginArchivedSnapshot [-Force] -Snapshot <VBRStoragePluginArchivedSnapshot> [<CommonParameters>]
```
