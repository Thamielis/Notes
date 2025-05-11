Remove-HP4Snapshot
------------------

### Synopsis
Removes HPE StoreVirtual storage snapshots.

---

### Description

This cmdlet permanently removes a selected HPE StoreVirtual storage snapshot from your virtual infrastructure.

Alias Remove-VBRHPSnapshot

---

### Examples
> Example 1

$snapshot = Get-HP4Snapshot -Name "HPE Volume 01 Snapshot"
Remove-HP4Snapshot -Snapshot $snapshot
This example shows how to remove the HPE StoreVirtual storage snapshot.

Perform the following steps:
1. Run the Get-HP4Snapshot cmdlet. Specify the Name parameter value. Save the result to the $snapshot variable.
2. Run the Remove-HP4Snapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

---

### Parameters
#### **Snapshot**
Specifies the array of snapshots.
The cmdlet will remove these snapshots.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[CSanSnapshot[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanSnapshot[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-HP4Snapshot -Snapshot <CSanSnapshot[]> [<CommonParameters>]
```
