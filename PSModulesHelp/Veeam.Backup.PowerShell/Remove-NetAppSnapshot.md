Remove-NetAppSnapshot
---------------------

### Synopsis
Removes NetApp storage snapshots.

---

### Description

This cmdlet permanently removes a selected NetApp storage snapshot from your virtual infrastructure.

---

### Examples
> Example 1

$snapshot = Get-NetAppSnapshot -Name "vol1_SS_1"
Remove-NetAppSnapshot -Snapshot $snapshot
This example shows how to remove the NetApp storage snapshot.

Perform the following steps:
1. Run the Get-NetAppSnapshot cmdlet. Specify the Name parameter value. Save the result to the $snapshot variable.
2. Run the Remove-NetAppSnapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

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
Remove-NetAppSnapshot -Snapshot <CSanSnapshot[]> [<CommonParameters>]
```
