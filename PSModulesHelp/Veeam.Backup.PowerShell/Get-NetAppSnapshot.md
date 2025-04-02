Get-NetAppSnapshot
------------------

### Synopsis
Returns NetApp storage snapshots.

---

### Description

This cmdlet returns existing NetApp storage snapshots.
You can get the list of all storage snapshots, or look for a specific snapshot by name or associated volume.

---

### Examples
> Example 1

```PowerShell
Get-NetAppSnapshot
This command returns the list of all snapshots.
```
> Example 2

$vol = Get-NetAppVolume | Select -last 1
Get-NetAppSnapshot -Volume $vol
This example shows how to get snapshots of a specific volume.

Perform the following steps:
1. Run the Get-NetAppVolume cmdlet. Select the last volume in the list. Save the result to the $vol variable.
2. Run the Get-NetAppSnapshot cmdlet. Set the $vol variable as the Volume parameter value.

---

### Parameters
#### **Name**
Specifies the array of the snapshot names.
The cmdlet will return the snapshots with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Volume**
Specifies the array of volumes.
The cmdlet will return the snapshots of these volumes.

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
Get-NetAppSnapshot [-Name <String[]>] [-Volume <CSanVolume[]>] [<CommonParameters>]
```
