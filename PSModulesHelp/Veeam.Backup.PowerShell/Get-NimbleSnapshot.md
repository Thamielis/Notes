Get-NimbleSnapshot
------------------

### Synopsis
Returns HPE Nimble storage snapshots.

---

### Description

This cmdlet returns HPE Nimble storage snapshots.
You can get the list of all storage snapshots or look for a specific snapshot by name or associated volume.

---

### Examples
> Example 1

```PowerShell
Get-NimbleSnapshot -Name "DailySnapshot01"
This command returns an existing HPE Nimble storage snapshot by name.
```
> Example 2

$storage = Get-NimbleHost -Name "HPE Nimble-FC"
$volume1 = Get-NimbleVolume -Host $storage -Name "VOL01"
$volume2 = Get-NimbleVolume -Host $storage -Name "VOL02"
Get-NimbleSnapshot -Volume $volume1, $volume2
This example shows how to get the existing snapshots of several HPE Nimble storage volumes.

Perform the following steps:
1. Run the Get-NimbleHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-NimbleVolume cmdlet. Set the $storage variable as the Host parameter value. Specify the Name parameter value. Save each volume to a separate variable: $volume1, $volume2, etc.
3. Run the Get-NimbleSnapshot cmdlet. Set the $volume1 and $volume2 variables as the Volume parameter values.

---

### Parameters
#### **Name**
Specifies the array of snapshot names.
The cmdlet will return the snapshots with these names.

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
Get-NimbleSnapshot [-Name <String[]>] [-Volume <CSanVolume[]>] [<CommonParameters>]
```
