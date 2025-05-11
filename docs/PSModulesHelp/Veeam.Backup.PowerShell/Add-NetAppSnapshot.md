Add-NetAppSnapshot
------------------

### Synopsis
Creates NetApp storage snapshots.

---

### Description

This cmdlet creates a snapshot of a selected NetApp storage volume.

---

### Examples
> Example 1

$apphost = Get-NetAppHost -Name "NetApp Store"
Get-NetAppVolume -Host $apphost -Name "Vol 01" | Add-NetAppSnapshot -Name "vol_SS_01"
This example shows how to create a snapshot of the Vol 01 volume.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $apphost variable.
2. Run the Get-NetAppVolume cmdlet. Set the $apphost variable as the Host parameter value. Specify the Name parameter value.
3. Pipe the cmdlet output to the Add-NetAppSnapshot cmdlet. Specify the Name parameter value.

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
Add-NetAppSnapshot [-Name <String>] -Volume <CSanVolume> [<CommonParameters>]
```
