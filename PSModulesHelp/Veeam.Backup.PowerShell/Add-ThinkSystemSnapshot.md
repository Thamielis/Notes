Add-ThinkSystemSnapshot
-----------------------

### Synopsis
Creates ThinkSystem storage snapshots.

---

### Description

This cmdlet creates a snapshot of a selected ThinkSystem storage volume.

---

### Related Links
* [Add-ThinkSystemHost](Add-ThinkSystemHost)

* [Get-ThinkSystemVolume](Get-ThinkSystemVolume)

---

### Examples
> Creating Snapshot

$apphost = Get-ThinkSystemHost -Name "ThinkSystem Store"
$volume = Get-ThinkSystemVolume -Host $apphost -Name "Vol 01"
Add-ThinkSystemSnapshot -Volume $volume -Name "vol_SS_01"
This example shows how to create a snapshot of a volume.
Perform the following steps:
1. Run the Add-ThinkSystemHost cmdlet.
Specify the Name parameter value.
Save the result to the $apphost variable.
2. Run the Get-ThinkSystemVolume cmdlet.
Specify the Name and Host parameter values.
Save the result to the $volume variable.
3. Run the Add-ThinkSystemSnapshot cmdlet.
Set the $volume variable as the Volume parameter value.
Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the name you want to assign to the snapshot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Volume**
Specifies the storage volume for which you want to take snapshot.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CSanVolume]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanVolume

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-ThinkSystemSnapshot [-Name <String>] -Volume <CSanVolume> [<CommonParameters>]
```
