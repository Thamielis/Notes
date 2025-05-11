Get-NimbleVolume
----------------

### Synopsis
Returns HPE Nimble volumes added to the backup infrastructure.

---

### Description

This cmdlet returns HPE Nimble volumes added to the backup infrastructure.

TIP: Run Get-NimbleInfrastructureVolume to get an array of volumes from HPE Nimble storage systems.

---

### Related Links
* [Get-NimbleHost](Get-NimbleHost)

---

### Examples
> Example 1

$storage = Get-NimbleHost -Name "HPE Nimble-FC"
Get-NimbleVolume -Name "VOL01" -Host $storage
This example shows how to get an HPE Nimble volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-NimbleHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-NimbleVolume cmdlet. Specify the Name parameter value. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies an array of storage systems.
The cmdlet will return volumes of these storage systems.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[CNimbleHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.Nimble.CNimbleHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-NimbleVolume [-Host <CNimbleHost[]>] [-Name <String[]>] [<CommonParameters>]
```
