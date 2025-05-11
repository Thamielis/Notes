Get-HP4Snapshot
---------------

### Synopsis
Returns HPE StoreVirtual storage snapshots.

---

### Description

This cmdlet returns existing HPE StoreVirtual storage snapshots.
You can get all storage snapshots, or look for a specific snapshot by name or associated volume.

Alias Get-VBRHPSnapshot

---

### Examples
> Example 1

```PowerShell
Get-HP4Snapshot -Name "HPE Volume 01 Snapshot"
This command returns the HPE StoreVirtual storage snapshot by name.
```
> Example 2

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
$volume = Get-HP4Volume -Storage $storage -Name "HPE Volume 01"
Get-HP4Snapshot -Volume $volume
This example shows how to get all snapshots of the HPE StoreVirtual storage volume.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Volume cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value. Save the result to the $volume variable.
3. Run the Get-HP4Snapshot cmdlet. Set the $volume variable as the Volume parameter value.
> Example 3

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
$volume = Get-HP4Volume -Storage $storage -Name "HPE Volume 01"
Get-HP4Snapshot -Volume $volume -Name "HPE Volume 01 Snapshot"
This example shows how to get a specific snapshot of the HPE StoreVirtual storage volume.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Volume cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value. Save the result to the $volume variable.
3. Run the Get-HP4Snapshot cmdlet. Set the $volume variable as the Volume parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the array of snapshot names.
The cmdlet will return snapshots with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Volume**
Specifies the array of storage volumes.
The cmdlet will return snapshots of these volumes.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CSanVolume[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanVolume[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-HP4Snapshot [-Name <String[]>] [-Volume <CSanVolume[]>] [<CommonParameters>]
```
