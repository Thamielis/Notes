Get-NimbleInfrastructureVolume
------------------------------

### Synopsis
Returns volumes of HPE Nimble storage systems.

---

### Description

This cmdlet returns an array of volumes of HPE Nimble storage systems.
The cmdlet will return storage volumes, even if they are not added to your backup infrastructure.

TIP: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Related Links
* [Get-NimbleHost](Get-NimbleHost)

---

### Examples
> Example 1

```PowerShell
Get-NimbleInfrastructureVolume
This command returns all volumes added to an HPE Nimble storage system.
```
> Example 2

```PowerShell
Get-NimbleInfrastructureVolume -Name "Volume4", "Volume5", "Volume1"
This command returns specific HPE Nimble volumes.
```
> Example 3

$storage = Get-NimbleHost -Name "HPE Nimble-FC"
Get-NimbleInfrastructureVolume -Host $storage
This example shows how to get all volumes added to the specific HPE Nimble storage system.

Perform the following steps:
1. Run the Get-NimbleHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-NimbleInfrastructureVolume cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage.
The cmdlet will return an array of volumes added to that storage system.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CNimbleHost]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names that you want to get.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Nimble.CNimbleHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-NimbleInfrastructureVolume [-Host <CNimbleHost>] [-Name <String[]>] [<CommonParameters>]
```
