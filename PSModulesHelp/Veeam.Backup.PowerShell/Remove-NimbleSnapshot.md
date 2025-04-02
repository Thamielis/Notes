Remove-NimbleSnapshot
---------------------

### Synopsis
Removes HPE Nimble storage snapshots.

---

### Description

This cmdlet permanently removes a selected HPE Nimble storage snapshot from your virtual infrastructure.

---

### Examples
> Example 1

$storage = Get-NimbleHost -Name "HPE Nimble-FC"
$volume1 = Get-NimbleVolume -Host $storage -Name "VOL01"
$volume2 = Get-NimbleVolume -Host $storage -Name "VOL02"
$snapshot = Get-NimbleSnapshot -Volume $volume1, $volume2
Remove-NimbleSnapshot -Snapshot $snapshot
This example shows how to remove snapshots of several HPE Nimble storage volumes.

Perform the following steps:
1. Get the volume snapshots you want to remove.
- Run the Get-NimbleHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
- Run the Get-NimbleVolume cmdlet. Set the $storage variable as the Host parameter value. Save each volume to a separate variable: $volume1, $volume2, etc.
- Run the Get-NimbleSnapshot cmdlet. Set the $volume1 and $volume2 variables as the Volume parameter values. Save the result to the $snapshot variable.
2. Run the Remove-NimbleSnapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

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
Remove-NimbleSnapshot -Snapshot <CSanSnapshot[]> [<CommonParameters>]
```
