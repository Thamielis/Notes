Get-VNXVolume
-------------

### Synopsis
Returns Dell VNX volumes added to the backup infrastructure.

---

### Description

This cmdlet returns Dell VNX volumes added to the backup infrastructure.

Tip: Run the Get-VNXInfrastructureVolume cmdlet to get an array of volumes from Dell VNX storage systems.

---

### Examples
> Example 1

$storage = Get-VNXHost -Name "VNX Storage"
Get-VNXVolume -Name "VOLUME1" -Host $storage
This example shows how to get a Dell VNX volume added to the backup infrastructure.
Perform the following steps:
1. Run Get-VNXHost to get the storage system. Save the result to the $storage variable.
2. Run Get-VNXVolume with the $storage variable.

---

### Parameters
#### **Host**
Specifies the array of storages.
The cmdlet will return the volumes of these storages.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CVnxHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of volumes names.
The cmdlet will return the volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Vnx.CVnxHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VNXVolume [-Host <CVnxHost[]>] [-Name <String[]>] [<CommonParameters>]
```
