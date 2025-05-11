Add-HP3Snapshot
---------------

### Synopsis
Creates HPE 3PAR StoreServ storage snapshots.

---

### Description

This cmdlet creates a snapshot of a selected HPE 3PAR StoreServ storage volume.

---

### Examples
> Example 1

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServe Storage"
$volume = Get-HP3Volume -Storage $storage
Add-HP3Snapshot -Volume $volume -Name "vol_SS_01" -Description "Vol 01 snapshot"
This example shows how to create a snapshot of a selected volume.
Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save it to the $storage variable.
2. Run the Get-HP3Volume cmdlet. Set the $storage variable as the Storage parameter value. Save the volume to the $volume variable.
3. Run the Add-HP3Snapshot cmdlet. Set the $volume variable as the Volume parameter value. Specify the Name parameter value. Specify the Description parameter value.

---

### Parameters
#### **Description**
Specifies the description of the snapshot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Add-HP3Snapshot [-Description <String>] [-Name <String>] -Volume <CSanVolume> [<CommonParameters>]
```
