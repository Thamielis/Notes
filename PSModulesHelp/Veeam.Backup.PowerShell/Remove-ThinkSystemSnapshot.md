Remove-ThinkSystemSnapshot
--------------------------

### Synopsis
Removes ThinkSystem storage snapshots.

---

### Description

This cmdlet permanently removes a selected ThinkSystem storage snapshot from your virtual infrastructure.

---

### Related Links
* [Get-ThinkSystemSnapshot](Get-ThinkSystemSnapshot)

---

### Examples
> Removing ThinkSystem Storage Snapshot

$snapshot = Get-ThinkSystemSnapshot -Name "vol1_SS_1"
Remove-ThinkSystemSnapshot -Snapshot $snapshot
This example shows how to remove the ThinkSystem storage snapshot.

Perform the following steps:
1. Run the Get-ThinkSystemSnapshot cmdlet. Specify the Name parameter value. Save the result to the $snapshot variable.
2. Run the Remove-ThinkSystemSnapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

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
Remove-ThinkSystemSnapshot -Snapshot <CSanSnapshot[]> [<CommonParameters>]
```
