Add-HP4Snapshot
---------------

### Synopsis
Creates HPE StoreVirtual storage snapshots.

---

### Description

This cmdlet creates a snapshot of a selected HPE StoreVirtual storage volume.

Alias Add-VBRHPSnapshot

---

### Examples
> Example 1

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
$volume = Get-HP4Volume -Storage $storage -Name "HPE Volume 01"
Add-HP4Snapshot -Volume $volume -Name "HPE Volume 01 Snapshot"
This example shows how to create a snapshot of a volume.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Volume cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value. Save the result to the $volume variable.
3. Run the Add-HP4Snapshot cmdlet. Set the $volume variable as the Volume parameter value. Specify the Name parameter value.

---

### Parameters
#### **ApplicationManagedShapshot**
Defines if the VM on the target volume should be quiesced to bring VM data to a consistent state.
If omitted, Veeam Backup & Replication will create a point-in-time snapshot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Add-HP4Snapshot [-ApplicationManagedShapshot] [-Description <String>] [-Name <String>] -Volume <CSanVolume> [<CommonParameters>]
```
