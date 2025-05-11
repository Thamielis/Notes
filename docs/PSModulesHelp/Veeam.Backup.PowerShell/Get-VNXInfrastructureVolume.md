Get-VNXInfrastructureVolume
---------------------------

### Synopsis
Returns volumes of Dell VNX storage systems.

---

### Description

This cmdlet returns an array of volumes of Dell VNX storage systems. The cmdlet will return storage volumes, even if they are not added to your backup infrastructure.

Tip: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Related Links
* [Get-VNXHost](Get-VNXHost)

---

### Examples
> Example 1

```PowerShell
Get-VNXInfrastructureVolume
This command returns all volumes added to Dell VNX storage systems.
```
> Example 2

```PowerShell
Get-VNXInfrastructureVolume -Name "Volume4", "Volume5", "Volume1"
This command returns Dell VNX storage volumes by the volume name.
```
> Example 3

$storage = Get-VNXHost -Name "VNX Storage"
Get-VNXInfrastructureVolume -Host $storage
This example shows how to all volumes added to the specific Dell VNX storage.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-VNXInfrastructureVolume cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage.
The cmdlet will return an array of volumes added to that storage system.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CVnxHost]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names that you want to get.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Vnx.CVnxHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VNXInfrastructureVolume [-Host <CVnxHost>] [-Name <String[]>] [<CommonParameters>]
```
