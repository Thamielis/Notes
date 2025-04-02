Get-ThinkSystemSnapshot
-----------------------

### Synopsis
Returns ThinkSystem storage snapshots.

---

### Description

You can get the list of all storage snapshots, or look for a specific snapshot by name or associated volume.

---

### Related Links
* [Get-ThinkSystemVolume](Get-ThinkSystemVolume)

---

### Examples
> Example 1. Getting All Snapshots

```PowerShell
Get-ThinkSystemSnapshot
This command returns the list of all snapshots.
```
> Example 2. Getting Snapshots of Specific Volume

$vol = Get-ThinkSystemVolume | Select -last 1
Get-ThinkSystemSnapshot -Volume $vol
This example shows how to get snapshots of a specific volume.

Perform the following steps:
1. Run the Get-ThinkSystemVolume cmdlet. Select the last volume in the list. Save the result to the $vol variable.
2. Run the Get-ThinkSystemSnapshot cmdlet. Set the $vol variable as the Volume parameter value.

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
Get-ThinkSystemSnapshot [-Name <String[]>] [-Volume <CSanVolume[]>] [<CommonParameters>]
```
