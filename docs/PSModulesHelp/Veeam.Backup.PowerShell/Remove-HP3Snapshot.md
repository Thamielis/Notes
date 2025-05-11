Remove-HP3Snapshot
------------------

### Synopsis
Removes HPE 3PAR StoreServ storage snapshots.

---

### Description

This cmdlet permanently removes a selected HPE 3PAR StoreServ storage snapshot from your virtual infrastructure.

---

### Examples
> Example 1

$snapshot = Get-HP3Snapshot -Name "vol1_SS_1"
Remove-HP3Snapshot -Snapshot $snapshot
This example shows how to remove the HPE 3PAR StoreServ storage snapshot.

Perform the following steps:
1. Run the Get-HP3Snapshot cmdlet. Specify the Name parameter value. Save the result to the $snapshot variable.
2. Run the Remove-HP3Snapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.
> Example 2

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServ"
$volume1 = Get-HP3Volume -Host $storage -Name "VOL01"
$volume2 = Get-HP3Volume -Host $storage -Name "VOL02"
$snapshot = Get-HP3Snapshot -Volume $volume1, $volume2
Remove-HP3Snapshot -Snapshot $snapshot
This example shows how to remove snapshots of several HPE 3PAR StoreServ storage volumes.

Perform the following steps:
1. Get the volume snapshots you want to remove:
- Run the Get-HP3Snapshot cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
- Run the Get-HP3Volume cmdlet. Set the $storage variable as the Host parameter value. Save each volume to a separate variable: $volume1, $volume2, etc.
- Run the Get-HP3Snapshot cmdlet. Set the $volume1 and $volume2 variables as the Volume parameter values. Save the result to the $snapshot variable.
2. Run the Remove-HP3Snapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

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
Remove-HP3Snapshot -Snapshot <CSanSnapshot[]> [<CommonParameters>]
```
